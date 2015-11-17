Received: from lists.s-osg.org ([54.187.51.154])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZygjK-0000OX-Mr
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 13:55:31 +0000
Subject: Re: [PATCH 1/3] mtd: m25p80: fix module autoloading for
 "jedec,spi-nor" and "spi-nor"
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
References: <1447713292-91525-1-git-send-email-computersforpeace@gmail.com>
 <1447713292-91525-2-git-send-email-computersforpeace@gmail.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <564B31B8.70104@osg.samsung.com>
Date: Tue, 17 Nov 2015 10:55:04 -0300
MIME-Version: 1.0
In-Reply-To: <1447713292-91525-2-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Brian,

On 11/16/2015 07:34 PM, Brian Norris wrote:
> Commit 43163022927b ("mtd: m25p80: allow arbitrary OF matching for
> "jedec,spi-nor"") moved the "jedec,spi-nor" handling from the
> spi_device_id table to the of_match_table, to better handle matching
> complex device tree compatible strings. With that patch, device tree
> support works as expected when m25p80.c is built into the kernel.
>
> However, that commit ignored the fact that:
> 
>  (1) (non-DT) platform devices might want to use the "spi-nor" string
>      for matching with this driver, rather than picking an arbitrary one
>      like "m25p80"
>  (2) the core SPI uevent/modalias code doesn't yet support kernel module
>      autoloading via of_match_table strings; so for DT-based devices, it
>      will only report (part of) the first compatible string used
>

Very nice changelog message!

Patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
 
Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
