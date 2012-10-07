Received: from 19.mo5.mail-out.ovh.net ([46.105.35.78]
 helo=mo5.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TKwtj-0005NV-OS
 for linux-mtd@lists.infradead.org; Sun, 07 Oct 2012 19:52:24 +0000
Received: from mail98.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with SMTP id BA467FF9A19
 for <linux-mtd@lists.infradead.org>; Sun,  7 Oct 2012 21:58:46 +0200 (CEST)
Date: Sun, 7 Oct 2012 21:49:59 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] mtd: delete nomadik_nand driver
Message-ID: <20121007194959.GF12801@game.jcrosoft.org>
References: <1349335729-13438-1-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1349335729-13438-1-git-send-email-linus.walleij@linaro.org>
Cc: Mike Turquette <mturquette@linaro.org>, linux-mtd@lists.infradead.org,
 Mike Turquette <mturquette@ti.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Rubini <rubini@unipv.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09:28 Thu 04 Oct     , Linus Walleij wrote:
> The nomadik_nand driver is really just a subset of the FSMC
> NAND driver, and there are no users anymore so let's delete
> it.
> 
> Cc: Alessandro Rubini <rubini@unipv.it>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> I'm seeking the MTD maintainer(s) ACK for this patch so I can
> merge it through the ARM SoC tree just after switching the
> platform to using the FSMC driver.
I've test the fsmc driver on nomadik too

Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

Best Regards,
J.
