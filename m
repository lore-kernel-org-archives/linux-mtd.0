Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCTvw-0005Rl-3r
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 16:10:07 +0000
Received: by mail-wm0-x243.google.com with SMTP id a20so35014376wme.2
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2016 08:09:43 -0800 (PST)
Subject: Re: [PATCH v6 2/3] mfd: lpc_ich: Add support for SPI serial flash
 host controller
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org
References: <20161128120626.130693-1-mika.westerberg@linux.intel.com>
 <20161128120626.130693-3-mika.westerberg@linux.intel.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Lee Jones <lee.jones@linaro.org>,
 Peter Tyser <ptyser@xes-inc.com>, key.seong.lim@intel.com,
 linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <addd594e-5121-3b9e-fa17-a14119bdfeee@gmail.com>
Date: Thu, 1 Dec 2016 17:09:14 +0100
MIME-Version: 1.0
In-Reply-To: <20161128120626.130693-3-mika.westerberg@linux.intel.com>
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

On 11/28/2016 01:06 PM, Mika Westerberg wrote:
> Many Intel CPUs including Haswell, Broadwell and Baytrail have SPI serial
> flash host controller as part of the LPC device. This will populate an MFD
> cell suitable for the SPI host controller driver if we know that the LPC
> device has one.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>


-- 
Best regards,
Marek Vasut
