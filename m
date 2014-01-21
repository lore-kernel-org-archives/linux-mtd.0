Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5dU1-0001Ku-Qz
 for linux-mtd@lists.infradead.org; Tue, 21 Jan 2014 15:43:23 +0000
From: Marek Vasut <marex@denx.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/4] mtd: m25p80: Add dual read support
Date: Tue, 21 Jan 2014 16:42:16 +0100
References: <1390309159-19643-1-git-send-email-geert@linux-m68k.org>
 <1390309159-19643-4-git-send-email-geert@linux-m68k.org>
In-Reply-To: <1390309159-19643-4-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201401211642.16701.marex@denx.de>
Cc: Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, January 21, 2014 at 01:59:18 PM, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert+renesas@linux-m68k.org>
> 
> Add support for Dual SPI read transfers, which is supported by some
> Spansion SPI FLASHes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@linux-m68k.org>

I don't see any obvious issue:

Acked-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
