Received: from mail-oa0-f49.google.com ([209.85.219.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TL44N-0007on-WE
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 03:31:52 +0000
Received: by mail-oa0-f49.google.com with SMTP id l10so3527528oag.36
 for <linux-mtd@lists.infradead.org>; Sun, 07 Oct 2012 20:31:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5072496A.3040205@freescale.com>
References: <1348425062-17427-1-git-send-email-festevam@gmail.com>
 <50723E5C.3020403@freescale.com>
 <CAOMZO5AE22Kscv8JAxiazzR5NSvEH+qs4QxBC6aEQqi3ZCpCpg@mail.gmail.com>
 <5072496A.3040205@freescale.com>
Date: Mon, 8 Oct 2012 00:31:50 -0300
Message-ID: <CAOMZO5B4c+qaKrz2skB_vGCRBW-9mUhhOaCUtiEqtv36V8i5eQ@mail.gmail.com>
Subject: Re: [PATCH] nand: gpmi-nand: Fix clock registration
From: Fabio Estevam <festevam@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: marex@denx.de, artem.bityutskiy@linux.intel.com, shawn.guo@linaro.org,
 linux-mtd@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 8, 2012 at 12:32 AM, Huang Shijie <b32955@freescale.com> wrote:
>
> This patch is really not needed.
>
> The clk_get() can get the right clock in the mx23/mx28. I tested them.

Please test it on linux-next.

gpmi nand can not event be probed.

Regards,

Fabio Estevam
