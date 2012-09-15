Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TCsV0-0006R7-BH
 for linux-mtd@lists.infradead.org; Sat, 15 Sep 2012 13:33:32 +0000
Received: by obbta17 with SMTP id ta17so7814249obb.36
 for <linux-mtd@lists.infradead.org>; Sat, 15 Sep 2012 06:33:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346855725-31726-2-git-send-email-festevam@gmail.com>
References: <1346855725-31726-1-git-send-email-festevam@gmail.com>
 <1346855725-31726-2-git-send-email-festevam@gmail.com>
Date: Sat, 15 Sep 2012 10:33:25 -0300
Message-ID: <CAOMZO5Ct4RNz7F0mnH3RJbO83mDYsckqQANSipqZajj4dnBH_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: mxc_nand: Convert to platform driver
From: Fabio Estevam <festevam@gmail.com>
To: artem.bityutskiy@linux.intel.com
Content-Type: text/plain; charset=UTF-8
Cc: marex@denx.de, b32955@freescale.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <fabio.estevam@freescale.com>, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Wed, Sep 5, 2012 at 11:35 AM, Fabio Estevam <festevam@gmail.com> wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> Using module_platform_driver() makes the code smaller and cleaner.
>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---

Does this series look fine?

Thanks,

Fabio Estevam
