Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRdVf-0000o5-UQ
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 09:16:32 +0000
Received: by pdjg10 with SMTP id g10so26866102pdj.1
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 01:16:10 -0800 (PST)
Date: Sat, 28 Feb 2015 01:15:52 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2] mtd: pxa3xx-nand: handle PIO in threaded interrupt
Message-ID: <20150228091552.GA12966@brian-ubuntu>
References: <1424457403-6669-1-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1424457403-6669-1-git-send-email-robert.jarzmik@free.fr>
Cc: linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 20, 2015 at 07:36:43PM +0100, Robert Jarzmik wrote:
> Change the handling of the data stage in the driver : don't pump data in
> the top-half interrupt, but rather schedule a thread for non dma cases.
> 
> This will enable latencies in the data pumping, especially if delays are
> required. Moreover platform shall be more reactive as other interrupts
> can be served while pumping data.
> 
> No throughput degradation was observed, at least on the zylonite
> platform, while a slight degradation was being expected.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Tested-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
> Since v1: use IRQF_ONESHOT per Maxime's comment

Pushed to l2-mtd.git. Thanks.

Brian
