Received: from law14-oe71.law14.hotmail.com ([64.4.20.206] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19hV5H-0000D9-TV
	for <linux-mtd@lists.infradead.org>; Tue, 29 Jul 2003 15:04:12 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: <uclinux-dev@uclinux.org>
Date: Tue, 29 Jul 2003 19:37:52 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE71l476U6QXm000089ef@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: mtd <linux-mtd@lists.infradead.org>
Subject: JFFS2 problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi people,

Let me discuss the problem with you and kindly tell me what is wrong here.
any ideas are welcome
When we mount jffs2 if the mount process ends up after the Garbage
collection thread is said to be sleeping, the mount is successful
However if in the mount process, jffs2_write_supper is called after GC
thread is sleeping, It calls a function to erase blocks by the name
jffs2_erase_pending_blocks.

If the code enters this function, it goes on to the scheduler
by the call stack
jffs2_erase_pending_blocks
jffs2_erase_block.
c->mtd->erase() which is
..
cfi_amdstd_erase_varsize
do_erase_one_block
cfi_udelay
udelay
scehdule_timeout
schedule
switch_to macro
where the system Crashes

I tried one thing. Commenting the jffs2_erase_block call in
jffs2_erase_pending_blocks.
Now my mount works perfectly fine.... Very nicely
But  now erase and eraseall /dev/mtdx  crash.
the crash in erase or eraseall
The crash in erase or eraseall follows the same call stack.

Any ideas what might be wrong .


Vikram
