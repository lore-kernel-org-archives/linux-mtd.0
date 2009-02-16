Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZ5h1-0002m9-W5
	for linux-mtd@lists.infradead.org; Mon, 16 Feb 2009 15:47:38 +0000
Message-ID: <49998C2D.7000505@nokia.com>
Date: Mon, 16 Feb 2009 17:54:21 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "Adam S. Turowski" <a.turowski@wb.com.pl>
Subject: Re: [UBIFS] Filesystem capacity
References: <49997BBF.7080906@wb.com.pl>
In-Reply-To: <49997BBF.7080906@wb.com.pl>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adam S. Turowski wrote:
> Hi,
> Can anyone explain differences in filesystem capacity between jffs2 and
> ubifs?
> Kernel 2.6.28
> mtd3 29MB nor flash
> mtd4 31MB nand flash
> File created by dd-ing from /dev/urandom:
> jffs2:
> nor: 28361 kB
> nand: 31200 kB
> 
> ubifs:
> one volume created on mtd3
> UBIFS: mounted UBI device 0, volume 0, name "root"
> UBIFS: file system size:   28676736 bytes (28004 KiB, 27 MiB, 219 LEBs)
> UBIFS: journal size:       1440384 bytes (1406 KiB, 1 MiB, 11 LEBs)
> UBIFS: media format:       4 (latest is 4)
> UBIFS: default compressor: LZO
> UBIFS: reserved for root:  1417227 bytes (1384 KiB)
> 
> one volume created on mtd4
> UBIFS: mounted UBI device 1, volume 0, name "data"
> UBIFS: file system size:   31870976 bytes (31124 KiB, 30 MiB, 2008 LEBs)
> UBIFS: journal size:       1603072 bytes (1565 KiB, 1 MiB, 101 LEBs)
> UBIFS: media format:       4 (latest is 4)
> UBIFS: default compressor: LZO
> UBIFS: reserved for root:  1575089 bytes (1538 KiB)
> 
> nor: 26960 kB (I can live with that)
> nand: 23552 kB (With that I cannot)
> 
> Any suggestions?

It is because the LEB size is relatively small, and UBIFS does not
fit data into the ends of eraseblocks the way JFFS2 does.  Your options
are:
	1. use JFFS2
	2. amend your NAND driver to pretend that eraseblocks are bigger
than they really are, by treating 2 (or 4 or 8 etc) as one eraseblock
	3. create another MTD driver that sits on top of the NAND driver
and does the same as 2

The disadvantage of 2 or 3 is that it also multiples the effective number
of bad blocks.

Note that the problem is exacerbated by writing un-compressible (e.g. random)
data because you end up fitting only 3 x 4.1K data nodes per 16K eraseblock.

If you are interested in 3, I could help.
