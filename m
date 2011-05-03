Received: from nm1-vm0.access.bullet.mail.mud.yahoo.com ([66.94.236.27])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QH8wV-0004zH-GC
	for linux-mtd@lists.infradead.org; Tue, 03 May 2011 06:18:44 +0000
Message-ID: <333886.29917.qm@web82501.mail.mud.yahoo.com>
Date: Mon, 2 May 2011 23:18:41 -0700 (PDT)
From: osterluk@yahoo.com
Subject: Need help with NAND flash corruption problem using JFFS2
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Basically, I get file holes -- 4KB chunks go missing from files not activel=
y =0Abeing written.  The holes occur at various places in the files -- not =
a certain =0Aoffset.  I need some ideas on how to troubleshoot the problem.=
=0A=0A=0AI fill a jffs2 partition with about 180 MiB of =E2=80=98ballast=E2=
=80=99 files and start a file =0Awriter process that consumes about 120 pag=
es/second =E2=80=93 to force eraseblocks to =0Aget cycled.  After about 1/2=
 hour or so, the total number of pages on the =0Apartition will have been w=
ritten.  I run md5sum to check the files.   I get =0Aabout one or two failu=
res on an overnight run.  The bad files are exactly four =0AKB shorter than=
 when the test started.=0A=0ANow power cycling or reboots are happening.  =
=0A=0A=0AI'm using a kernel originally developed/sponsored by Samsung for t=
he s3c2413.  =0AThe kernel is based on 2.6.26.6 with edits from Samsung and=
 others.  I realize =0Athis processor is supported from upstream sources no=
w, but I'm not in a position =0A=0Ato move to it yet.  The kernel configura=
tion is a lot like smdk2412_defconfig, =0Abut I have a x16 NAND.=0A=0A=0AI =
don't think I'm having SDRAM memory problems, things would be much worse.  =
I =0Acan run the nand tests from the snapshot mtd-utils-3c19d07 with no pro=
blems =0Aindicated.  I suspect some problem during garbage collection.=0A=
=0AI tried turning up the verbosity on jffs2, but the target slows to a cra=
wl -- I =0Aneed to try to log to the network instead.  I tried to force cle=
an blocks to get =0A=0Aused more often, but I overshot that too and slowed =
the system to much -- and =0Aright about that time I found I could get a fe=
w errors overnight.=0A=0A=0AHere is a clip from /var/log/messages showing a=
 case where a file was modified =0Aovernight:=0A=0AApr 18 04:04:06 nbox-3A5=
6 -- MARK --=0AApr 18 04:08:08 nbox-3A56 kernel: jffs2_flush_wbuf(): Write =
failed with -5=0AApr 18 04:08:08 nbox-3A56 kernel: Write of 4164 bytes at 0=
x03955058 failed. =0Areturned -5, retlen 0=0AApr 18 04:08:08 nbox-3A56 kern=
el: Not marking the space at 0x03955058 as dirty =0Abecause the flash drive=
r returned retlen zero=0AApr 18 04:24:06 nbox-3A56 -- MARK --=0AApr 18 04:4=
4:06 nbox-3A56 -- MARK --=0AApr 18 05:04:07 nbox-3A56 -- MARK --=0AApr 18 0=
5:24:07 nbox-3A56 -- MARK --=0AApr 18 05:44:07 nbox-3A56 -- MARK --=0AApr 1=
8 06:04:07 nbox-3A56 -- MARK --=0AApr 18 06:24:07 nbox-3A56 -- MARK --=0AAp=
r 18 06:44:08 nbox-3A56 -- MARK --=0AApr 18 07:04:08 nbox-3A56 -- MARK --=
=0AApr 18 07:24:08 nbox-3A56 -- MARK --=0AApr 18 07:44:08 nbox-3A56 -- MARK=
 --=0AApr 18 08:04:08 nbox-3A56 -- MARK --=0AApr 18 08:24:09 nbox-3A56 -- M=
ARK --=0AApr 18 08:44:09 nbox-3A56 -- MARK --=0AApr 18 09:04:09 nbox-3A56 -=
- MARK --=0AApr 18 09:24:09 nbox-3A56 -- MARK --=0AApr 18 09:44:09 nbox-3A5=
6 -- MARK --=0AApr 18 10:04:10 nbox-3A56 -- MARK --=0AApr 18 10:12:24 nbox-=
3A56 kernel: Node CRC failed on REF_PRISTINE data node at =0A0x022e1058: Re=
ad 0x1038da5e, calculated 0x10b8da5e=0AApr 18 10:12:24 nbox-3A56 kernel: No=
de CRC 1038da5e !=3D calculated CRC 10b8da5e =0Afor node at 022e1058=0AApr =
18 10:12:24 nbox-3A56 kernel: Node CRC 1038da5e !=3D calculated CRC 10b8da5=
e =0Afor node at 022e1058=0AApr 18 10:24:10 nbox-3A56 -- MARK -=0A=0A Any h=
elp would be greatly appreciated.=0A
