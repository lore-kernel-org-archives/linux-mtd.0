Received: from mail-vx0-f177.google.com ([209.85.220.177])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5zmZ-0003ip-Qp
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 13:22:57 +0000
Received: by vcbf13 with SMTP id f13so1727027vcb.36
 for <linux-mtd@lists.infradead.org>; Fri, 09 Mar 2012 05:22:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1331296632.29445.18.camel@sauron.fi.intel.com>
References: <1328960705-18699-1-git-send-email-hechtb@gmail.com>
 <CABYn4sydNW_S=mivCOCd5RoxeW0T+Q-encFRUps2xYU0_H2GHg@mail.gmail.com>
 <1331295112.29445.14.camel@sauron.fi.intel.com>
 <1351292.ArCFK2UoQF@avalon>
 <1331296632.29445.18.camel@sauron.fi.intel.com>
Date: Fri, 9 Mar 2012 22:22:52 +0900
Message-ID: <CANqRtoRpwGeOKa2R9+mjbeaW9bkD-p4GWg94cZwz-t8QUH2xVA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] SH Mobile sh_flctl driver brush up
From: Magnus Damm <magnus.damm@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Simon Horman <horms@verge.net.au>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Bastian Hecht <hechtb@googlemail.com>, linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 9, 2012 at 9:37 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Fri, 2012-03-09 at 13:14 +0100, Laurent Pinchart wrote:
>> ARCH_SHMOBILE is an ARM platform (defined in arch/arm/Kconfig).
>
> Hmm, ok, thanks. So you say that
>
> http://www.renesas.eu/products/soc/assp/mobile/sh_mobile/mt1/index.jsp
>
> saying "CPU core: sh4a" actually means ARM? I must be very confused :-)

Certain product lines of SoCs from Renesas have both ARM and SH in
them. The ones with only SH are supported under arch/sh and the ARM
based ones under arch/arm/mach-shmobile. Both ARM and SH variants can
be found in anything from vending machines to cars and cellphones.

Regardless of CPU archtecture, endian and availability of MMU they do
share a lot of I/O device hardware IP. The mtd driver for FLCTL is one
such case, if I recall correctly I have seen it in at least 10
different SoCs. Other popular areas that have shared ARM and SH
drivers include mmc, input, network, fbdev, v4l2, i2c and spi.

I believe Bastian is using a sh7372 based Mackerel board which is
fully supported upstream under arch/arm/mach-shmobile. Hope this
helps!

Cheers,

/ magnus
