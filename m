Received: from n1a.bullet.tw1.yahoo.com ([119.160.244.188])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L5vgu-0003Ki-0S
	for linux-mtd@lists.infradead.org; Fri, 28 Nov 2008 05:14:57 +0000
References: <890620.60966.qm@web94815.mail.in2.yahoo.com>
	<569380.15307.qm@web94807.mail.in2.yahoo.com>
	<1227847111.3126.8.camel@Ani>
Date: Fri, 28 Nov 2008 10:37:58 +0530 (IST)
From: Radha Mohan <radhamohan_ch@yahoo.com>
Subject: Re: jffs2 mount problem on spansion S29064M90R4
To: Aneesh <aneesh_g@cms.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID: <723573.77016.qm@web94814.mail.in2.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,=0AThanks for the reply Aneesh. =0AWe have two boards here with the same=
 flash and both are behaving same. We even re-checked the system interface =
layout to the chip. Are you suggesting that there might be a problem in the=
 Spansion flash part itself. But we are able to read/erase/write to flash f=
rom the bootloader (u-boot). Even the "ls" command from u-boot is showing t=
he directories correctly without any errors, if we do not boot linux yet. B=
ut if we boot linux and go back to u-boot and do "ls" it shows some undefin=
ed nodes (same node numbers for which errors were shown in linux booting) a=
nd eventually shows the directory entries.=0A=0ARegards,=0AMohan=0A=0A=0A=
=0A----- Original Message ----=0AFrom: Aneesh <aneesh_g@cms.com>=0ATo: Radh=
a Mohan <radhamohan_ch@yahoo.com>=0ASent: Friday, 28 November, 2008 10:08:3=
1 AM=0ASubject: Re: jffs2 mount problem on spansion S29064M90R4=0A=0AHi,=0A=
    I got a similar error like this on an ATMEL 8MB parallel flash.The=0Apr=
oblem was , a break in one of the address line of the parallel=0Aflash.(mea=
ns it was a hardware problem).=0A    =0A=0AOn Fri, 2008-11-28 at 09:50 +053=
0, Radha Mohan wrote:=0A> Please anyone reply to this query.=0A> None has a=
ny idea about this??=0A> =0A> =0A> =0A> ----- Original Message ----=0A> Fro=
m: Radha Mohan <radhamohan_ch@yahoo.com>=0A> To: linux-mtd@lists.infradead.=
org=0A> Sent: Monday, 24 November, 2008 12:27:56 PM=0A> Subject: jffs2 moun=
t problem on spansion S29064M90R4=0A> =0A> Hi,=0A> =0A> We have a 8MB spans=
ion flash S29064M90R4 on our ARM based SoC board. It is in 8-bit mode. We a=
re trying to mount it using JFFS2 as rootfs in linux-2.6.15. We are getting=
 some CRC errors when mounted for the first time after programming, but eve=
ntually the mtd gets mounted. Below are the messages.=0A> =0A> =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A> VFS: Mounted root (jffs2 filesyste=
m).=0A> Freeing init memory: 88K=0A> Erase at 0x00570000 failed immediately=
: errno -5=0A> Data CRC b965b021 !=3D calculated CRC 206af911 for node at 0=
0104c9c=0A> Data CRC 26921dc4 !=3D calculated CRC 901bcdb6 for node at 0010=
55bc=0A> Data CRC 14c3e2d6 !=3D calculated CRC 09455ebc for node at 00105ea=
c=0A> Data CRC 4dc8ea05 !=3D calculated CRC f7967f49 for node at 001074a0=
=0A> Node CRC be42caec !=3D calculated CRC 3a0a3e51 for node at 00107e70=0A=
> Data CRC 54e450b0 !=3D calculated CRC e633629a for node at 001088e8=0A> D=
ata CRC 234f47e5 !=3D calculated CRC 9a2970f6 for node at 00109364=0A> Node=
 CRC 2996b37e !=3D calculated CRC adde47c3 for node at 00109dd8=0A> Data CR=
