Received: from smtp10.smtpout.orange.fr ([80.12.242.132]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0E7N-0003Nt-MY
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2015 19:14:26 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 2/7] Documentation: bindings: document the clocks for
 pxa3xx-nand
References: <1433266351-22587-1-git-send-email-antoine.tenart@free-electrons.com>
 <1433266351-22587-3-git-send-email-antoine.tenart@free-electrons.com>
Date: Wed, 03 Jun 2015 21:12:28 +0200
In-Reply-To: <1433266351-22587-3-git-send-email-antoine.tenart@free-electrons.com>
 (Antoine Tenart's message of "Tue, 2 Jun 2015 19:32:26 +0200")
Message-ID: <87fv6861yb.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
Cc: zmxu@marvell.com, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, jszhang@marvell.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Antoine Tenart <antoine.tenart@free-electrons.com> writes:

> The pxa3xx nand driver requires at least one clock to probe correctly.
> A second one, named 'ecc' can be specified if needed. Add the
> corresponding documentation.
Is it mandatory, really ?
The code does :
	info->clk = devm_clk_get(&pdev->dev, NULL);
	if (IS_ERR(info->clk)) {
		dev_err(&pdev->dev, "failed to get nand clock\n");
		return PTR_ERR(info->clk);
	}

info->clk can very well be NULL, can't it ?

Cheers.

--
Robert
