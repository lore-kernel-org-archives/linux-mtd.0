Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4zx7-0004fJ-Ag
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 23:39:49 +0000
Received: by pacwq6 with SMTP id wq6so16414187pac.1
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2015 15:39:28 -0800 (PST)
Date: Fri, 4 Dec 2015 15:39:25 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: [PATCH] mtd: nand: r852: Remove unnecessary synchronize_irq()
 before free_irq()
Message-ID: <20151204233925.GH120110@google.com>
References: <1448104484-22612-1-git-send-email-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1448104484-22612-1-git-send-email-lars@metafoo.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 21, 2015 at 12:14:44PM +0100, Lars-Peter Clausen wrote:
> Calling synchronize_irq() right before free_irq() is quite useless. On one
> hand the IRQ can easily fire again before free_irq() is entered, on the
> other hand free_irq() itself calls synchronize_irq() internally (in a race
> condition free way), before any state associated with the IRQ is freed.
> 
> Patch was generated using the following semantic patch:
> // <smpl>
> @@
> expression irq;
> @@
> -synchronize_irq(irq);
>  free_irq(irq, ...);
> // </smpl>
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Applied to l2-mtd.git
