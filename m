Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T1Pwj-0000Te-Kf
 for linux-mtd@lists.infradead.org; Tue, 14 Aug 2012 22:50:46 +0000
Received: by obbta17 with SMTP id ta17so1215986obb.36
 for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2012 15:50:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1343514616-9019-2-git-send-email-festevam@gmail.com>
References: <1343514616-9019-1-git-send-email-festevam@gmail.com>
 <1343514616-9019-2-git-send-email-festevam@gmail.com>
Date: Tue, 14 Aug 2012 19:50:39 -0300
Message-ID: <CAOMZO5ApXx6WB8XkrsMAgM+haJko=6WgiNby3yEj-N7tnktu+w@mail.gmail.com>
Subject: Re: [PATCH 1/2] nand: nand_bbt: Export nand_update_bbt
From: Fabio Estevam <festevam@gmail.com>
To: Artem.Bityutskiy@linux.intel.com
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org, marex.vasut@denx.de, kernel@pengutronix.de,
 shawn.guo@linaro.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

On Sat, Jul 28, 2012 at 7:30 PM, Fabio Estevam <festevam@gmail.com> wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> When building MTD_NAND_GPMI_NAND as module, the following error shows up:
>
> ERROR: "nand_update_bbt" [drivers/mtd/nand/gpmi-nand/gpmi_nand.ko] undefined!
>
> Export nand_update_bbt to fix it.
>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Any comments on this series, please?
