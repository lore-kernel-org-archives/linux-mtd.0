Received: from gw1.transmode.se ([195.58.98.146])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RxiGJ-0005dZ-87
 for linux-mtd@lists.infradead.org; Wed, 15 Feb 2012 17:03:24 +0000
In-Reply-To: <A116BBDA09FF5D488D7DB1E6C97F7550B04B2E@RASRV02.prettl-elektronik.de>
References: <A116BBDA09FF5D488D7DB1E6C97F7550B04B2E@RASRV02.prettl-elektronik.de>
Subject: Re: JFFS2: file damages after write: Where to start investigation
To: "Weickelt, Richard \(lesswire AG\)" <Weickelt@lesswire.com>
Message-ID: <OFC5F687EB.B4D1BC60-ONC12579A5.005B6B46-C12579A5.005DAD17@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 15 Feb 2012 18:03:11 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>
> Dear all,
>
> I have linux 2.6.38 running on an Freescale i.MX25 with a 64MiB NAND
> Flash and a jffs2 root file system mounted RW. After initial flashing
> with U-Boot the system runs stand-alone and reads/writes from time to
> time some text files without any errors. But in very rare cases, some
> days (and reboots) after a firmware update (which means, transferring a
> TAR to the target and overwriting some files during runtime), some of
> these replaced files show annoying damages:
>
> When doing a hexdump of a broken file, a 4KiB-section somewhere (offset
> always aligned to 0x1000) shows only zero "00 00 ..." instead of "real"
> data.

Someone stomped on a page(cleared it) before it got written
to flash, or so I think.

>
> The checksum (cksum, busybox) of the file is still valid, but the md5sum
> is not. I think this is because cksum does not really calculate a CRC of
> the file, but read it from file system meta information. But anyway, the
> file is broken.

Not much but here goes. Since JFFS2 choose 0 as seed to crc32, an area with
only zeros will generate a zero crc32. Therefore jffs2 crc32 will not detect
when someone stomps on a page and clears all data including the crc32 sum itself.
There has been such errors before, see commits:
c7258a4477b5ed0243c28ec107b98bb946757448
0dec4c8bc6ed62a65b61594aa754e21270423796 (improves the previous commit)

There is probably some more place that need a similar check. You could try reverting
my improvement, just to see if that catches anything.

Good luck
          Jocke
