Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DBeZt-00041Z-K9
	for linux-mtd@lists.infradead.org; Wed, 16 Mar 2005 14:53:14 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Sergei Sharonov <Sergei.Sharonov@Halliburton.com>
In-Reply-To: <487B538D08487B4D8FEC138A13D4F6AC509BA5@HOUEXCH077.corp.halliburton.com>
References: <487B538D08487B4D8FEC138A13D4F6AC509BA5@HOUEXCH077.corp.halliburton.com>
Content-Type: text/plain
Date: Wed, 16 Mar 2005 20:53:11 +0100
Message-Id: <1111002792.4814.115.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: failed write verify causes segmentation fault
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-03-15 at 19:09 -0600, Sergei Sharonov wrote:
> test conditions. I was testing NAND flash endurance at elevated 
> temperatures and after a few weeks of continuous 
> write/remount/read/verify/erase of a 10 MByte random test file 
> the nand_verify_pages() failed and caused segmentation fault.

The write/verify failure is nothing scary. Its the nature of NAND Flash
that this can and will happen.

The segfault of your user space application/script is a consequence of a
BUG() in the kernel. This _is_ scary.

> Test setup: at91rm9200 based custom board, linux 2.6.10 patched with
> mtd-snapshot-20050123, JFFS2 filesystem (non-root) on a 2 Gbit Toshiba 
> NAND chip, write verify enabled, compression disabled. 
> Seems that when (eventually) write verify failed the system could not 
> handle it graciously. Has anybody seen this before?

This should be handled by JFFS2 and I'm know for sure this worked some
time ago. I have no idea yet, which part of the code has been changed to
make this functionality go away. I will fake the write failure and check
whether I can reprocude your problem here. If it is reproducable then we
can fix it, if not we'll see. :)

> Backtrace:
> [<c00d9c40>] (jffs2_flash_writev+0x4/0x5a0) from [<c00d0694>]
> (jffs2_write_dnode+0x174/0x684)
> [<c00d0520>] (jffs2_write_dnode+0x0/0x684) from [<c00d14b0>]
> (jffs2_write_inode_range+0x2e8/0x46c)
> [<c00d11c8>] (jffs2_write_inode_range+0x0/0x46c) from [<c00ccae4>]
> (jffs2_commit_write+0x1a8/0x304)
> [<c00cc93c>] (jffs2_commit_write+0x0/0x304) from [<c004ad34>]
> (generic_file_buffered_write+0x364/0x5a8)

Not very helpful to find the source of the problem, but thanks for
providing a detailed and descriptive bug report.

> After rebooting the file system appears to be intact except that the 
> last file was partially written (1323008 bytes instead of 10000000) 
> and CRC error:

That's an expected consequence of the problem. 

tglx
