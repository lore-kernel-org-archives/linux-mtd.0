Received: from mail-ob0-f170.google.com ([209.85.214.170])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V0bGY-00083d-Ex
 for linux-mtd@lists.infradead.org; Sat, 20 Jul 2013 17:48:22 +0000
Received: by mail-ob0-f170.google.com with SMTP id ef5so6679823obb.1
 for <linux-mtd@lists.infradead.org>; Sat, 20 Jul 2013 10:48:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1373471889-18107-6-git-send-email-wsa@the-dreams.de>
References: <1373471889-18107-1-git-send-email-wsa@the-dreams.de>
 <1373471889-18107-6-git-send-email-wsa@the-dreams.de>
Date: Sat, 20 Jul 2013 19:48:00 +0200
Message-ID: <CACRpkdbBYuPE6ZaiuWgEze0JuuqvhDFS7VLhVTJBopiLMBNJpw@mail.gmail.com>
Subject: Re: [PATCH 06/12] drivers/mtd/nand/gpmi-nand: don't use
 devm_pinctrl_get_select_default() in probe
From: Linus Walleij <linus.walleij@linaro.org>
To: Wolfram Sang <wsa@the-dreams.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>, Bill Pemberton <wfp5p@virginia.edu>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 10, 2013 at 5:57 PM, Wolfram Sang <wsa@the-dreams.de> wrote:

> Since commit ab78029 (drivers/pinctrl: grab default handles from device core),
> we can rely on device core for setting the default pins. Compile tested only.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org> (personally at LCE13)
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Artem  if you're OK with this please carry it in the MTD tree.

Yours,
Linus Walleij
