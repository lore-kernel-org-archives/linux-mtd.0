Received: from n2a.bullet.in.yahoo.com ([202.43.219.19])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L5ups-0002Zj-PP
	for linux-mtd@lists.infradead.org; Fri, 28 Nov 2008 04:20:10 +0000
References: <890620.60966.qm@web94815.mail.in2.yahoo.com>
Date: Fri, 28 Nov 2008 09:50:06 +0530 (IST)
From: Radha Mohan <radhamohan_ch@yahoo.com>
Subject: Re: jffs2 mount problem on spansion S29064M90R4
To: Radha Mohan <radhamohan_ch@yahoo.com>, linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID: <569380.15307.qm@web94807.mail.in2.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please anyone reply to this query.=0ANone has any idea about this??=0A=0A=
=0A=0A----- Original Message ----=0AFrom: Radha Mohan <radhamohan_ch@yahoo.=
com>=0ATo: linux-mtd@lists.infradead.org=0ASent: Monday, 24 November, 2008 =
12:27:56 PM=0ASubject: jffs2 mount problem on spansion S29064M90R4=0A=0AHi,=
=0A=0AWe have a 8MB spansion flash S29064M90R4 on our ARM based SoC board. =
It is in 8-bit mode. We are trying to mount it using JFFS2 as rootfs in lin=
ux-2.6.15. We are getting some CRC errors when mounted for the first time a=
fter programming, but eventually the mtd gets mounted. Below are the messag=
es.=0A=0A=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0AVFS: Mounted ro=
ot (jffs2 filesystem).=0AFreeing init memory: 88K=0AErase at 0x00570000 fai=
led immediately: errno -5=0AData CRC b965b021 !=3D calculated CRC 206af911 =
for node at 00104c9c=0AData CRC 26921dc4 !=3D calculated CRC 901bcdb6 for n=
ode at 001055bc=0AData CRC 14c3e2d6 !=3D calculated CRC 09455ebc for node a=
t 00105eac=0AData CRC 4dc8ea05 !=3D calculated CRC f7967f49 for node at 001=
074a0=0ANode CRC be42caec !=3D calculated CRC 3a0a3e51 for node at 00107e70=
=0AData CRC 54e450b0 !=3D calculated CRC e633629a for node at 001088e8=0ADa=
ta CRC 234f47e5 !=3D calculated CRC 9a2970f6 for node at 00109364=0ANode CR=
C 2996b37e !=3D calculated CRC adde47c3 for node at 00109dd8=0AData CRC 051=
04fa4 !=3D calculated CRC 2e2ad1c4 for node at 0010a764=0AData CRC 15e9e3c7=
 !=3D calculated CRC 7594f529 for node at 0010b124=0ANode CRC e18649f7 !=3D=
 calculated CRC 65cebd4a for node at 0010ba40=0ANode CRC 582224b5 !=3D calc=
ulated CRC c7490033 for node at 0010c400=0ANode CRC f1f47d73 !=3D calculate=
d CRC 75bc89ce for node at 0010cb98=0AData CRC b328ff90 !=3D calculated CRC=
 9448f40a for node at 0010d514=0AData CRC cd9e3e55 !=3D calculated CRC 1ba1=
6944 for node at 0010de74=0ANode CRC 40b67fc6 !=3D calculated CRC dfdd5b40 =
for node at 0010e850=0ANode CRC ce7deb53 !=3D calculated CRC 5116cfd5 for n=
ode at 0010f180=0AData CRC 14c3e2d6 !=3D calculated CRC 09455ebc for node a=
t 00105eac=0AData CRC 14c3e2d6 !=3D calculated CRC 09455ebc for node at 001=
05eac=0AData CRC 6eda1651 !=3D calculated CRC 86d716d1 for node at 0010694c=
=0AData CRC b078238e !=3D calculated CRC 020cfd0e for node at 0010fa90=0ANo=
de CRC c108f45c !=3D calculated CRC 5e63d0da for node at 001105d8=0ANode CR=
C c58e306f !=3D calculated CRC 5ae514e9 for node at 00111040=0ANode CRC 9e8=
96087 !=3D calculated CRC 1ac1943a for node at 00111a40=0ANode CRC a2e971fb=
 !=3D calculated CRC 3d82557d for node at 00112358=0AData CRC 0f297499 !=3D=
 calculated CRC f88bfa99 for node at 00112c0c=0AData CRC 71136fcf !=3D calc=
ulated CRC ab84b771 for node at 001136ac=0ANode CRC c108f45c !=3D calculate=
d CRC 5e63d0da for node at 001105d8=0ANode CRC c108f45c !=3D calculated CRC=
 5e63d0da for node at 001105d8=0ANode CRC 837154db !=3D calculated CRC 0739=
a066 for node at 000c7ee4=0A  <5>JFFS2 notice: (140) read_unknown: node hea=
der CRC failed at 0x0060b0. But it must have been OK earlier.=0A=0AErase at=
 0x00550000 failed immediately: errno -5=0AErase at 0x00530000 failed immed=
