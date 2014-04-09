Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXwap-0006JK-28
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 17:47:23 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 4/9] Documentation: spi-nor: rewrite some portions
Date: Wed, 9 Apr 2014 19:44:15 +0200
References: <1397064774-31784-1-git-send-email-computersforpeace@gmail.com>
 <1397064774-31784-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1397064774-31784-4-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404091944.15631.marex@denx.de>
Cc: Huang Shijie <b32955@freescale.com>, Lee Jones <lee.jones@linaro.org>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, April 09, 2014 at 07:32:49 PM, Brian Norris wrote:
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> WIP. This could be improved more (e.g., don't spend too much time
> documenting history; just document the current framework)
> 
>  Documentation/mtd/spi-nor.txt | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/mtd/spi-nor.txt b/Documentation/mtd/spi-nor.txt
> index 294d5b06f892..bfcdeb94e053 100644
> --- a/Documentation/mtd/spi-nor.txt
> +++ b/Documentation/mtd/spi-nor.txt
> @@ -1,16 +1,20 @@
>                            SPI NOR framework
>                 ============================================
> 
> -Part I - why we need this framework?
> +Part I - Why do we need this framework?
>  -------------------------------------

The underline is not matching the length of the text now ;-)

> 
> -The SPI bus controller only deals with the byte stream.
> -Some controller does not works like a SPI bus controller, it works
> -like a SPI NOR controller instead, such as the Freescale's QuadSPI
> controller. +SPI bus controllers (drivers/spi/) only deal with streams of
> bytes; the bus +controller operates agnostic of the specific device
> attached. However, some +controllers (such as Freescale's QuadSPI
> controller) cannot easily handle +arbitrary streams of bytes, but rather
> are designed specifically for SPI NOR.

You use the word 'specifically' here and below quick after one another, that 
doesn't sound nice when you read the text.

> -The Freescale's QuadSPI controller should know the NOR commands to
> -find the right LUT sequence. Unfortunately, the old code can not meet
> -this requirement.
> +Specifically, Freescale's QuadSPI controller must know the NOR commands to

[...]

Best regards,
Marek Vasut
