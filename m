Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ad7EK-0003gH-43
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2016 02:18:36 +0000
Received: by mail-pa0-x242.google.com with SMTP id 1so177580pal.3
 for <linux-mtd@lists.infradead.org>; Mon, 07 Mar 2016 18:18:14 -0800 (PST)
Date: Mon, 7 Mar 2016 18:18:11 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, djkurtz@chromium.org
Subject: Re: [PATCH v2 0/8] mtd: spi-nor: locking fixes and updates
Message-ID: <20160308021811.GG55664@google.com>
References: <1454095537-130536-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454095537-130536-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 29, 2016 at 11:25:29AM -0800, Brian Norris wrote:
> Hi,
> 
> These are an assortment of fixes and updates to the SPI NOR lock/unlock
> feature. The biggest new features are:
> (a) Status Register protection; I don't see why this shouldn't be enabled by
>     default. See patch 4's description.
> (b) Bottom-block protection support (via TB status bit)
> (c) Lock/unlock support for a few Winbond flash
> 
> Since v1:
>  * patches 3 and 7 are somewhat rewritten versions of patches 2 and 7 in v1
>  * fix up several corner cases, seen in some local tests (poor, slow shell
>    script appended)
>  * remove SR protection (SR_SRWD) when unlocking the entire flash
> 
> Regards,
> Brian

Pushed all to l2-mtd.git
