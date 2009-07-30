Received: from mail-yw0-f183.google.com ([209.85.211.183])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWXL1-0004jN-3v
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 15:14:39 +0000
Received: by ywh13 with SMTP id 13so749789ywh.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jul 2009 08:14:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3972542e0907300757q229a034g75cfb9f3f6f3bdf5@mail.gmail.com>
References: <3972542e0907300757q229a034g75cfb9f3f6f3bdf5@mail.gmail.com>
Date: Thu, 30 Jul 2009 10:14:32 -0500
Message-ID: <3972542e0907300814q349c9879icac442f57eb959b@mail.gmail.com>
Subject: Re: help with jffs2 filesystem error
From: E Robertson <e.robertson.svg@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 30, 2009 at 9:57 AM, E Robertson<e.robertson.svg@gmail.com> wro=
te:
> I have a problem with my jffs2 filesystem that I haven't been able to
> figure out.
> I tried it several ways and sometimes it worked and sometimes it does not=
.
>
> First I tried creating a filesystem using mkfs.jffs2 using argument -n
> --pad --little-endian --eraseblock=3D0x20000 and then write it to a nand
> partition using nandwrite -p /dev/mtd2 root.jffs2. Then I mount using
> -t jffs2 /dev/mtdblock2 /mnt/root.
>
> This never worked and sometimes I get an uncorrectable error <3> and
> sometimes I get the errors below.
>
> I also tried using another method where I first erase using
> flash_eraseall -j /dev/mtd2 then uncompress the root unto the
> partition (using tar -xz -C /mnt/root ).
> This worked sometimes and on the board that works it works and but I
> also notice that the board it worked on did not have any bad blocks in
> that partition. It may also worked on others that have bad blocks in
> one or two places.
> However, on other boards I get the same uncorrectable error repeating.
>
> Does anyone have any ideas?
> I would really appreciate the help. I'm on a sam9263 platform using
> 2.6.28.4 kernel and mtd-utils 1-1-0 and I also tried 1.2.0.
>
> Further such events for this erase block will not be printed
> jffs2_scan_inode_node(): CRC failed on node at 0x001966c0: Read
> 0x029fd007, calculated 0x6c56f903
> jffs2_scan_inode_node(): CRC failed on node at 0x00197094: Read
> 0x025373b8, calculated 0xcc82a78f
> jffs2_scan_inode_node(): CRC failed on node at 0x0019d184: Read
> 0xa0c79499, calculated 0xcdfc5a00
> mtd->read(0x1fbc4 bytes from 0x1a043c) returned ECC error
> jffs2_scan_inode_node(): CRC failed on node at 0x001b79fc: Read
> 0xfb2ec51d, calculated 0x96d2045f
> jffs2_scan_inode_node(): CRC failed on node at 0x001bba1c: Read
> 0x899f0d3c, calculated 0x123a4153
> jffs2_scan_inode_node(): CRC failed on node at 0x001bc120: Read
> 0xabb4012d, calculated 0x04f0936a
> jffs2_scan_eraseblock(): Node at 0x001bcf6c {0x1985, 0x0000,
> 0xe9b407b9) has invalid CRC 0x000023e2
> =A0(calculated 0x14165b52)
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001bcf70:
> 0x07b9 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001bcf74:
> 0x23e2 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001bcf78:
> 0x00de instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001bcf7c:
> 0x014c instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001bcf80:
> 0x81ed instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001bcf84:
> 0x03e8 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001bcf88:
> 0xc6f3 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001bcf8c:
> 0xf2d7 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001bcf90:
> 0xf2d7 instead
> Further such events for this erase block will not be printed
> jffs2_scan_dirent_node(): Node CRC failed on node at 0x001c01f0: Read
> 0xa3a565b8, calculated 0xfc1f
> 6b2b
> mtd->read(0x1f6f4 bytes from 0x1c090c) returned ECC error
> jffs2_scan_inode_node(): CRC failed on node at 0x001c090c: Read
> 0xc1dbde95, calculated 0xc2589888
> jffs2_scan_inode_node(): CRC failed on node at 0x001c2218: Read
> 0x6a3ed812, calculated 0x8ff5f057
> jffs2_scan_inode_node(): CRC failed on node at 0x001c3600: Read
> 0x57b14d94, calculated 0x54320b89
> jffs2_scan_inode_node(): CRC failed on node at 0x001c416c: Read
> 0xa9fc3c7f, calculated 0xa882fe74
> jffs2_scan_inode_node(): CRC failed on node at 0x001c45f4: Read
> 0x2b4441e2, calculated 0x2a3a83e9
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c9588:
> 0xe290 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c958c:
> 0xf8cb instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c9590:
> 0xe63a instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c9594:
> 0x6f5f instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c9598:
> 0xffe5 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c959c:
> 0xe5de instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c95a0:
> 0x6711 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c95a4:
> 0x9851 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c95a8:
> 0xaa3e instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c95ac:
> 0xff16 instead
> Further such events for this erase block will not be printed
> mtd->read(0x400 bytes from 0x1e0000) returned ECC error
>

In addition to the errors above, during uncompression of rootfs I also
get the following:

Erasing 128 Kibyte @ 3fe0000 -- 99 % complete. Cleanmarker written at 3fe00=
00.
jffs2_flush_wbuf(): Write failed with -5
Recovery of wbuf succeeded to 03fa0000
Write of 70 bytes at 0x03fc67f4 failed. returned -5, retlen 0
Not marking the space at 0x03fc67f4 as dirty because the flash driver
returned retlen zero
jffs2_flush_wbuf(): Write failed with -5
Recovery of wbuf failed due to a second write error
Write of 70 bytes at 0x03fa17fc failed. returned -5, retlen 0
Not marking the space at 0x03fa17fc as dirty because the flash driver
returned retlen zero
jffs2_flush_wbuf(): Write failed with -5
Recovery of wbuf failed due to a second write error
Write of 70 bytes at 0x03f80000 failed. returned -5, retlen 0
Not marking the space at 0x03f80000 as dirty because the flash driver
returned retlen zero
jffs2_flush_wbuf(): Write failed with -5
Recovery of wbuf failed due to a second write error
Write of 70 bytes at 0x03f80000 failed. returned -5, retlen 0
Not marking the space at 0x03f80000 as dirty because the flash driver
returned retlen zero
jffs2_flush_wbuf(): Write failed with -5
Recovery of wbuf failed due to a second write error
Write of 70 bytes at 0x03f80000 failed. returned -5, retlen 0
Not marking the space at 0x03f80000 as dirty because the flash driver
returned retlen zero
jffs2_flush_wbuf(): Write failed with -5
Recovery of wbuf failed due to a second write error
Write of 72 bytes at 0x03f80000 failed. returned -5, retlen 0
Not marking the space at 0x03f80000 as dirty because the flash driver
returned retlen zero
jffs2_flush_wbuf(): Write failed with -5

I've tried some suggestions I picked up from the archives with related
issues but none seems to work so far.
I'll appreciate any suggestions.
