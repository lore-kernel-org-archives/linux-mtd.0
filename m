Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNl2t-0006vh-Rf
 for linux-mtd@lists.infradead.org; Thu, 14 Jul 2016 18:07:36 +0000
Received: by mail-pa0-x236.google.com with SMTP id pp5so24108052pac.3
 for <linux-mtd@lists.infradead.org>; Thu, 14 Jul 2016 11:07:14 -0700 (PDT)
Date: Thu, 14 Jul 2016 11:07:11 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Stephen Warren <swarren@nvidia.com>,
 Jagan Teki <jteki@openedev.com>, Vignesh R <vigneshr@ti.com>,
 Marek Vasut <marex@denx.de>,
 Ezequiel =?iso-8859-1?Q?Garc=EDa?= <ezequiel@vanguardiasur.com.ar>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Furquan Shaikh <furquan@google.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v3] mtd: spi-nor: Add support for S3AN spi-nor
 devices
Message-ID: <20160714180711.GH54628@google.com>
References: <1463002402-7996-1-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1463002402-7996-1-git-send-email-ricardo.ribalda@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 28, 2016 at 11:25:11AM +0200, Ricardo Ribalda Delgado wrote:
> Xilinx Spartan-3AN FPGAs contain an In-System Flash where they keep
> their configuration data and (optionally) some user data.
> 
> The protocol of this flash follows most of the spi-nor standard. With
> the following differences:
> 
> - Page size might not be a power of two.
> - The address calculation (default addressing mode).
> - The spi nor commands used.
> 
> Protocol is described on Xilinx User Guide UG333
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
> 
> v3: 
> -Rebase on top of mtd-next
> -Rename ADDR_NATIVE to ADDR_DEFAULT to follow UG333 naming
> -Fix bug on probe
> 
> v2: Suggested by Brian Norris <computersforpeace@gmail.com>
> 
> -Remove inline qualifier
> -Improve documentation of Default Addressing Mode
> -Convert function callbacks into SNOR_F_
> -Fix missmatch braces
> -Improve documentation of SPI_S3AN flag
> 
>  drivers/mtd/devices/m25p80.c  |   3 ++
>  drivers/mtd/spi-nor/spi-nor.c | 110 ++++++++++++++++++++++++++++++++++++++++--
>  include/linux/mtd/spi-nor.h   |  26 ++++++++++
>  3 files changed, 136 insertions(+), 3 deletions(-)

This still doesn't apply to l2-mtd.git / linux-next.git. If I get time,
I'll see how easily I can fix that up myself.
