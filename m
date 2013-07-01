Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtWSH-0007cc-87
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 05:15:14 +0000
Message-ID: <1372655942.22014.2.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 05/13] mtd: gpmi-nand : Let device core handle pinctrl
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Fabio Estevam <fabio.estevam@freescale.com>
Date: Mon, 01 Jul 2013 08:19:02 +0300
In-Reply-To: <1367863561-11534-5-git-send-email-fabio.estevam@freescale.com>
References: <1367863561-11534-1-git-send-email-fabio.estevam@freescale.com>
 <1367863561-11534-5-git-send-email-fabio.estevam@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: festevam@gmail.com, shawn.guo@linaro.org, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-05-06 at 15:05 -0300, Fabio Estevam wrote:
> Since commit ab78029 (drivers/pinctrl: grab default handles from device core),
> we can rely on device core for handling pinctrl.
> 
> So remove devm_pinctrl_get_select_default() from the driver. 
> 
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: <linux-mtd@lists.infradead.org>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
-- 
Best Regards,
Artem Bityutskiy
