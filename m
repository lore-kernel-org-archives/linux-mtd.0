Received: from [212.18.228.66] (helo=mail.linuxgrrls.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aw3ob-0000td-J0
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2004 18:31:25 +0000
Received: from hex (hex [192.168.0.3])
	by mail.linuxgrrls.org (Postfix) with ESMTP id DCAFC743C5
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Feb 2004 18:29:33 +0000 (GMT)
Date: Wed, 25 Feb 2004 18:29:33 +0000 (GMT)
From: jasmine@linuxgrrls.org
To: linux-mtd@lists.infradead.org
In-Reply-To: <1077731948.7826.792.camel@hades.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.58.0402251827300.29757@hex>
References: <a06002001bc6281361918@[130.161.115.44]>
 <1077731948.7826.792.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: Re: Handling multiple NAND chips -- take 2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 25 Feb 2004, David Woodhouse wrote:

> On Wed, 2004-02-25 at 18:44 +0100, J.D. Bakker wrote:
> > This is the plan; fire at will.
> 
> Why? What'd poor Will do wrong? 

He's a no-good commie.

> I think that's acceptable. It's _definitely_ OK on NOR. On NAND we may
> be sharing some control lines between different chips, but I still think
> it's OK and we can deal with that in the board-level driver.

What if you have a board with an onboard NAND (for the OS) and a 
SmartMedia slot?  That's surprisingly common.  It's very difficult to buy 
consistent Smartmedia cards, too-  they often have different parts in 
them during a run.

> > chip = global_page_addr / pages_per_chip;
> > page = global_page_addr % pages_per_chip;
> 
> I think so. I prefer it to the other.

divide not shift?

-J.
