class Server {
  final String address;
  final String executable;

  Server(this.address, this.executable);

  Server.fromJson(Map<String, dynamic> json)
      : address = json['address'],
        executable = json['executable'];

  Map<String, dynamic> toJson() => {
    'address': address,
    'executable': executable,
  };
}