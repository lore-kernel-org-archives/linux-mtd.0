Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLuQp-0003kf-66
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2013 12:31:03 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Andrei Andreyanau <a.andreyanau@sam-solutions.com>
Subject: RE: Incorrect detection of Micron MT29F32G08
Date: Tue, 17 Sep 2013 12:30:34 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA13155@DBDE04.ent.ti.com>
References: <5237FE9A.5080707@sam-solutions.com>
In-Reply-To: <5237FE9A.5080707@sam-solutions.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=20
> Hi,
> I've faced a problem with the Micron NAND MT29F32G08,
> which is 4GiBs, 8K blocks per LUN, 224b OOB, 512K erase size,
> has two planes 4k blocks each. In the kernel (I use v3.0.35)
> it is detected as 2GiB device. Only when I disable part of the
> code which belongs to ONFI detection, add definition for this
> device in nand_ids.c (device has id=3D0x48), add 224b OOB table,
> I can see that it's a 4GiBs device, but when I'm trying formatting
> the largest partition (I have 4 partitions - barebox, env, kernel,
> rootfs <- the largest) - it drops an I/O error about bad blocks
> (I did scan and mark all bad blocks before)...
> It seems to me that the amount of pages per lun is not detected
> correctly which leads to incorrect detection of device's size etc. Bad
> thing is that the datasheet for a/m NAND doesn't contain what
> are the values from NAND-device registers mean (or I missed something).
> Could you please suggest where to dig?
>=20
You can try printing values of following towards end of
nand_scan_tail() in drivers/mtd/nand/nand_base.c
- mtd->writesize
- mtd->erasesize
- mtd->oobsize

Too many bad block on new device usually happen due to:
(1) wrong ecc.layout in nand driver
	Use following command to dump ecc.layout
	'nanddump -p -N -n -s <offset> -l <page_size> </dev/mtdx>

(2) incorrect pin-mux (like muxing only AD[7:0] instead of AD[15:0]
	(usually case with x16 devices, but yours is x8)

However, once bad-blocks are detected, they are marked
permanently, So you need to use 'nand scrub' command at u-boot to
clear off all Bad-block markers before testing next time.

with regards, pekon
