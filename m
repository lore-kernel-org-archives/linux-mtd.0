Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dS1q4-0004Xb-DT
 for linux-mtd@lists.infradead.org; Mon, 03 Jul 2017 13:56:34 +0000
Received: from localhost.localdomain ([127.0.0.1]:36250 "EHLO linux-mips.org"
 rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
 id S23994803AbdGCN4Iao-1i (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Mon, 3 Jul 2017 15:56:08 +0200
Date: Mon, 3 Jul 2017 15:55:55 +0200
From: Ralf Baechle <ralf@linux-mips.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Cercueil <paul@crapouillou.net>, Alexandre Courbot <gnurou@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maarten ter Huurne <maarten@treewalker.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Paul Burton <paul.burton@imgtec.com>,
 James Hogan <james.hogan@imgtec.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux MIPS <linux-mips@linux-mips.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v5 05/14] MIPS: ingenic: Enable pinctrl for all ingenic
 SoCs
Message-ID: <20170703135555.GA686@linux-mips.org>
References: <20170402204244.14216-2-paul@crapouillou.net>
 <20170428200824.10906-1-paul@crapouillou.net>
 <20170428200824.10906-6-paul@crapouillou.net>
 <CACRpkdauf5c2i4o5i8QY8YHPNjizkvTu6kAbnquWiP_=v2=KdQ@mail.gmail.com>
 <1499013301.1477.0@smtp.crapouillou.net>
 <CACRpkdb=Zti+C+2me_WP0=m6z12G5Kz+W_cPcZsw=CVzBO_wAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb=Zti+C+2me_WP0=m6z12G5Kz+W_cPcZsw=CVzBO_wAg@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 03, 2017 at 11:07:09AM +0200, Linus Walleij wrote:

> > There has been no word from Ralf, is this going into 4.13?

Acked-by: Ralf Baechle <ralf@linux-mips.org>

for the whole series.

Thanks,

  Ralf
