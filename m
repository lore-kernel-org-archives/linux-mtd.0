Received: from radmz1.prettl-elektronik.de ([212.185.50.242])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RxfuQ-0005l0-Bi
 for linux-mtd@lists.infradead.org; Wed, 15 Feb 2012 14:32:39 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: JFFS2: file damages after write: Where to start investigation
Date: Wed, 15 Feb 2012 15:32:28 +0100
Message-ID: <A116BBDA09FF5D488D7DB1E6C97F7550B04B2E@RASRV02.prettl-elektronik.de>
From: "Weickelt, Richard \(lesswire AG\)" <Weickelt@lesswire.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

I have linux 2.6.38 running on an Freescale i.MX25 with a 64MiB NAND
Flash and a jffs2 root file system mounted RW. After initial flashing
with U-Boot the system runs stand-alone and reads/writes from time to
time some text files without any errors. But in very rare cases, some
days (and reboots) after a firmware update (which means, transferring a
TAR to the target and overwriting some files during runtime), some of
these replaced files show annoying damages:

When doing a hexdump of a broken file, a 4KiB-section somewhere (offset
always aligned to 0x1000) shows only zero "00 00 ..." instead of "real"
data.

The checksum (cksum, busybox) of the file is still valid, but the md5sum
is not. I think this is because cksum does not really calculate a CRC of
the file, but read it from file system meta information. But anyway, the
file is broken.

The second annoying fact is: When a file was broken, sometimes a reboot
helped and the file was ok again. But after some time, a reboot did not
help anymore. I did not discover this by myself, but I was told so, so I
can not proof it. It does not sound logical to me.

My question is now: It looks like a hardware problem, since the erronous
files are not touched after a firmware update. I do not have much
experience with jffs2/mtd, but I keep reading the documents.=20
Where should I begin to investigate? Which of the mtd utils could help
me further? Would it help, if I could find out the raw address of that
file or errounous pages and then dump the flash data directly? Then I
can compare, if the raw data is still there and only some bytes where
damaged. How to find out the address?=20
The block size is 16K, the page size is 512B, so I think the broken 4K
are 1 inode and maybe only a page is damaged...

Thank You for any hints
Best regards
Richard
