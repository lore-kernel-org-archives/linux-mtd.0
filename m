Received: from n1c.bullet.tw1.yahoo.com ([119.160.244.244])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L4VVO-0003IC-OY
	for linux-mtd@lists.infradead.org; Mon, 24 Nov 2008 07:05:31 +0000
Date: Mon, 24 Nov 2008 12:27:56 +0530 (IST)
From: Radha Mohan <radhamohan_ch@yahoo.com>
Subject: jffs2 mount problem on spansion S29064M90R4
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID: <890620.60966.qm@web94815.mail.in2.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,=0A=0AWe have a 8MB spansion flash S29064M90R4 on our ARM based SoC boar=
d. It is in 8-bit mode. We are trying to mount it using JFFS2 as rootfs in =
linux-2.6.15. We are getting some CRC errors when mounted for the first tim=
e after programming, but eventually the mtd gets mounted. Below are the mes=
sages.=0A=0A=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0AVFS: Mounted=
 root (jffs2 filesystem).=0AFreeing init memory: 88K=0AErase at 0x00570000 =
failed immediately: errno -5=0AData CRC b965b021 !=3D calculated CRC 206af9=
11 for node at 00104c9c=0AData CRC 26921dc4 !=3D calculated CRC 901bcdb6 fo=
r node at 001055bc=0AData CRC 14c3e2d6 !=3D calculated CRC 09455ebc for nod=
e at 00105eac=0AData CRC 4dc8ea05 !=3D calculated CRC f7967f49 for node at =
001074a0=0ANode CRC be42caec !=3D calculated CRC 3a0a3e51 for node at 00107=
e70=0AData CRC 54e450b0 !=3D calculated CRC e633629a for node at 001088e8=
=0AData CRC 234f47e5 !=3D calculated CRC 9a2970f6 for node at 00109364=0ANo=
de CRC 2996b37e !=3D calculated CRC adde47c3 for node at 00109dd8=0AData CR=
C 05104fa4 !=3D calculated CRC 2e2ad1c4 for node at 0010a764=0AData CRC 15e=
9e3c7 !=3D calculated CRC 7594f529 for node at 0010b124=0ANode CRC e18649f7=
 !=3D calculated CRC 65cebd4a for node at 0010ba40=0ANode CRC 582224b5 !=3D=
 calculated CRC c7490033 for node at 0010c400=0ANode CRC f1f47d73 !=3D calc=
ulated CRC 75bc89ce for node at 0010cb98=0AData CRC b328ff90 !=3D calculate=
d CRC 9448f40a for node at 0010d514=0AData CRC cd9e3e55 !=3D calculated CRC=
 1ba16944 for node at 0010de74=0ANode CRC 40b67fc6 !=3D calculated CRC dfdd=
5b40 for node at 0010e850=0ANode CRC ce7deb53 !=3D calculated CRC 5116cfd5 =
for node at 0010f180=0AData CRC 14c3e2d6 !=3D calculated CRC 09455ebc for n=
ode at 00105eac=0AData CRC 14c3e2d6 !=3D calculated CRC 09455ebc for node a=
t 00105eac=0AData CRC 6eda1651 !=3D calculated CRC 86d716d1 for node at 001=
0694c=0AData CRC b078238e !=3D calculated CRC 020cfd0e for node at 0010fa90=
=0ANode CRC c108f45c !=3D calculated CRC 5e63d0da for node at 001105d8=0ANo=
de CRC c58e306f !=3D calculated CRC 5ae514e9 for node at 00111040=0ANode CR=
C 9e896087 !=3D calculated CRC 1ac1943a for node at 00111a40=0ANode CRC a2e=
971fb !=3D calculated CRC 3d82557d for node at 00112358=0AData CRC 0f297499=
 !=3D calculated CRC f88bfa99 for node at 00112c0c=0AData CRC 71136fcf !=3D=
 calculated CRC ab84b771 for node at 001136ac=0ANode CRC c108f45c !=3D calc=
ulated CRC 5e63d0da for node at 001105d8=0ANode CRC c108f45c !=3D calculate=
d CRC 5e63d0da for node at 001105d8=0ANode CRC 837154db !=3D calculated CRC=
 0739a066 for node at 000c7ee4=0A  <5>JFFS2 notice: (140) read_unknown: nod=
e header CRC failed at 0x0060b0. But it must have been OK earlier.=0A=0AEra=
se at 0x00550000 failed immediately: errno -5=0AErase at 0x00530000 failed =
immediately: errno -5=0AErase at 0x00510000 failed immediately: errno -5=0A=
Erase at 0x004f0000 failed immediately: errno -5=0AErase at 0x004d0000 fail=
ed immediately: errno -5=0AErase at 0x004b0000 failed immediately: errno -5=
=0AErase at 0x00490000 failed immediately: errno -5=0AErase at 0x005e0000 f=
ailed immediately: errno -5=0AErase at 0x005b0000 failed immediately: errno=
 -5=0A=0A=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=0A=0ANow, if we restart the board after sometime, we get follo=
