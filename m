Received: from 18.mo4.mail-out.ovh.net ([188.165.54.143]
 helo=mo4.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TMN9T-0003xS-Sd
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 18:06:33 +0000
Received: from mail433.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo4.mail-out.ovh.net (Postfix) with SMTP id E8F4A104F82C
 for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2012 20:12:56 +0200 (CEST)
Date: Thu, 11 Oct 2012 20:04:06 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] ARM: nomadik: switch over to using the FSMC driver
Message-ID: <20121011180406.GX12801@game.jcrosoft.org>
References: <1349335709-13399-1-git-send-email-linus.walleij@linaro.org>
 <1349953632.12014.8.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1349953632.12014.8.camel@sauron.fi.intel.com>
Cc: Mike Turquette <mturquette@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 Alessandro Rubini <rubini@unipv.it>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14:07 Thu 11 Oct     , Artem Bityutskiy wrote:
> On Thu, 2012-10-04 at 09:28 +0200, Linus Walleij wrote:
> > The Nomadik NAND driver is really just a subset of the existing
> > FSMC driver, so let's switch over to using that driver instead,
> > since it handles more variants of this chip. The callbacks for
> > setting up the chip is doing stuff now handled by the FSMC
> > driver.
> > 
> > Cc: Alessandro Rubini <rubini@unipv.it>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Pushed both to l2-mtd.git, thanks!
wait on this one Linus said he will send an other version based on my patch
for fmsc

Best Regards,
J.
> 
> -- 
> Best Regards,
> Artem Bityutskiy



> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
