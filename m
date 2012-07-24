Received: from mail-gg0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1StiE2-0003hd-US
 for linux-mtd@lists.infradead.org; Tue, 24 Jul 2012 16:44:49 +0000
Received: by ggcs5 with SMTP id s5so7298773ggc.36
 for <linux-mtd@lists.infradead.org>; Tue, 24 Jul 2012 09:44:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <500EC7D9.8020509@cincinnatitechnologies.com>
References: <500EC7D9.8020509@cincinnatitechnologies.com>
Date: Tue, 24 Jul 2012 09:44:44 -0700
Message-ID: <CAN8TOE8zYFs9pyBULjRSGttN_KRP4qzQrLuTDTackWkYOthoCw@mail.gmail.com>
Subject: Re: Is my erase block size correct?
From: Brian Norris <computersforpeace@gmail.com>
To: Russell Zuck <rzuck@cincinnatitechnologies.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 24, 2012 at 9:05 AM, Russell Zuck
<rzuck@cincinnatitechnologies.com> wrote:
> While rechecking the datasheet for our NAND flash (Micron MT29F4G08BABWP
> 4Gb), I noticed a discrepancy between the erase block size presented in the
> datasheet (128KiB + 4KiB) and that returned from mtdinfo (see below).  The
> extra 4KiB overhead is due to a 64Byte overhead for each of the 64
> pages/block.

128KiB + 4KiB just means there is 128KiB in-band (regular) data area,
plus 4KiB OOB (out-of-band) area. Normally, the eraseblock size is
judged by just the data area (i.e., 128KiB). But you can "find" the
4KiB by some math from the mtdinfo output:

> root@ctc-imx51 ~$ mtdinfo -a
...
> mtd1
> Name:                           nand.bootloader
> Type:                           nand
> Eraseblock size:                131072 bytes, 128.0 KiB
> Amount of eraseblocks:          8 (1048576 bytes, 1024.0 KiB)
> Minimum input/output unit size: 2048 bytes

I/O size == page size

> Sub-page size:                  512 bytes
> OOB size:                       64 bytes

OOB size == out-of-band area per page

> Character device major/minor:   90:2
> Bad blocks are allowed:         true
> Device is writable:             true

So, OOB-per-eraseblock =
eraseblock size / page size * OOB-per-page =
128KiB / 2KiB * 64B =
64 * 64B = 4KiB

> Any help in confirming or refuting any of my 3 possible conclusions would be
> greatly appreciated.  Alternate theories are, of course, welcome.

"the driver is correct and is not reporting the 4KiB overhead of each
erase block."

This is pretty much true. mtdinfo (and the MTD subsystem) just records
these numbers slightly differently than you are reading from the data
sheet.

If you post more debug information and info about your system/driver
used, others may help with your UBIFS issues.

Brian