C 05104fa4 !=3D calculated CRC 2e2ad1c4 for node at 0010a764=0A> Data CRC 1=
5e9e3c7 !=3D calculated CRC 7594f529 for node at 0010b124=0A> Node CRC e186=
49f7 !=3D calculated CRC 65cebd4a for node at 0010ba40=0A> Node CRC 582224b=
5 !=3D calculated CRC c7490033 for node at 0010c400=0A> Node CRC f1f47d73 !=
=3D calculated CRC 75bc89ce for node at 0010cb98=0A> Data CRC b328ff90 !=3D=
 calculated CRC 9448f40a for node at 0010d514=0A> Data CRC cd9e3e55 !=3D ca=
lculated CRC 1ba16944 for node at 0010de74=0A> Node CRC 40b67fc6 !=3D calcu=
lated CRC dfdd5b40 for node at 0010e850=0A> Node CRC ce7deb53 !=3D calculat=
ed CRC 5116cfd5 for node at 0010f180=0A> Data CRC 14c3e2d6 !=3D calculated =
CRC 09455ebc for node at 00105eac=0A> Data CRC 14c3e2d6 !=3D calculated CRC=
 09455ebc for node at 00105eac=0A> Data CRC 6eda1651 !=3D calculated CRC 86=
d716d1 for node at 0010694c=0A> Data CRC b078238e !=3D calculated CRC 020cf=
d0e for node at 0010fa90=0A> Node CRC c108f45c !=3D calculated CRC 5e63d0da=
 for node at 001105d8=0A> Node CRC c58e306f !=3D calculated CRC 5ae514e9 fo=
r node at 00111040=0A> Node CRC 9e896087 !=3D calculated CRC 1ac1943a for n=
ode at 00111a40=0A> Node CRC a2e971fb !=3D calculated CRC 3d82557d for node=
 at 00112358=0A> Data CRC 0f297499 !=3D calculated CRC f88bfa99 for node at=
 00112c0c=0A> Data CRC 71136fcf !=3D calculated CRC ab84b771 for node at 00=
1136ac=0A> Node CRC c108f45c !=3D calculated CRC 5e63d0da for node at 00110=
5d8=0A> Node CRC c108f45c !=3D calculated CRC 5e63d0da for node at 001105d8=
=0A> Node CRC 837154db !=3D calculated CRC 0739a066 for node at 000c7ee4=0A=
>   <5>JFFS2 notice: (140) read_unknown: node header CRC failed at 0x0060b0=
.. But it must have been OK earlier.=0A> =0A> Erase at 0x00550000 failed imm=
ediately: errno -5=0A> Erase at 0x00530000 failed immediately: errno -5=0A>=
 Erase at 0x00510000 failed immediately: errno -5=0A> Erase at 0x004f0000 f=
ailed immediately: errno -5=0A> Erase at 0x004d0000 failed immediately: err=
no -5=0A> Erase at 0x004b0000 failed immediately: errno -5=0A> Erase at 0x0=
0490000 failed immediately: errno -5=0A> Erase at 0x005e0000 failed immedia=
tely: errno -5=0A> Erase at 0x005b0000 failed immediately: errno -5=0A> =0A=
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=0A> =0A> Now, if we restart the board after sometime, we get followi=
ng errors and the rootfs gets mounted but it was unable to find /dev/consol=
e.. I think the filesystem got corrupted.=0A> =0A> >>>>>>>>>>>>>>>>=0A> jff=
s2_scan_inode_node(): CRC failed on node at 0x00486758: Read 0xffffffff, ca=
lculated 0x67d5c491=0A> jffs2_scan_dirent_node(): Node CRC failed on node a=
t 0x00486988: Read 0xffffffff, calculated 0x8aa4dac6=0A> jffs2_scan_inode_n=
ode(): CRC failed on node at 0x004869c0: Read 0xd53a8616, calculated 0xa922=
46d1=0A> jffs2_scan_dirent_node(): Node CRC failed on node at 0x00486a08: R=
ead 0xffffffff, calculated 0xe3c5e0bd=0A> jffs2_scan_inode_node(): CRC fail=
ed on node at 0x00486a38: Read 0xffffffff, calculated 0x042893a6=0A> jffs2_=
scan_dirent_node(): Node CRC failed on node at 0x00486a80: Read 0xffffffff,=
 calculated 0xe504fee8=0A> jffs2_scan_inode_node(): CRC failed on node at 0=
