Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E8I1i-0003LM-HS
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2005 09:44:26 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: ahgu <ahgu@ahgu.homeunix.com>
In-Reply-To: <10af01c5a978$c336df10$1f1a12ac@atitech.com>
References: <10af01c5a978$c336df10$1f1a12ac@atitech.com>
Content-Type: text/plain
Date: Thu, 25 Aug 2005 13:44:55 +0000
Message-Id: <1124977495.20120.111.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: simulate a bad NAND block cause kernel hang
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-08-25 at 09:27 -0400, ahgu wrote:
> I forced the flash_erase function to fail. I expect the jffs2 will pick up 
> the return error and mark the block bad and put the bad block in a bad_block 
> list. But what I get is kernel failure:
> I get similar error when I simulate a write error.
> Am I doing the bad block simulation correctly? Is this a correct response? 
> What is supposed to happen when the NAND flash grow a bad block?

JFFS2 should handle this.

The oops trace is worthless, as it does not show the stack trace in
human readable form (function names decoded) 

Make sure that CONFIG_KALLSYMS is set in your kernel .config file. 

Also information about kernel version and possibly applied MTD/JFFS2
patches is missing.


tglx
