Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbpNk-0001co-QV
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2013 10:21:41 +0000
Date: Thu, 31 Oct 2013 07:20:39 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand_bbt: kill NAND_BBT_SCANALLPAGES
Message-ID: <20131031102038.GA2391@localhost>
References: <1383186575-31328-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1383186575-31328-1-git-send-email-computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 30, 2013 at 10:29:35PM -0400, Brian Norris wrote:
> Now that the last user of NAND_BBT_SCANALLPAGES has been removed, let's
> kill this peculiar BBT feature flag.
> 

I must admit I also find this option a bit puzzling.

However, I'm wondering what happens if a manufacturer specifies
the bad block mark is in some page at the middle of a block.

AFAIK, some of them do exactly that, and I've always thought
this option was the solution for such cases.

So, is this really no longer needed?

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
