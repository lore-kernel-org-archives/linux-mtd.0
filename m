Message-ID: <4F3C623A.3000301@freescale.com>
Date: Thu, 16 Feb 2012 09:56:10 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] mtd/gpmi : add gpmi support for mx6q
References: <1328505606-27981-1-git-send-email-b32955@freescale.com>
 <20120215183720.GA2399@r65073-Latitude-D630>
In-Reply-To: <20120215183720.GA2399@r65073-Latitude-D630>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: artem.bityutskiy@intel.com, linux-mtd@lists.infradead.org,
 w.sang@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
> The imx6q only supports DT boot, but I do not see you are adding DT
> probe for the driver, so I'm wondering how you tested the driver on
> imx6q.
>
This patch is just the first patch  for mx6q. My following patches will
add DT to the gpmi nand driver for mx6q. Due to the dependency issue, I 
will send the patches
in the following order:
[1] mtd/gpmi: add gpmi support for mx6q.
[2] [PATCH v5] patch set about the MXS-DMA
[3] add DT support to gpmi for mx6q.

I tested this patch based on our bsp code.

BR
Huang Shijie
