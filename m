Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEfmJ-00022n-7M
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 16:40:55 +0000
Date: Sun, 19 Jun 2016 18:40:27 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org
Subject: Re: [PATCH v3 5/8] MTD: xway: fix nand locking
Message-ID: <20160619184027.4da93d3a@bbrezillon>
In-Reply-To: <9936f935-bf7f-83b8-c7f6-5631f9e68c01@hauke-m.de>
References: <1466352497-6806-1-git-send-email-hauke@hauke-m.de>
 <1466352497-6806-6-git-send-email-hauke@hauke-m.de>
 <20160619182620.0eea56b3@bbrezillon>
 <9936f935-bf7f-83b8-c7f6-5631f9e68c01@hauke-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 19 Jun 2016 18:34:30 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:
> >> @@ -113,14 +115,8 @@ static unsigned char xway_read_byte(struct mtd_info *mtd)
> >>  {
> >>  	struct nand_chip *this = mtd_to_nand(mtd);
> >>  	unsigned long nandaddr = (unsigned long) this->IO_ADDR_R;
> >> -	unsigned long flags;
> >> -	int ret;
> >>  
> >> -	spin_lock_irqsave(&ebu_lock, flags);
> >> -	ret = ltq_r8((void __iomem *)(nandaddr + NAND_READ_DATA));
> >> -	spin_unlock_irqrestore(&ebu_lock, flags);
> >> -
> >> -	return ret;
> >> +	return ltq_r8((void __iomem *)(nandaddr + NAND_READ_DATA));  
> > 
> > 	Drop the cast and use this->IO_ADDR_R here.  
> 
> This will be done in the following patch, here I am only chaining the
> locking.

My bad, you're right.
