Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I5xqr-00079z-0w
	for linux-mtd@lists.infradead.org; Wed, 04 Jul 2007 01:56:34 -0400
Subject: Re: [PATCH] [2.6.23] nand_flash_dev - add manufacturer ID
From: Thomas Gleixner <tglx@linutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1183507424.29081.73.camel@shinybook.infradead.org>
References: <200707032354.l63Ns7gh010492@escobita.pasemi.com>
	<1183507424.29081.73.camel@shinybook.infradead.org>
Content-Type: text/plain
Date: Wed, 04 Jul 2007 07:55:54 +0200
Message-Id: <1183528554.3291.60.camel@chaos>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: olof@lixom.net, linux-mtd@lists.infradead.org, c@pasemi.com,
	Egor Martovetsky <egor@pasemi.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-07-03 at 20:03 -0400, David Woodhouse wrote:
> The difference between LP_OPTIONS and the options you've set for the new
> chip is just NAND_NO_PADDING | NAND_COPYBACK, right? Neither of which we
> actually use right now _anyway_.
> 
> I wonder if we should do this differently, and mask certain features in
> or out according to the manufacturer, after identifying the chip.

We do that already:

        /* Check if chip is a not a samsung device. Do not clear the
         * options for chips which are not having an extended id.
         */
        if (*maf_id != NAND_MFR_SAMSUNG && !type->pagesize)
                chip->options &= ~NAND_SAMSUNG_LP_OPTIONS;

So we should do this for that one as well.

	tglx
