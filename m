Received: from rex.securecomputing.com ([203.24.151.4] helo=cyberguard.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KnSrM-0006Xi-Pz
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 06:49:25 +0000
Message-ID: <48EC523F.8030305@snapgear.com>
Date: Wed, 08 Oct 2008 16:25:03 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: Daniel Rosenthal <danielrosenthal@acm.org>
Subject: Re: [PATCH (fixed)] Fix infinite loop in INFTL_foldchain()
	in	drivers/mtd/inftlcore.c
References: <20081007132904.6vvmlioy8co004ko@system.cs.fsu.edu>
In-Reply-To: <20081007132904.6vvmlioy8co004ko@system.cs.fsu.edu>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Daniel,

Daniel Rosenthal wrote:
> I'm having problems with my email client, but I've attached a patch 
> (both inline and as a regular attachment). This patch fixes a loop that 
> is potentially infinite in INFTL_foldchain in drivers/mtd/inftlcore.c.
> 
> When iterating over a chain in reverse (oldest block first), this patch 
> correctly marks the PUtable[] entry of the second to last erase block of 
> a chain as BLOCK_NIL, regardless of whether or not it can format the 
> last block successfully. Before, the second to last block was only 
> marked as pointing to BLOCK_NIL if INFTL_formatblock() succeeded on the 
> last block of the chain, which could potentially result in an infinite 
> loop if the block was worn out and refused to format.
> 
> If there are any problems with this patch please let me know. I can 
> apply them fine after pulling them from email, but my email client (web 
> interface) isn't fullproof, so if anybody else has problems, please let 
> me know. (I can't send it through pine or otherwise due to network 
> configuration.)

I haven't looked at this code for quite a while, but your
reasoning and patch looks right to me. So you have my acked-by.

Acked-by: Greg Ungerer <gerg@snapgear.com>

David, I assume you are going to pick this up?

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
Secure Computing Corporation                PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
