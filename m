Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNUeP-0003P6-Bb
 for linux-mtd@lists.infradead.org; Thu, 14 Jul 2016 00:37:13 +0000
Received: by mail-pf0-x229.google.com with SMTP id c2so23886790pfa.2
 for <linux-mtd@lists.infradead.org>; Wed, 13 Jul 2016 17:36:53 -0700 (PDT)
Date: Wed, 13 Jul 2016 17:36:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Marek Vasut <marex@denx.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] mtd: spi-nor: support dual, quad, and WP for Gigadevice
Message-ID: <20160714003650.GD54628@google.com>
References: <1467411916-110528-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1467411916-110528-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 01, 2016 at 03:25:16PM -0700, Brian Norris wrote:
> Gigadevice flash support BP{0,1,2,3,4} bits, where BP3 means the same as
> the existing supported TB (Top/Bottom), and BP4 means the same as the
> not-yet-supported 4K bit used on other flash (e.g., Winbond). Let's
> support lock/unlock with the same feature flags as w25q32dw/w25q64dw.
> 
> Tested on gd25lq64c, but I checked datasheets for the other 3, to make
> sure.
> 
> While I was at it, I noticed that these all support dual and quad as
> well. I noted them, but can't test them at the moment, since my test
> system only supports standard 1x SPI.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Applied to l2-mtd.git
