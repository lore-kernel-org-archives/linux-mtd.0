Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CJvdP-0004cI-Mh
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2004 11:10:48 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: simon@baydel.com
In-Reply-To: <E0CCB8742B31@baydel.com>
References: <E0180EAB7181@baydel.com> <1098186608.12223.857.camel@thomas>
	<E0CCB8742B31@baydel.com>
Content-Type: text/plain
Message-Id: <1098198148.12223.885.camel@thomas>
Mime-Version: 1.0
Date: Tue, 19 Oct 2004 17:02:28 +0200
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

On Tue, 2004-10-19 at 16:39, Simon Haynes wrote:
> Thomas,
> 
> I am using the ready pin.

Hmm, the strange thing is, that it does not complain about a failed
erase. It complaines, when checking if the chip is really erased.

Can you try the hack below, which invalidates the page cache
unconditionally on erase ?

tglx

RCS file: /home/cvs/mtd/drivers/mtd/nand/nand_base.c,v
retrieving revision 1.121
diff -u -r1.121 nand_base.c
--- nand_base.c 6 Oct 2004 19:53:11 -0000       1.121
+++ nand_base.c 19 Oct 2004 15:09:35 -0000
@@ -2091,8 +2091,7 @@

                /* Invalidate the page cache, if we erase the block
which contains
                   the current cached page */
-               if (page <= this->pagebuf && this->pagebuf < (page +
pages_per_block))
-                       this->pagebuf = -1;
+               this->pagebuf = -1;

                this->erase_cmd (mtd, page & this->pagemask);
