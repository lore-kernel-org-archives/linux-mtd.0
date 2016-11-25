Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAKRP-0004i9-2s
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 17:37:40 +0000
Received: by mail-wm0-x244.google.com with SMTP id m203so8697256wma.3
 for <linux-mtd@lists.infradead.org>; Fri, 25 Nov 2016 09:37:18 -0800 (PST)
Subject: Re: [PATCH v5 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake SoC
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org
References: <20161114102447.131602-1-mika.westerberg@linux.intel.com>
 <20161114102447.131602-4-mika.westerberg@linux.intel.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Lee Jones <lee.jones@linaro.org>,
 Peter Tyser <ptyser@xes-inc.com>, key.seong.lim@intel.com,
 linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <f17a9a5c-f3b6-85b0-efcc-9c3cbfcfb6e7@gmail.com>
Date: Fri, 25 Nov 2016 18:29:08 +0100
MIME-Version: 1.0
In-Reply-To: <20161114102447.131602-4-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/14/2016 11:24 AM, Mika Westerberg wrote:
> Intel Apollo Lake SoC exposes serial SPI flash through the LPC device. The
> SPI flash host controller is not discoverable through PCI config cycles
> because P2SB (function 0 of the device 13) is hidden by the BIOS. We unhide
> the device briefly in order to read BAR 0 of the SPI host controller.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>

Acked-by: Marek Vasut <marek.vasut@gmail.com>


-- 
Best regards,
Marek Vasut
