Received: from snt0-omc1-s23.snt0.hotmail.com ([65.55.90.34])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1Jp9-0004oi-KB
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2014 17:55:20 +0000
Message-ID: <SNT149-W18FE0A877110C186A4B70184B00@phx.gbl>
From: C J <ccs_dba@hotmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: ubiattach error
Date: Thu, 9 Jan 2014 10:54:57 -0700
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a small 'ARMv7 Processor rev 2 (v7l)' powered box running Ubuntu 10.=
04 LTS with kernel 2.6.37=A0 The environment is a squashfs rootfs with a sm=
all RW config area:=0A=
=0A=
# df=0A=
Filesystem=A0=A0=A0=A0=A0=A0 1K-blocks=A0=A0=A0=A0=A0 Used Available Use% M=
ounted on=0A=
/dev/mtdblock11=A0=A0=A0=A0 246664=A0=A0=A0 246664=A0=A0=A0=A0=A0=A0=A0=A0 =
0 100% /=0A=
ubi1_0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 6648=A0=A0=A0=A0=A0=A0 =
100=A0=A0=A0=A0=A0 6548=A0=A0 2% /.profile=0A=
=0A=
The box boots and operates without problems=2C however I am trying to acces=
s some of the /dev/mtd devices but receive errors when trying to attach:=0A=
=0A=
# /usr/sbin/ubiattach /dev/ubi_ctrl -m 3=0A=
=0A=
[2335587.812500] UBI: attaching mtd3 to ubi2=0A=
[2335587.812500] UBI: physical eraseblock size:=A0=A0 131072 bytes (128 KiB=
)=0A=
[2335587.812500] UBI: logical eraseblock size:=A0=A0=A0 129024 bytes=0A=
[2335587.812500] UBI: smallest flash I/O unit:=A0=A0=A0 2048=0A=
[2335587.812500] UBI: sub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 512=0A=
[2335587.812500] UBI: VID header offset:=A0=A0=A0=A0=A0=A0=A0=A0=A0 512 (al=
igned 512)=0A=
[2335587.812500] UBI: data offset:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 2048=0A=
[2335587.820312] UBI: max. sequence number:=A0=A0=A0=A0=A0=A0 0=0A=
[2335587.820312] UBI error: ubi_read_volume_table: the layout volume was no=
t found=0A=
=0A=
Some devices I can access=2C but most I cannot.=A0 Example: /dev/mtd10 I ca=
n attach to but not /dev/mtd5=0A=
=0A=
# /usr/sbin/mtdinfo /dev/mtd10 -u=0A=
mtd10=0A=
Name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 backup=0A=
Type:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 nand=0A=
Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 131072 bytes=
=2C 128.0 KiB=0A=
Amount of eraseblocks:=A0=A0=A0=A0=A0=A0=A0=A0=A0 320 (41943040 bytes=2C 40=
.0 MiB)=0A=
Minimum input/output unit size: 2048 bytes=0A=
Sub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 512 bytes=
=0A=
OOB size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 64 bytes=0A=
Character device major/minor:=A0=A0 90:20=0A=
Bad blocks are allowed:=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
Device is writable:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
Default UBI VID header offset:=A0 512=0A=
Default UBI data offset:=A0=A0=A0=A0=A0=A0=A0 2048=0A=
Default UBI LEB size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 129024 bytes=2C 126.0 K=
iB=0A=
Maximum UBI volumes count:=A0=A0=A0=A0=A0 128=0A=
=0A=
# /usr/sbin/mtdinfo /dev/mtd5 -u=0A=
mtd5=0A=
Name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 initrd=0A=
Type:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 nand=0A=
Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 131072 bytes=
=2C 128.0 KiB=0A=
Amount of eraseblocks:=A0=A0=A0=A0=A0=A0=A0=A0=A0 96 (12582912 bytes=2C 12.=
0 MiB)=0A=
Minimum input/output unit size: 2048 bytes=0A=
Sub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 512 bytes=
=0A=
OOB size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 64 bytes=0A=
Character device major/minor:=A0=A0 90:10=0A=
Bad blocks are allowed:=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
Device is writable:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
Default UBI VID header offset:=A0 512=0A=
Default UBI data offset:=A0=A0=A0=A0=A0=A0=A0 2048=0A=
Default UBI LEB size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 129024 bytes=2C 126.0 K=
iB=0A=
Maximum UBI volumes count:=A0=A0=A0=A0=A0 128=0A=
=0A=
Installed utilities are version 1.4.5=0A=
=0A=
Looking for help to find out why I can't attach..=0A=
=0A=
Thanks=2C=0A=
=0A=
-Craig 		 	   		  =
