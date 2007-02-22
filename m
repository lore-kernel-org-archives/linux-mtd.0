Received: from py-out-1112.google.com ([64.233.166.181])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HK1iT-0002cv-Rv
	for linux-mtd@lists.infradead.org; Wed, 21 Feb 2007 19:21:49 -0500
Received: by py-out-1112.google.com with SMTP id p76so3045pyb
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Feb 2007 16:21:42 -0800 (PST)
Message-ID: <e167438e0702211621i2eadbf15s33db7c34dc989bb2@mail.gmail.com>
Date: Wed, 21 Feb 2007 18:21:42 -0600
From: "Julianne C." <juliannerc@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: OneNAND: Rate of write errors
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We are still struggling to understand and manage the OneNAND part on a
LogicPD PXA270 board.  We are using the mtd development snapshot build
of 2-15-07 for the fs and device layers.  Our requirements lead us to
use JFFS2 as the file system.

What we are seeing is that when we write to a file system that is
freshly erased and mounted using the command:
>mount -t jffs2 /dev/mtdblockx /mnt
and then performing some operation like tar or rsync to place files in
the new fs, we see about 5 to 8 "write errors" of the form per MB:

onenand_write: verify failed -74
Write of 2663 bytes at 0x007a6e14 failed. returned -74, retlen 0
Not marking the space at 0x007a6e14 as dirty because the flash driver
returned retlen zero

In further testing, we have replaced the memcmp function in
onenand_verify with a procedure that manually goes through the list,
and issues a printk statement for each bad byte it detects.  Here is a
sample of the bad bytes we see:

Cmp failed [1596]  eb  00
Cmp failed [1594]  e6  9f
Cmp failed [1954]  7b  4d
Cmp failed [1654]  ae  00
Cmp failed [1972]  82  00
Cmp failed [462]  d3  00
Cmp failed [972]  a7  26
Cmp failed [1242]  d8  8d
Cmp failed [54]  6e  a0
Cmp failed [824]  3a  56
Cmp failed [1360]  78  67
Cmp failed [1584]  82  00
Cmp failed [1376]  00  5a
Cmp failed [64]  3f  00
Cmp failed [444]  90  e5
Cmp failed [310]  94  2d
Cmp failed [1764]  7a  04
Cmp failed [1030]  f8  14
Cmp failed [68]  1e  72
Cmp failed [1910]  de  01
Cmp failed [780]  37  00
Cmp failed [1536]  76  00
Cmp failed [1064]  2c  00
Cmp failed [644]  58  00
Cmp failed [1428]  25  00
Cmp failed [440]  89  00
Cmp failed [1852]  6d  00

where the first byte is the expected buffer value, while the second is
what is actually seen, and the value in the brackets is the index in
the 2048 byte array being tested.

These values were accumulated over about 4 MB of writes to the fs.

Is this common to see this many errors in that amount of page writes?
If not, are there adjustments that can be made to the device setup to
help reduce these errors?
