Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ceOuu-0002lT-3R
 for linux-mtd@lists.infradead.org; Thu, 16 Feb 2017 16:28:26 +0000
Received: by mail-ot0-x242.google.com with SMTP id t47so2099983ota.0
 for <linux-mtd@lists.infradead.org>; Thu, 16 Feb 2017 08:28:03 -0800 (PST)
Date: Thu, 16 Feb 2017 10:28:55 -0600
From: Marty Plummer <netz.kernel@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, cyrille.pitchen@atmel.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at
Subject: Re: mtd: spi-nor: hisi-sfc compatibility report
Message-ID: <20170216162854.hagnxukontcgkykn@tha-monstah.mydomain>
References: <20170215040646.hscl2kuc5nuvbel3@tha-monstah.mydomain>
 <e90185e2-db9e-0f1f-df44-1015f8950b36@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e90185e2-db9e-0f1f-df44-1015f8950b36@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 15, 2017 at 10:05:33PM +0100, Marek Vasut wrote:
> On 02/15/2017 05:06 AM, Marty Plummer wrote:
> > Greetings.
> > 
> > Just wanted to report that the hisi-sfc spi nor driver is compatible
> > with the Hi3521av100 SoC from Hisilicon. Odd that no hisilicon or huawei
> > emails are listed as a maintainer for it.
> > 
> 
> What does scripts/get-maintainer.pl show ?
> 
> -- 
> Best regards,
> Marek Vasut

Cyrille Pitchen <cyrille.pitchen@atmel.com> (maintainer:SPI NOR SUBSYSTEM)
Marek Vasut <marek.vasut@gmail.com> (maintainer:SPI NOR SUBSYSTEM)
David Woodhouse <dwmw2@infradead.org> (maintainer:MEMORY TECHNOLOGY DEVICES (MTD))
Brian Norris <computersforpeace@gmail.com> (maintainer:MEMORY TECHNOLOGY DEVICES (MTD))
Boris Brezillon <boris.brezillon@free-electrons.com> (maintainer:MEMORY TECHNOLOGY DEVICES (MTD))
Richard Weinberger <richard@nod.at> (maintainer:MEMORY TECHNOLOGY DEVICES (MTD))
linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM)
linux-kernel@vger.kernel.org (open list)

^ exactly this.
