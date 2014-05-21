Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wn94w-0003vh-Qp
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 16:09:19 +0000
Date: Wed, 21 May 2014 13:08:18 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [RFC PATCH 00/16] OMAP: GPMC: Restructure OMAP GPMC driver (NAND)
Message-ID: <20140521160818.GA1150@arch.cereza>
References: <1400671264-10702-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1400671264-10702-1-git-send-email-rogerq@ti.com>
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, tony@atomide.com,
 robertcnelson@gmail.com, jg1.han@samsung.com, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, pekon@ti.com,
 javier@dowhile0.org, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Roger,

On 21 May 02:20 PM, Roger Quadros wrote:
> 
> For DT boot:
> - The GPMC controller node should have a chip select (CS) node for each used
>   chip select. The CS node must have a child device node for each device
>   attached to that chip select. Properties for that child are GPMC agnostic.
> 
>   i.e.
> 	gpmc {
> 		cs0 {
> 			nand0 {
> 			}
> 		};
> 
> 		cs1 {
> 			nor0 {
> 			}
> 		}
> 		...
> 	};
> 

While I agree that the GPMC driver is a bit messy, I'm not sure it's possible
to go through such a complete devicetree binding re-design (breaking backwards
compatibility) now that the binding is already in production.

AFAIK, TI's SDK 7.0 is released, with a v3.8.x kernel which uses this GPMC
binding. And then you have the ISEE board too, using this binding.

Also, what's the problem with the current devicetree binding (not that I'm fan
of it)?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
