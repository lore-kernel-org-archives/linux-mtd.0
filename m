Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqQjr-0002Vz-11
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 19:46:14 +0000
Date: Wed, 13 Apr 2016 12:45:46 -0700
From: Tony Lindgren <tony@atomide.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Franklin S Cooper Jr <fcooper@ti.com>, nsekhar@ti.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, rogerq@ti.com,
 devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] ARM: dts: am33xx: Fix GPMC dma properties
Message-ID: <20160413194546.GA5995@atomide.com>
References: <1457654203-20856-1-git-send-email-fcooper@ti.com>
 <1457654203-20856-3-git-send-email-fcooper@ti.com>
 <56E2CF04.4020806@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56E2CF04.4020806@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Peter Ujfalusi <peter.ujfalusi@ti.com> [160311 06:01]:
> On 03/11/2016 01:56 AM, Franklin S Cooper Jr wrote:
> > This patch updates the GPMC's DT DMA property to reflect the updated eDMA
> > bindings.
> > 
> > Fixes: b5e509066074 ("ARM: DTS: am33xx: Use the new DT bindings for the eDMA3")
> 
> I have double checked the switch over to the new eDMA bindings when I sent it
> and there were no gpmc node existed back then afaik.
> 
> Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

Applying patches 2 & 3 into omap-for-v4.6/fixes thanks.

Tony