x00486bc4: Read 0x7126a2ee, calculated 0x64e9d0eb=0A> Empty flash at 0x0048=
6c4c ends at 0x00486ccc=0A> jffs2_scan_inode_node(): CRC failed on node at =
0x00486d3c: Read 0xffffffff, calculated 0x76316d6e=0A> jffs2_scan_dirent_no=
de(): Node CRC failed on node at 0x00486dc4: Read 0xffffffff, calculated 0x=
42547435=0A> jffs2_scan_inode_node(): CRC failed on node at 0x00486f28: Rea=
d 0xffffffff, calculated 0x4b495711=0A> jffs2_scan_inode_node(): CRC failed=
 on node at 0x00487024: Read 0xffffffff, calculated 0x143f1edc=0A> jffs2_sc=
an_dirent_node(): Name CRC failed on node at 0x004870dc: Read 0xffffffff, c=
alculated 0x0e90bf81=0A> jffs2_scan_inode_node(): CRC failed on node at 0x0=
04871e0: Read 0xffffffff, calculated 0x14d40e1a=0A> jffs2_scan_inode_node()=
: CRC failed on node at 0x004872d8: Read 0xffffffff, calculated 0x04ecb1a9=
=0A> jffs2_scan_inode_node(): CRC failed on node at 0x00487324: Read 0x4bc3=
bb72, calculated 0xa16bacad=0A> VFS: Mounted root (jffs2 filesystem).=0A> F=
reeing init memory: 88K=0A> Data CRC 0756aa39 !=3D calculated CRC be2612ff =
for node at 00486afc=0A> Read device numbers for inode 149 failed=0A> Warni=
ng: unable to open an initial console.=0A> JFFS2 notice: (104) read_dnode: =
header CRC failed on node at 0x486924: read 0x328d1f27, calculated 0xe4f2fd=
21=0A> JFFS2 notice: (104) read_dnode: header CRC failed on node at 0x4868c=
4: read 0x469772c5, calculated 0x9a8ab587=0A> JFFS2 notice: (104) read_dnod=
e: header CRC failed on node at 0x486864: read 0x8e666bfa, calculated 0xb0a=
28de5=0A> JFFS2 notice: (104) read_dnode: header CRC failed on node at 0x48=
6804: read 0xdda3b91, calculated 0x667a24cb=0A> JFFS2 notice: (104) read_dn=
ode: header CRC failed on node at 0x48679c: read 0xffffffff, calculated 0x4=
a4275fd=0A> JFFS2 warning: (104) jffs2_do_read_inode_internal: no data node=
s found for ino #525=0A> JFFS2 notice: (104) jffs2_do_read_inode_internal: =
but it has children so we fake some modes for it=0A> =0A> >>>>>>>>>>>>>>>>>=
>>>>>>>=0A> =0A> Previously we had an ST flash and it worked perfectly. I t=
hink there might some problem with the Spansion flash. Also while programmi=
ng the flash, the write is very very slow. It is taking about 15min. to wri=
te 85 sectors of 64K sector size.=0A> =0A> Anyone who experienced these pro=
blems or has any idea about these errors??=0A> =0A> =0A>       Download pro=
hibited? No problem. CHAT from any browser, without download. Go to http://=
in.webmessenger.yahoo.com/=0A> =0A> =0A> __________________________________=
____________________=0A> Linux MTD discussion mailing list=0A> http://lists=
..infradead.org/mailman/listinfo/linux-mtd/=0A> =0A> =0A> =0A>       Add mor=
e friends to your messenger and enjoy! Go to http://messenger.yahoo.com/inv=
ite/=0A> =0A> =0A> ______________________________________________________=
=0A> Linux MTD discussion mailing list=0A> http://lists.infradead.org/mailm=
an/listinfo/linux-mtd/=0A> =0AThanks And Regards=0AAneesh=0A=0A=0A      Unl=
imited freedom, unlimited storage. Get it now, on http://help.yahoo.com/l/i=
n/yahoo/mail/yahoomail/tools/tools-08.html/
