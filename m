Received: from ns.pmeerw.net ([87.118.82.44] helo=pmeerw.net)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vowo7-0008Oh-3H
 for linux-mtd@lists.infradead.org; Fri, 06 Dec 2013 14:55:08 +0000
Date: Fri, 6 Dec 2013 15:54:39 +0100 (CET)
From: Peter Meerwald <pmeerw@pmeerw.net>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Subject: Re: OMAP3 NAND ECC selection
In-Reply-To: <CAFqH_50vhgJ=ktqmYRo+ZO1bbRmiME+kXVt6sLJL91q9A2S7TA@mail.gmail.com>
Message-ID: <alpine.DEB.2.01.1312061545020.26830@pmeerw.net>
References: <alpine.DEB.2.01.1312051000270.17561@pmeerw.net>
 <CAFqH_50vhgJ=ktqmYRo+ZO1bbRmiME+kXVt6sLJL91q9A2S7TA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, 

> Meanwhile, to do this we use a small userspace program created by
> Javier Martinez in order to flash the MLO in our OMAP3 boards. See
> 
> http://git.isee.biz/?p=pub/scm/writeloader.git;a=summary

I tried this with a 3.7 kernel and the following NAND; it does not work 
for me

# ./writeloader -i /boot/u-boot.img  -o /dev/mtd1
Error writing ECC in OOB area: Invalid argument

nand_do_write_oob() in nand_base.c fails with
	if ((ops->ooboffs + ops->ooblen) > len) {
		pr_debug("%s: attempt to write past end of page\n",
				__func__);
		return -EINVAL;
	}

ops->ooboffs, ops->ooblen, len is 1536, 64, 64, resp.

write_ecc() in writeloader.c does
	oob.start = (sector_cnt - 1) * SECTOR_SIZE;
	oob.ptr = oobbuf;
	oob.length = 64;

	return ioctl(ofd, MEMWRITEOOB, &oob) != 0;
where sector_cnt is 4

this looks weird to me -- any ideas?

NAND device: Manufacturer ID: 0x2c, Chip ID: 0xbc (Micron NAND 512MiB 1,8V 16-bit), page size: 2048, OOB size: 64

# ./mtdinfo  -a
Count of MTD devices:           6
Present MTD devices:            mtd0, mtd1, mtd2, mtd3, mtd4, mtd5
Sysfs interface supported:      yes

mtd0
Name:                           MLO
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          4 (524288 bytes, 512.0 KiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:0
Bad blocks are allowed:         true
Device is writable:             true

mtd1
Name:                           u-Boot
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          4 (524288 bytes, 512.0 KiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:2
Bad blocks are allowed:         true
Device is writable:             true

thanks, regards, p.

-- 

Peter Meerwald
+43-664-2444418 (mobile)
