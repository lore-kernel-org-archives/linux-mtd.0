Received: from mail-vb0-x22b.google.com ([2607:f8b0:400c:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ugi3X-0002C5-RB
 for linux-mtd@lists.infradead.org; Sun, 26 May 2013 21:00:44 +0000
Received: by mail-vb0-f43.google.com with SMTP id e12so1987852vbg.2
 for <linux-mtd@lists.infradead.org>; Sun, 26 May 2013 14:00:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1367863561-11534-5-git-send-email-fabio.estevam@freescale.com>
References: <1367863561-11534-1-git-send-email-fabio.estevam@freescale.com>
 <1367863561-11534-5-git-send-email-fabio.estevam@freescale.com>
Date: Sun, 26 May 2013 18:00:20 -0300
Message-ID: <CAOMZO5DLc+U+=Yq71QQG+ddYA0boPgMRY4HrJpcyL4=Qk9t=uQ@mail.gmail.com>
Subject: Re: [PATCH 05/13] mtd: gpmi-nand : Let device core handle pinctrl
From: Fabio Estevam <festevam@gmail.com>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Fabio Estevam <fabio.estevam@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: shawn.guo@linaro.org, linux-mtd@lists.infradead.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Mon, May 6, 2013 at 3:05 PM, Fabio Estevam
<fabio.estevam@freescale.com> wrote:
> Since commit ab78029 (drivers/pinctrl: grab default handles from device core),
> we can rely on device core for handling pinctrl.
>
> So remove devm_pinctrl_get_select_default() from the driver.
>
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: <linux-mtd@lists.infradead.org>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Any comments on this one?
