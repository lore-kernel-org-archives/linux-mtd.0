Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CJsd2-0002d1-7k
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2004 07:58:13 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: simon@baydel.com
In-Reply-To: <E0180EAB7181@baydel.com>
References: <E0180EAB7181@baydel.com>
Content-Type: text/plain
Message-Id: <1098186608.12223.857.camel@thomas>
Mime-Version: 1.0
Date: Tue, 19 Oct 2004 13:50:08 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bad Blocks On JFFS2/NAND
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-10-19 at 13:22, Simon Haynes wrote:
> I have experienced a problem in which a JFF2 filesystem on NAND became full. 
> This is a root file system and constant writes to a logfile filled the 
> filesystem. On investigation it was found that the NAND device now had 
> hundreds of bad blocks. 
> 
> I started to investigate this and found that JFFS2 was announcing 
> 
> Newly-erased block contained word 0x1985e002 at offset 0x020f7e00
> 
> Messages which result in my mtd/jffs2 code marking the block bad. What I find 
> strange is that a subsequent scan list the new block at a different 16k 
> offset when the device erasesize is 16k, in this case 0x020f0000.
> Is that because my device is 128Mb and JFFS2 is using this 'virtual erase 
> size' of 32k ?

Yes. The bad block code scans/marks physical blocks and JFFS2 operates
on virtual ones, if the device size is big enough.

> I have observed this now on several different NAND devices and it seems to be 
> more prominent while performing small writes.
>
> I am currently trying to work out if the erase is not completing, or this is 
> the wrong block or something else. 

Hmm, are you using Ready/Busy Pin or the timeout ?

tglx
