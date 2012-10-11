Received: from mail-da0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TMDWI-0004ek-I6
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 07:49:27 +0000
Received: by mail-da0-f49.google.com with SMTP id q27so647717daj.36
 for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2012 00:49:24 -0700 (PDT)
Date: Thu, 11 Oct 2012 15:49:16 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] ARM: dts: mxs: add the "clock-names" for gpmi-nand
Message-ID: <20121011074912.GB26298@S2101-09.ap.freescale.net>
References: <201210101237.13640.marex@denx.de>
 <1349864829-19565-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1349864829-19565-1-git-send-email-b32955@freescale.com>
Cc: marex@denx.de, linux-mtd@lists.infradead.org, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 10, 2012 at 06:27:09PM +0800, Huang Shijie wrote:
> The current DT nodes for mx23/mx28 miss the `clocks-names` item for gpmi-nand.
> So the gpmi-nand driver could not find the proper clock.
> 
> This patch fixes this issue.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Applied, thanks.

Shawn
