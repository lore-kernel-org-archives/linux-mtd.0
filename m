Received: from mail-vb0-x233.google.com ([2607:f8b0:400c:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve59R-0003qa-ES
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2013 15:36:14 +0000
Received: by mail-vb0-f51.google.com with SMTP id w5so3483980vbf.38
 for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2013 07:35:49 -0800 (PST)
MIME-Version: 1.0
From: Fernando Silveira <fsilveira@gmail.com>
Date: Wed, 6 Nov 2013 13:35:05 -0200
Message-ID: <CAGZNvdqt=1K4cd4xLu+2k9KpUa5U_Hu0w1xi_aCwOn7pXiRVBg@mail.gmail.com>
Subject: Bad blocks while attaching UBIFS
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm using an yet unreleased NAND flash controller with my own MTD
driver and everything is working perfectly except for one thing: after
a few weeks UBIFS begins to throw some error messages while attaching
and a few days later it just doesn't attach anymore. I know bad blocks
are supposed to appear after rewriting lots of data but it seems to me
that UBIFS is not marking the "attach" blocks as bad nor wear leveling
the "attach/info" sector. The error message follows below:

UBI: attaching mtd3 to ubi0
UBI: physical eraseblock size:   2097152 bytes (2048 KiB)
UBI: logical eraseblock size:    2080768 bytes
UBI: smallest flash I/O unit:    8192
UBI: VID header offset:          8192 (aligned 8192)
UBI: data offset:                16384
[my mtd driver printing error messages while trying to read a block]
UBI error: ubi_io_read: error -5 while reading 64 bytes from PEB
3394:0, read 0 bytes

Note that once a UBIFS file system starts to fail, that PEB indicated
in the "ubi_io_read" error seems to never change. I'll take a closer
look at this detail if I see more errors.

My questions are:

  1. Does UBIFS mark a bad block when it is failing to attach?
  2. If yes, what might be wrong with my driver?
  3. If not, what should I do to prevent a failure while attaching?

PS: I rarely see a bad block being set/found by UBIFS, but the errors
in the attach procedure are VERY frequent.

Regards,

-- 
Fernando Silveira
