Received: from relay1.mail.timico.net ([62.121.20.91] helo=relay.timico.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OqOWz-0005F8-Fp
	for linux-mtd@lists.infradead.org; Tue, 31 Aug 2010 10:57:35 +0000
Received: from [95.177.23.22] (helo=luce.racelogic.co.uk)
	by relay.timico.net with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.69) (envelope-from <Jon.Povey@racelogic.co.uk>)
	id 1OqOWw-0002ge-K7
	for linux-mtd@lists.infradead.org; Tue, 31 Aug 2010 11:57:30 +0100
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Class: urn:content-classes:message
Date: Tue, 31 Aug 2010 11:57:28 +0100
Subject: mkfs.ubifs generating bad CRCs
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE0903E02E09@Cloud.RL.local>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
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

Building mkfs.ubifs from today's mtd-utils git I get a mkfs.ubifs that seem=
s to generate bad CRCs.
I also have ubuntu's binary mtd-utils installed which produce good CRCs. I =
tested using both versions of mkfs.ubifs and only ubuntu's ubinize for both=
 images, so can confirm ubinize is not a problem.

Related sounding thing I found:
http://lists.infradead.org/pipermail/linux-mtd/2010-July/031187.html

After flashing the image from git mkfs.ubifs I get this on my console:

...
UBI: attaching mtd3 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd3 to ubi0
UBI: MTD device name:            "root_a"
UBI: MTD device size:            32 MiB
UBI: number of good PEBs:        255
UBI: number of bad PEBs:         1
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 255
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 1/0
UBI: image sequence number: 0
...
UBIFS error (pid 1): ubifs_check_node: bad CRC: calculated 0x5ce2f518, read=
 0xf8547a9e
UBIFS error (pid 1): ubifs_check_node: bad node at LEB 0:0
UBIFS error (pid 1): ubifs_read_node: expected node type 6
VFS: Cannot open root device "ubi0:rootfs" or unknown-block(0,0)
Please append a correct "root=3D" boot option; here are the available parti=
tions:
1f00            3840 mtdblock0 (driver?)
1f01             256 mtdblock1 (driver?)
1f02           32768 mtdblock2 (driver?)
1f03           32768 mtdblock3 (driver?)
1f04           32768 mtdblock4 (driver?)
1f05           65536 mtdblock5 (driver?)
1f06           65536 mtdblock6 (driver?)
1f07          749568 mtdblock7 (driver?)
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0=
,0)
Backtrace:
[etc...]

The image generated with ubuntu's binary mtd-utils boots OK.

here is some info about my build environment; I'm on a 64-bit machine, migh=
t that be related?

$ uname -a
Linux eroko 2.6.31-22-generic #60-Ubuntu SMP Thu May 27 02:41:03 UTC 2010 x=
86_64 GNU/Linux
$ gcc -v
Using built-in specs.
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion=3D'Ubuntu 4.4.1-4ubu=
ntu9' --with-bugurl=3Dfile:///usr/share/doc/gcc-4.4/README.Bugs --enable-la=
nguages=3Dc,c++,fortran,objc,obj-c++ --prefix=3D/usr --enable-shared --enab=
le-multiarch --enable-linker-build-id --with-system-zlib --libexecdir=3D/us=
r/lib --without-included-gettext --enable-threads=3Dposix --with-gxx-includ=
e-dir=3D/usr/include/c++/4.4 --program-suffix=3D-4.4 --enable-nls --enable-=
clocale=3Dgnu --enable-libstdcxx-debug --enable-objc-gc --disable-werror --=
with-arch-32=3Di486 --with-tune=3Dgeneric --enable-checking=3Drelease --bui=
ld=3Dx86_64-linux-gnu --host=3Dx86_64-linux-gnu --target=3Dx86_64-linux-gnu
Thread model: posix
gcc version 4.4.1 (Ubuntu 4.4.1-4ubuntu9)

I note that mkfs.ubifs produces different data (and checksums) every time I=
 run it, not sure why (random IDs? changing atimes?) so not easy to bisect =
and find where this broke. testing new flash images takes some legwork.

happy to test some things or try some patches though, or if someone can tel=
l me how to get mkfs.ubifs to produce consistent images each time I can loo=
k for the problem myself a bit easier.

--
Jon Povey
jon.povey@racelogic.co.uk

Racelogic is a limited company registered in England. Registered number 274=
3719 .
Registered Office Unit 10, Swan Business Centre, Osier Way, Buckingham, Buc=
ks, MK18 1TB .

The information contained in this electronic mail transmission is intended =
by Racelogic Ltd for the use of the named individual or entity to which it =
is directed and may contain information that is confidential or privileged.=
 If you have received this electronic mail transmission in error, please de=
lete it from your system without copying or forwarding it, and notify the s=
ender of the error by reply email so that the sender's address records can =
be corrected. The views expressed by the sender of this communication do no=
t necessarily represent those of Racelogic Ltd. Please note that Racelogic =
reserves the right to monitor e-mail communications passing through its net=
work
