Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D3FTo-0000nr-EL
	for linux-mtd@lists.infradead.org; Mon, 21 Feb 2005 10:28:14 -0500
From: Andrew Victor <andrew@sanpeople.com>
To: Narinder Kumar <narinder@kritikalsolutions.com>
In-Reply-To: <4219EDC3.1060506@kritikalsolutions.com>
References: <4219E20F.80908@kritikalsolutions.com>
	<1108994310.13420.50.camel@sauron.oktetlabs.ru>
	<4219EDC3.1060506@kritikalsolutions.com>
Content-Type: text/plain
Message-Id: <1108999278.16852.46.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 21 Feb 2005 17:21:19 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

>        First of all thanx for the reply . I am using AT45DB642 NAND 
> Flash and it seems to have erase block of 0x420 i,e 1056 bytes. and when 
> i have created my MTD partitions i have specified the partition sizes to 
> be multiple of these eraseblock sizes in 
> drivers/at91/mtd/at91_dataflash.c , My 3 partitions are 4*1024*1056  (4 
> GB) , 3*1024*1056 (3 GB) and 1*1024*1056 (1 GB)

Atmel AT45DB642 is DataFlash (not NAND).
mkfs.jffs2 is currently broken for DataFlash.

This is how I once fixed it.  I don't know if the current mkfs.jffs2
code is different.....

In mkfs.jffs2.c in function main().  Comment out the code:

//     /* If it's less than 4096, assume they meant KiB */
//     if (erase_block_size && erase_block_size < 0x1000)
//         erase_block_size *= 1024;
//     /* If it's less than 8KiB, they're not allowed */
//     if (erase_block_size < 0x2000) {
//         fprintf(stderr, "Increasing erase size to 8KiB minimum\n");
//         erase_block_size = 0x2000;
//     }

Then run mkfs.jffs2 with the parameters "-e 2112 -n -l"

The 2112 is because JFFS2 merges multiple 528-byte or 1056-byte physical
blocks into larger virtual blocks.
The 2112 is for a 4Mb dataflash device, and that value will probably
differ for differently sized dataflash devices.

You should see the message:
  JFFS2 write-buffering enabled (2112)
when you mount the JFFS2 partition.  The size of brackets is the virtual
blocks size.  You should also be using the code from the MTD/JFFS2 CVS.


Regards,
  Andrew Victor
  SAN People (Pty) Ltd.
