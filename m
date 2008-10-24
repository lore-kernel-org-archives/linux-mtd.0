Received: from mu-out-0910.google.com ([209.85.134.184])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KtHq5-00054y-Ag
	for linux-mtd@lists.infradead.org; Fri, 24 Oct 2008 08:16:09 +0000
Received: by mu-out-0910.google.com with SMTP id w1so584442mue.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Oct 2008 01:16:07 -0700 (PDT)
Message-ID: <49018440.9080808@gmail.com>
Date: Fri, 24 Oct 2008 10:16:00 +0200
From: Karl Beldan <karl.beldan@gmail.com>
MIME-Version: 1.0
To: pma@mediamatech.com
Subject: Re: Micron NAND Rev D: initial reset
References: <BDE9ED4C970C44469B8BC19E9AF7D67B@petebook>
In-Reply-To: <BDE9ED4C970C44469B8BC19E9AF7D67B@petebook>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter Ma wrote:
> Hi, there...
> 
> I am trying to add mtd/nand driver support for the Micron MT29F2G08AADWP
> (Revision D) on 2.6.26.  
> 
> According to Micron, the difference (aside from ID code) between Rev D and
> the popular Rev C, is that the Rev D requires a RESET command to be issued
> after power-up and before any other command is issued.
> 
> I am just diving into the nand driver, but I thought I would ask if there is
> a good place to issue that RESET after power-up.
> 
> I do not see a specific "nand_reset()" function in nand_base.c  I assume I
> need to create this function, then have it called within the platform driver
> probe, just before the first command (nand_scan_ident).
> 
> Or is there a more generic way to go about this?  And if so, I assume
> inserting a RESET command like this would be transparent to other NAND
> chips?
> 
added in ef89a8801321e0d0665c327c9d77d602ef764c87.

-- 
Karl
