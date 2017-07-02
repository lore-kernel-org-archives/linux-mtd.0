Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dRhqz-00056L-Pc
 for linux-mtd@lists.infradead.org; Sun, 02 Jul 2017 16:36:11 +0000
Date: Sun, 02 Jul 2017 18:35:01 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 05/14] MIPS: ingenic: Enable pinctrl for all ingenic
 SoCs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Alexandre Courbot <gnurou@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Thierry Reding
 <thierry.reding@gmail.com>, Bartlomiej Zolnierkiewicz
 <b.zolnierkie@samsung.com>, Maarten ter Huurne <maarten@treewalker.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Paul Burton <paul.burton@imgtec.com>,
 James Hogan <james.hogan@imgtec.com>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Message-Id: <1499013301.1477.0@smtp.crapouillou.net>
In-Reply-To: <CACRpkdauf5c2i4o5i8QY8YHPNjizkvTu6kAbnquWiP_=v2=KdQ@mail.gmail.com>
References: <20170402204244.14216-2-paul@crapouillou.net>
 <20170428200824.10906-1-paul@crapouillou.net>
 <20170428200824.10906-6-paul@crapouillou.net>
 <CACRpkdauf5c2i4o5i8QY8YHPNjizkvTu6kAbnquWiP_=v2=KdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

> I applied all the patches to a branch in pinctrl and merged into my
> devel branch for testing:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/
> Branch: ingenic
> 
> Ralf: are you OK with this? It would be nice to have your ACK on
> all patches. If you want you can pull this branch into the MIPS
> tree, or we can hope for it all to settle nicely because of low 
> platform
> activity in MIPS on this platform, so it only needs to come in
> from my trees.

There has been no word from Ralf, is this going into 4.13?
