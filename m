Received: from web52704.mail.yahoo.com ([206.190.39.155])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bk86R-00014x-Do
	for linux-mtd@lists.infradead.org; Mon, 12 Jul 2004 17:12:48 -0400
Message-ID: <20040712211245.32443.qmail@web52704.mail.yahoo.com>
Date: Mon, 12 Jul 2004 14:12:45 -0700 (PDT)
From: Michael Moedt <xemc@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Writes failures & cpu speed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

I'm running into an MTD problem that I'm not sure how to hunt down.
Has anyone seen this, or can you guide me as to what I should look
at?

Here's the details:
I'm using a Sharp LH7A400 SoC (that's an ARM9), w/ SDRAM, NAND flash
(64MiB of Toshiba NAND (512+16 byte pagesize, 16KiB block/erase
size).  I've partitioned it into four partitions, 1. bootloader, 2.
kernel, 3 and 4. JFFS2 filesystems. (#3 is my root, 8MiB)

I'm using kernel 2.6.6, with modifications to support my flash layout
and such things.  I'm also using the 2004-05-04 MTD snapshot.

When I configure the CPU in the bootloader to run at 100MHz, it seems
to work fine.  However, when I run it at 195MHz (it goes up to 200),
I can't successfully copy files to my JFFS2 filesystem.  Here's what
it looks like:

100MHZ:
# cd /root
# cp nandwrite nandwrite_2
# rm nandwrite_2
#

at 195MHz:
# cp nandwrite nandwrite_2
Write of 2260 bytes at 0x0010c000 failed. returned -5, retlen 0
Not marking the space at 0x0010c000 as dirty because the flash driver
returned o
Write of 2260 bytes at 0x0010c000 failed. returned -5, retlen 0
Not marking the space at 0x0010c000 as dirty because the flash driver
returned o
Write of 2263 bytes at 0x0010c000 failed. returned -5, retlen 0
Not marking the space at 0x0010c000 as dirty because the flash driver
returned o
Write of 2263 bytes at 0x0010c000 failed. returned -5, retlen 0
Not marking the space at 0x0010c000 as dirty because the flash driver
returned o
Write of 2263 bytes at 0x0010c000 failed. returned -5, retlen 0
Not marking the space at 0x0010c000 as dirty because the flash driver
returned o
Write of 2263 bytes at 0x0010c000 failed. returned -5, retlen 0
Not marking the space at 0x0010c000 as dirty because the flash driver
returned o
cp: Write Error: Input/output error
# rm nandwrite_2
# jffs2_flush_wbuf(): Write failed with -5
Write of 2554 bytes at 0x0010c034 failed. returned -5, retlen 0
Not marking the space at 0x0010c034 as dirty because the flash driver
returned o
Write of 2554 bytes at 0x00108034 failed. returned -5, retlen 460
Error writing new dnode: -5

#

and sometimes, it also results in a kernel Segfault:
# cp nandwrite nandwrite_2
Write of 2473 bytes at 0x00108c78 failed. returned -5, retlen 392
jffs2_flash_writev(): Non-contiguous write to 00109624
Unable to handle kernel NULL pointer dereference at virtual address
00000000
pgd = c02cc000
[00000000] *pgd=c0377011, *pte=00000000, *ppte=00000000
Internal error: Oops: 807 [#1]
...


I don't know why a faster CPU speed would cause something like this. 
Could there be some timing bug that I've found?
What does a return value of -5 mean?


Thanks in advance,
Mike
