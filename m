Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzYri-0007Ky-Ao
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2015 23:43:47 +0000
Received: by padhx2 with SMTP id hx2so96007134pad.1
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 15:43:25 -0800 (PST)
Date: Thu, 19 Nov 2015 15:43:23 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Hou Zhiqiang <B48286@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 Han Xu <han.xu@freescale.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Ben Hutchings <ben@decadent.org.uk>, Marek Vasut <marex@denx.de>,
 Gabor Juhos <juhosg@openwrt.org>,
 Bean Huo =?utf-8?B?6ZyN5paM5paMLA==?=  <beanhuo@micron.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>, Huang Shijie <shijie.huang@arm.com>
Subject: Re: [PATCH v4 0/7] Add spi-nor SPI transfer error handling
Message-ID: <20151119234323.GO64635@google.com>
References: <cover.1439543572.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1439543572.git.hramrach@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Michal,

On Fri, Aug 14, 2015 at 09:23:06AM -0000, Michal Suchanek wrote:
> Hello,
> 
> with these patches SPI transfer errors are not silently ignored but rather
> reported to spi-nor users.
> 
> This should prevent silently dropping data to the floor in cases when the SPI
> transfer fails and the failure is detected.
> 
> It has been pointed out that MTD users do not handle the case when data is read
> only partially so this version adds the last patch which handles this in
> spi-nor.
> 
> Thanks
> 
> Michal
> 
> Michal Suchanek (7):
>   mtd: spi-nor: change return value of read/write
>   mtd: m25p80: return amount of data transferred or error in read/write
>   mtd: fsl-quadspi: return amount of data read/written or error
>   mtd: spi-nor: check return value from read/write
>   mtd: spi-nor: stop passing around retlen

Patches 1 to 5 look good to me, though there is a new spi-nor driver
since you sent this. Can you rebase/fixup?

>   mtd: spi-nor: simplify write loop
>   mtd: spi-nor: add read loop

I posted some comments for these. I get the feeling that patch 6 is
over-complicated and should be just a simple assertion. And I'm still
not 100% sure on the approach for patch 7, since it's not clear whether
the responsibility lies in the SPI layer or in MTD.

Brian

>  drivers/mtd/devices/m25p80.c      | 33 +++++++++------
>  drivers/mtd/spi-nor/fsl-quadspi.c | 29 ++++++-------
>  drivers/mtd/spi-nor/spi-nor.c     | 85 +++++++++++++++++++++++----------------
>  include/linux/mtd/spi-nor.h       |  8 ++--
>  4 files changed, 91 insertions(+), 64 deletions(-)
> 
> -- 
> 2.1.4
> 
