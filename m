Subject: Re: [PATCH 2/4] nand base: Give drivers a chance to do late
	initialization.
From: David Woodhouse <dwmw2@infradead.org>
To: Scott Wood <scottwood@freescale.com>
In-Reply-To: <20071213171551.GA4459@loki.buserror.net>
References: <20071213171551.GA4459@loki.buserror.net>
Content-Type: text/plain
Date: Tue, 08 Jan 2008 07:57:49 +0000
Message-Id: <1199779069.4111.379.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 2007-12-13 at 11:15 -0600, Scott Wood wrote:
> Some nand controllers, such as the Freescale enhanced local bus controller,
> need to do late initialization based on details of the chip that has been
> probed, such as chip size, large/small pages, etc.  A late_init() callback
> method is added to allow this.

Do you really need this so late? Can't it be done between
nand_scan_ident() and nand_scan_tail()? That's why we split nand_scan()
into two in the first place...

-- 
dwmw2