wing errors and the rootfs gets mounted but it was unable to find /dev/cons=
ole. I think the filesystem got corrupted.=0A=0A>>>>>>>>>>>>>>>>=0Ajffs2_sc=
an_inode_node(): CRC failed on node at 0x00486758: Read 0xffffffff, calcula=
ted 0x67d5c491=0Ajffs2_scan_dirent_node(): Node CRC failed on node at 0x004=
86988: Read 0xffffffff, calculated 0x8aa4dac6=0Ajffs2_scan_inode_node(): CR=
C failed on node at 0x004869c0: Read 0xd53a8616, calculated 0xa92246d1=0Ajf=
fs2_scan_dirent_node(): Node CRC failed on node at 0x00486a08: Read 0xfffff=
fff, calculated 0xe3c5e0bd=0Ajffs2_scan_inode_node(): CRC failed on node at=
 0x00486a38: Read 0xffffffff, calculated 0x042893a6=0Ajffs2_scan_dirent_nod=
e(): Node CRC failed on node at 0x00486a80: Read 0xffffffff, calculated 0xe=
504fee8=0Ajffs2_scan_inode_node(): CRC failed on node at 0x00486bc4: Read 0=
x7126a2ee, calculated 0x64e9d0eb=0AEmpty flash at 0x00486c4c ends at 0x0048=
6ccc=0Ajffs2_scan_inode_node(): CRC failed on node at 0x00486d3c: Read 0xff=
ffffff, calculated 0x76316d6e=0Ajffs2_scan_dirent_node(): Node CRC failed o=
n node at 0x00486dc4: Read 0xffffffff, calculated 0x42547435=0Ajffs2_scan_i=
node_node(): CRC failed on node at 0x00486f28: Read 0xffffffff, calculated =
0x4b495711=0Ajffs2_scan_inode_node(): CRC failed on node at 0x00487024: Rea=
d 0xffffffff, calculated 0x143f1edc=0Ajffs2_scan_dirent_node(): Name CRC fa=
iled on node at 0x004870dc: Read 0xffffffff, calculated 0x0e90bf81=0Ajffs2_=
scan_inode_node(): CRC failed on node at 0x004871e0: Read 0xffffffff, calcu=
lated 0x14d40e1a=0Ajffs2_scan_inode_node(): CRC failed on node at 0x004872d=
8: Read 0xffffffff, calculated 0x04ecb1a9=0Ajffs2_scan_inode_node(): CRC fa=
iled on node at 0x00487324: Read 0x4bc3bb72, calculated 0xa16bacad=0AVFS: M=
ounted root (jffs2 filesystem).=0AFreeing init memory: 88K=0AData CRC 0756a=
a39 !=3D calculated CRC be2612ff for node at 00486afc=0ARead device numbers=
 for inode 149 failed=0AWarning: unable to open an initial console.=0AJFFS2=
 notice: (104) read_dnode: header CRC failed on node at 0x486924: read 0x32=
8d1f27, calculated 0xe4f2fd21=0AJFFS2 notice: (104) read_dnode: header CRC =
failed on node at 0x4868c4: read 0x469772c5, calculated 0x9a8ab587=0AJFFS2 =
notice: (104) read_dnode: header CRC failed on node at 0x486864: read 0x8e6=
66bfa, calculated 0xb0a28de5=0AJFFS2 notice: (104) read_dnode: header CRC f=
ailed on node at 0x486804: read 0xdda3b91, calculated 0x667a24cb=0AJFFS2 no=
tice: (104) read_dnode: header CRC failed on node at 0x48679c: read 0xfffff=
fff, calculated 0x4a4275fd=0AJFFS2 warning: (104) jffs2_do_read_inode_inter=
nal: no data nodes found for ino #525=0AJFFS2 notice: (104) jffs2_do_read_i=
node_internal: but it has children so we fake some modes for it=0A=0A>>>>>>=
>>>>>>>>>>>>>>>>>>=0A=0APreviously we had an ST flash and it worked perfect=
ly. I think there might some problem with the Spansion flash. Also while pr=
ogramming the flash, the write is very very slow. It is taking about 15min.=
 to write 85 sectors of 64K sector size.=0A=0AAnyone who experienced these =
problems or has any idea about these errors??=0A=0A=0A      Download prohib=
ited? No problem. CHAT from any browser, without download. Go to http://in.=
webmessenger.yahoo.com/
