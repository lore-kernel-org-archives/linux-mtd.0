Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqMuL-0006xR-Ve
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2013 12:59:26 +0000
Date: Tue, 10 Dec 2013 09:59:17 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: Use info->use_dma to release DMA
 resources
Message-ID: <20131210125916.GC16238@localhost>
References: <1385470344-2542-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131127075819.GC13929@norris.computersforpeace.net>
 <20131127113405.GA2326@localhost>
 <20131209215547.GX27149@ld-irv-0074.broadcom.com>
 <20131209223258.GG31944@localhost>
 <20131209231028.GY27149@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131209231028.GY27149@ld-irv-0074.broadcom.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 09, 2013 at 03:10:28PM -0800, Brian Norris wrote:
> On Mon, Dec 09, 2013 at 07:32:59PM -0300, Ezequiel Garcia wrote:
[..]
> > 
> > Therefore, this doesn't hit stable, and it's just v3.13 material; sorry
> > for the confusion. And to be fair, the commit log could much better.
> > Right now it looks a bit laconic. Want me to resend a more verbose one?
> 
> Yes, please.
> 

OK, I've just sent this one with a better commit message, together with
a resend of the "need_wait" fix Arnaud and I were hunting recently.

I think both are fine for v3.13.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
