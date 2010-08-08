Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oi175-0002TP-P3
	for linux-mtd@lists.infradead.org; Sun, 08 Aug 2010 08:20:13 +0000
Date: Sun, 8 Aug 2010 09:19:56 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 6/8] mxc_nand: fix correct_data function
Message-ID: <20100808081955.GB8687@n2100.arm.linux.org.uk>
References: <1281102791-8089-1-git-send-email-s.hauer@pengutronix.de>
	<1281102791-8089-7-git-send-email-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1281102791-8089-7-git-send-email-s.hauer@pengutronix.de>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, Baruch Siach <baruch@tkos.co.il>,
	linux-mtd@lists.infradead.org, John Ogness <john.ogness@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 06, 2010 at 03:53:09PM +0200, Sascha Hauer wrote:
> +		err = ecc_stat & ecc_bit_mask;
> +		if (err > err_limit) {
> +			printk(KERN_WARNING "UnCorrectable RS-ECC Error\n");
> +			return -1;

Someone's being lazy.
