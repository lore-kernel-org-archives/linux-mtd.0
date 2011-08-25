Subject: Re: [PATCH v8 0/4] add the GPMI-NAND support for imx23/imx28
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Thu, 25 Aug 2011 14:37:24 +0300
In-Reply-To: <1314169643-23425-1-git-send-email-b32955@freescale.com>
References: <1314169643-23425-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314272249.18988.55.camel@sauron>
Mime-Version: 1.0
Cc: s.hauer@pengutronix.de, linux-mtd@lists.infradead.org,
	w.sang@pengutronix.de, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-08-24 at 15:07 +0800, Huang Shijie wrote:
> The patch set is based on tag v3.1-rc2 of linus's tree.
> and it can be git-am to Artem's tree:
> 	http://git.infradead.org/users/dedekind/l2-mtd-2.6.git
> 
> The general-purpose media interface(GPMI) controller is a flexible interface
> to up to several NAND flashs.
> 
> The Bose Ray-Choudhury Hocquenghem(BCH) module is a hardware ECC accelerator.
> 
> With the help of BCH, the GPMI controller can choose to do the hardware ECC or
> not.

I thought that this series will go in via an imx sub-tree. If you want
it to go via the mtd tree, we'd need blessing from the imx subtree
maintainer, I think.

-- 
Best Regards,
Artem Bityutskiy
