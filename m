Received: from mail-ua0-x22a.google.com ([2607:f8b0:400c:c08::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXDwq-0003NU-5E
 for linux-mtd@lists.infradead.org; Mon, 17 Jul 2017 21:53:02 +0000
Received: by mail-ua0-x22a.google.com with SMTP id b64so3233188uab.0
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2017 14:52:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170717230828.0c8853ca@bbrezillon>
References: <1500324959-7682-1-git-send-email-festevam@gmail.com>
 <20170717230828.0c8853ca@bbrezillon>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 17 Jul 2017 18:52:38 -0300
Message-ID: <CAOMZO5AHUqW=EuyLHpEzG4=gtx5swxUzn0jEi8sDoMWjsb36GA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: vf610: Check the return value from
 clk_prepare_enable()
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Stefan Agner <stefan@agner.ch>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Fabio Estevam <fabio.estevam@nxp.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Mon, Jul 17, 2017 at 6:08 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:

> AFAICT pinctrl_pm_select_default_state() can also fail. What makes it
> different from clk_prepare_enable() failures?

IMHO we could even remove pinctrl_pm_select_default_state() from this
driver since pinctrl_pm_select_sleep_state() is never used.

This is the only driver that uses pinctrl_pm_select_default_state()
inside drivers/mtd/.
