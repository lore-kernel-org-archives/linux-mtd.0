Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ux6Lo-0004Ez-KI
 for linux-mtd@lists.infradead.org; Thu, 11 Jul 2013 02:11:22 +0000
Message-ID: <51DE1514.20903@freescale.com>
Date: Thu, 11 Jul 2013 10:14:44 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 06/12] drivers/mtd/nand/gpmi-nand: don't use
 devm_pinctrl_get_select_default() in probe
References: <1373471889-18107-1-git-send-email-wsa@the-dreams.de>
 <1373471889-18107-6-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1373471889-18107-6-git-send-email-wsa@the-dreams.de>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, Bill Pemberton <wfp5p@virginia.edu>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA07=D4=C210=C8=D5 23:57, Wolfram Sang =D0=B4=B5=C0:
> Since commit ab78029 (drivers/pinctrl: grab default handles from device=
 core),
> we can rely on device core for setting the default pins. Compile tested=
 only.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org> (personally at LCE13=
)
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> ---=20
i remember Fabio had already sent a similar patch about this issue.

thanks
Huang Shijie