iately: errno -5=0AErase at 0x00510000 failed immediately: errno -5=0AErase=
 at 0x004f0000 failed immediately: errno -5=0AErase at 0x004d0000 failed im=
mediately: errno -5=0AErase at 0x004b0000 failed immediately: errno -5=0AEr=
ase at 0x00490000 failed immediately: errno -5=0AErase at 0x005e0000 failed=
 immediately: errno -5=0AErase at 0x005b0000 failed immediately: errno -5=
=0A=0A=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=0A=0ANow, if we restart the board after sometime, we get followin=
g errors and the rootfs gets mounted but it was unable to find /dev/console=
.. I think the filesystem got corrupted.=0A=0A>>>>>>>>>>>>>>>>=0Ajffs2_scan_=
inode_node(): CRC failed on node at 0x00486758: Read 0xffffffff, calculated=
 0x67d5c491=0Ajffs2_scan_dirent_node(): Node CRC failed on node at 0x004869=
88: Read 0xffffffff, calculated 0x8aa4dac6=0Ajffs2_scan_inode_node(): CRC f=
ailed on node at 0x004869c0: Read 0xd53a8616, calculated 0xa92246d1=0Ajffs2=
_scan_dirent_node(): Node CRC failed on node at 0x00486a08: Read 0xffffffff=
, calculated 0xe3c5e0bd=0Ajffs2_scan_inode_node(): CRC failed on node at 0x=
00486a38: Read 0xffffffff, calculated 0x042893a6=0Ajffs2_scan_dirent_node()=
: Node CRC failed on node at 0x00486a80: Read 0xffffffff, calculated 0xe504=
fee8=0Ajffs2_scan_inode_node(): CRC failed on node at 0x00486bc4: Read 0x71=
26a2ee, calculated 0x64e9d0eb=0AEmpty flash at 0x00486c4c ends at 0x00486cc=
c=0Ajffs2_scan_inode_node(): CRC failed on node at 0x00486d3c: Read 0xfffff=
fff, calculated 0x76316d6e=0Ajffs2_scan_dirent_node(): Node CRC failed on n=
ode at 0x00486dc4: Read 0xffffffff, calculated 0x42547435=0Ajffs2_scan_inod=
e_node(): CRC failed on node at 0x00486f28: Read 0xffffffff, calculated 0x4=
b495711=0Ajffs2_scan_inode_node(): CRC failed on node at 0x00487024: Read 0=
xffffffff, calculated 0x143f1edc=0Ajffs2_scan_dirent_node(): Name CRC faile=
d on node at 0x004870dc: Read 0xffffffff, calculated 0x0e90bf81=0Ajffs2_sca=
n_inode_node(): CRC failed on node at 0x004871e0: Read 0xffffffff, calculat=
ed 0x14d40e1a=0Ajffs2_scan_inode_node(): CRC failed on node at 0x004872d8: =
Read 0xffffffff, calculated 0x04ecb1a9=0Ajffs2_scan_inode_node(): CRC faile=
d on node at 0x00487324: Read 0x4bc3bb72, calculated 0xa16bacad=0AVFS: Moun=
ted root (jffs2 filesystem).=0AFreeing init memory: 88K=0AData CRC 0756aa39=
 !=3D calculated CRC be2612ff for node at 00486afc=0ARead device numbers fo=
r inode 149 failed=0AWarning: unable to open an initial console.=0AJFFS2 no=
tice: (104) read_dnode: header CRC failed on node at 0x486924: read 0x328d1=
f27, calculated 0xe4f2fd21=0AJFFS2 notice: (104) read_dnode: header CRC fai=
led on node at 0x4868c4: read 0x469772c5, calculated 0x9a8ab587=0AJFFS2 not=
ice: (104) read_dnode: header CRC failed on node at 0x486864: read 0x8e666b=
fa, calculated 0xb0a28de5=0AJFFS2 notice: (104) read_dnode: header CRC fail=
ed on node at 0x486804: read 0xdda3b91, calculated 0x667a24cb=0AJFFS2 notic=
e: (104) read_dnode: header CRC failed on node at 0x48679c: read 0xffffffff=
, calculated 0x4a4275fd=0AJFFS2 warning: (104) jffs2_do_read_inode_internal=
: no data nodes found for ino #525=0AJFFS2 notice: (104) jffs2_do_read_inod=
e_internal: but it has children so we fake some modes for it=0A=0A>>>>>>>>>=
>>>>>>>>>>>>>>>=0A=0APreviously we had an ST flash and it worked perfectly.=
 I think there might some problem with the Spansion flash. Also while progr=
amming the flash, the write is very very slow. It is taking about 15min. to=
 write 85 sectors of 64K sector size.=0A=0AAnyone who experienced these pro=
blems or has any idea about these errors??=0A=0A=0A      Download prohibite=
d? No problem. CHAT from any browser, without download. Go to http://in.web=
messenger.yahoo.com/=0A=0A=0A______________________________________________=
________=0ALinux MTD discussion mailing list=0Ahttp://lists.infradead.org/m=
ailman/listinfo/linux-mtd/=0A=0A=0A=0A      Add more friends to your messen=
ger and enjoy! Go to http://messenger.yahoo.com/invite/
