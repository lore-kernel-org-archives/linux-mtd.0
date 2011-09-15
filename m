Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R4C9q-0003fq-Oe
	for linux-mtd@lists.infradead.org; Thu, 15 Sep 2011 13:39:15 +0000
Received: by eyd9 with SMTP id 9so1358408eyd.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Sep 2011 06:39:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201109151333.48684.jbe@pengutronix.de>
References: <201109151333.48684.jbe@pengutronix.de>
Date: Thu, 15 Sep 2011 09:39:11 -0400
Message-ID: <CAN8TOE9YctZ8hO7UTM9k7f8SBaWPzyBHyEgtK96Su5MRCrMjPA@mail.gmail.com>
Subject: Re: How to distinguish MLC and SLC NANDs?
From: Brian Norris <computersforpeace@gmail.com>
To: Juergen Beisert <jbe@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 15, 2011 at 7:33 AM, Juergen Beisert <jbe@pengutronix.de> wrote:
> Is there a unique pattern for MLC
> or SLC in the mtd structure available after calling nand_scan_ident() to
> select what correction sum type should be used for the attached NAND?

Actually, there isn't anything available in struct mtd_info. This
belongs in struct nand_chip, actually, since it's a NAND-specific
feature. In fact, there is some data available there. As you can see
in nand_get_flash_type() in nand_base.c, we fill in the
`chip->cellinfo' field, then later use a mask on it like this:

chip->cellinfo & NAND_CI_CELLTYPE_MSK

According to the data sheets for *most* NAND parts, this is a safe way
of determining SLC vs. MLC (non-zero => MLC; zero => SLC), and we use
it for certain detection code paths. Note that if the chip uses ONFI,
you supply your own ID table, or the chip uses some of the older ID
codes, nand_base.c won't set chip->cellinfo for you; but it will
default to SLC I think, which is the correct option for old parts.

But it's up to you to determine your own reliance on this method. I
don't know of any users who rely on `chip->cellinfo &
NAND_CI_CELLTYPE_MSK' for this type of information.

Brian
