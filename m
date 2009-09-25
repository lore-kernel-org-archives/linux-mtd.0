Received: from asmtpout013.mac.com ([17.148.16.88])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MqyKl-0003kn-Sz
	for linux-mtd@lists.infradead.org; Fri, 25 Sep 2009 00:06:52 +0000
MIME-version: 1.0
Content-type: text/plain; charset=windows-1252
Received: from spool003.mac.com ([10.150.69.53])
	by asmtp013.mac.com (Sun Java(tm) System Messaging Server 6.3-8.01
	(built Dec
	16 2008; 32bit)) with ESMTP id <0KQI00MEU2Z1O480@asmtp013.mac.com> for
	linux-mtd@lists.infradead.org; Thu, 24 Sep 2009 17:06:45 -0700 (PDT)
Received: from webmail070 ([10.13.128.70])
	by spool003.mac.com (Sun Java(tm) System Messaging Server 6.3-8.01
	(built Dec
	16 2008; 32bit)) with ESMTP id <0KQI00GSO2Z8WDB0@spool003.mac.com> for
	linux-mtd@lists.infradead.org; Thu, 24 Sep 2009 17:06:44 -0700 (PDT)
Date: Thu, 24 Sep 2009 17:06:44 -0700
From: Thomas Jackson <penguinroot@mac.com>
To: linux-mtd@lists.infradead.org
Message-id: <160476260691437705563209670656542882040-Webmail@me.com>
Subject: mtd-utils/flash_eraseall -j lockup
Content-transfer-encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi All,
I am experiencing lockups when using flash_eraseall =96j command to write t=
he clean markers on a Micron SLC NAND Flash Memory, part# MT29F4G08AAA.  Ke=
rnel is 2.6.26.8, proprietary on-chip NAND Flash Controller Driver, mtd-uti=
ls-1.2.0. =20

The strange observation is that if I do a =93nanddump=94 before performing =
a flash_eraseall =96j format everything is ok and the clean markers are wri=
tten.  There are no lockups if I use flash_eraseall without jffs2 formattin=
g.  I am essentially using the generic nand_base.c in drivers/mtd/nand with=
 an additional call to reset the Micron NAND after power up.  Just curious =
if the community is aware of any special sequences or patches to mtd-utils =
to resolve this lockup.   Any help in determining the cause of the lockup w=
hen using flash_eraseall will be appreciated.

Processor: ARM926EJ-S

# nanddump -p -l 0x200 /dev/mtd3
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 6
Number of bbt blockNAND: uncorrectable ECC error
NAND: uncorrectable ECC error
NAND: uncorrectable ECC error
NAND: uncorrectable ECC error
NAND: uncorrectable ECC error
NAND: uncorrectable ECC error
NAND: uncorrectable ECC error
NAND: uncorrectable ECC error
s: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000200...
ECC: 1 uncorrectable bitflip(s) at offset 0x00000000
0x00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
=85
 OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
#

# flash_eraseall -j /dev/mtd3
Erasing 128 Kibyte @ 560000 --  1 % complete. Cleanmarker written at 560000=
.
Skipping bad block at 0x00580000
Erasing 128 Kibyte @ 920000 --  1 % complete. Cleanmarker written at 920000=
.
Skipping bad block at 0x00940000
Erasing 128 Kibyte @ 4720000 -- 13 % complete. Cleanmarker written at 47200=
00.
Skipping bad block at 0x04740000
Erasing 128 Kibyte @ 8a40000 -- 27 % complete. Cleanmarker written at 8a400=
00.
Skipping bad block at 0x08a60000
Erasing 128 Kibyte @ 10fc0000 -- 53 % complete. Cleanmarker written at 10fc=
0000.
Skipping bad block at 0x10fe0000
Erasing 128 Kibyte @ 192a0000 -- 78 % complete. Cleanmarker written at 192a=
0000.
Skipping bad block at 0x192c0000
Erasing 128 Kibyte @ 20000000 -- 100 % complete.Cleanmarker written at 1ffe=
0000.
#

Thanks,
Thomas Jackson
