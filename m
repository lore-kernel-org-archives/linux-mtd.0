Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V96tN-0005SH-T6
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 05:11:39 +0000
From: Marek Vasut <marex@denx.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] m25p80 / fast read
Date: Mon, 12 Aug 2013 22:13:08 +0200
References: <1376302946-11534-1-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1376302946-11534-1-git-send-email-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201308122213.09110.marex@denx.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Sascha Hauer,

> The following adds support for the mr25h10 chip to to the m25p80
> driver.
> 
> This driver currently has the problem that it unconditionally uses
> the fast_read command once it's enabled in Kconfig which of course
> leads to problems with multiboard kernels. This series adds a flag
> to the chip specific data to solve this. Also some unnecessary ifdefs
> are removed.
> 
> Sascha

Went through the whole series,

Acked-by: Marek Vasut <marex@denx.de>

Thanks!

Best regards,
Marek Vasut
