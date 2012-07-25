Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Stz0f-00085C-LP
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2012 10:40:06 +0000
Received: by obbta17 with SMTP id ta17so945058obb.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Jul 2012 03:38:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <500FCCA7.40604@freescale.com>
References: <1343146515-18578-1-git-send-email-festevam@gmail.com>
 <500F8B1A.6070605@freescale.com>
 <CAOMZO5BLFp-FOa4n5HpuA2ug6tbxX9kKq8fUeg5a=ytCFFq3UA@mail.gmail.com>
 <500FCCA7.40604@freescale.com>
Date: Wed, 25 Jul 2012 07:38:45 -0300
Message-ID: <CAOMZO5CqU6ihscOojp6P1i4EA=fawN0pbZtVMe=EcCxX=szopg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: Select MXS_DMA for MTD_NAND_GPMI_NAND
From: Fabio Estevam <festevam@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Artem.Bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, shawn.guo@linaro.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 25, 2012 at 7:38 AM, Huang Shijie <b32955@freescale.com> wrote:

> If we want to fix it, we can add the "depend on MXS-DMA" for gpmi nand.

Ok, I will submit a fix using "depends" then.

Thanks,

Fabio Estevam
