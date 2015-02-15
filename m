Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YMvBC-0007Xm-FA
 for linux-mtd@lists.infradead.org; Sun, 15 Feb 2015 09:07:55 +0000
Received: by mail-pa0-f45.google.com with SMTP id rd3so21680443pab.4
 for <linux-mtd@lists.infradead.org>; Sun, 15 Feb 2015 01:07:32 -0800 (PST)
Date: Sun, 15 Feb 2015 01:07:11 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] mtd: hisilicon: && vs & typo
Message-ID: <20150215090711.GA8351@norris-Latitude-E6410>
References: <20150211102509.GB18515@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150211102509.GB18515@mwanda>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 Zhou Wang <wangzhou1@hisilicon.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 11, 2015 at 01:25:09PM +0300, Dan Carpenter wrote:
> The intent was to mask away some bits here, not to test true or false.
> 
> Fix: 54f531f6e332 ('mtd: hisilicon: add a new NAND controller driver for hisilicon hip04 Soc')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to l2-mtd.git. Thanks.

Brian
