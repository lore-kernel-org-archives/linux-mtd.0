Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bA67o-00055t-Hb
 for linux-mtd@lists.infradead.org; Tue, 07 Jun 2016 01:48:13 +0000
Received: by mail-oi0-x22a.google.com with SMTP id p204so59034859oih.3
 for <linux-mtd@lists.infradead.org>; Mon, 06 Jun 2016 18:47:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <DM2PR0801MB092606DB85030B4F62A0BBF6FF5D0@DM2PR0801MB0926.namprd08.prod.outlook.com>
References: <DM2PR0801MB092606DB85030B4F62A0BBF6FF5D0@DM2PR0801MB0926.namprd08.prod.outlook.com>
From: Mychaela Falconia <mychaela.falconia@gmail.com>
Date: Mon, 6 Jun 2016 17:47:50 -0800
Message-ID: <CA+uuBqb5K74aajPGWrDdW=cFPn0Ctuk5oeve1_bhv49Z60M7zg@mail.gmail.com>
Subject: Re: Temporarily remounting rootfs as rw leads to kernel panic on
 reboot
To: David Olson <Dave.Olson@welchallyn.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> UBI: smallest flash I/O unit:    2048
> UBI: sub-page size:              512
> UBI: VID header offset:          2048 (aligned 2048)
> UBI: data offset:                4096

First sign of inconsistency: your UBI reports here that the underlying
NAND has subpages, yet it doesn't use them to put the EC and VID
headers in the same page, i.e., your VID offset is equal to the full
page size and the data offset is 2x the full page size. Perhaps when
you created the UBI data structures in your flash "in vitro" with
ubiformat or ubinize you forgot to tell those tools your 512 byte
subpage size?

> UBI error: ubi_io_read: error -74 (ECC error) while reading 126976 bytes
> from PEB 3:4096, read 126976 bytes
> UBI error: ubi_io_read: error -74 (ECC error) while reading 126976 bytes
> from PEB 4:4096, read 126976 bytes
> UBI error: ubi_io_read: error -74 (ECC error) while reading 11 bytes from
> PEB 10:10240, read 11 bytes
> UBIFS error (pid 1): ubifs_leb_read: reading 11 bytes from LEB 8:6144
> failed, error -74

Let me guess, the flash was written in production with a production
line programmer and not with ubiformat, was it? If you use a "dumb"
(non-UBI-aware) flasher to program your flash at the factory and then
try to mount something read-write, the following nasty problem occurs:
suppose some block has empty pages at the end, i.e., pages containing
all 0xFF bytes. UBIFS will assume that these NAND pages are truly
blank, i.e., never written to since they've been erased, and it will
write to them. But each NAND flash page must only be written once
(subpage writes aside, if and when they are allowed), and if you used
a non-UBI-aware dumb flasher, those pages may have already been
written to - even if they contain all 0xFF bytes. With some hardware
ECC schemes writing all 0xFF bytes to a page is NOT the same as
leaving it alone after the block erase, and when UBIFS later writes to
that same page again (on a read-write mount), the result is a
corrupted page that returns hard ECC errors when read. It seem to me
like you are hitting this very problem.

The solution is to write your NAND with a tool like ubiformat that
refrains from writing the trailing pages of each block whenever they
contain all 0xFF bytes. And while you are at it, you may want to fix
your image generation so that the subpage setting agrees with what the
kernel sees.

HTH,
M~
