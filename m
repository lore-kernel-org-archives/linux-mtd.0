Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSYQL-0002rj-Jf
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 22:35:06 +0000
Received: by pacdd16 with SMTP id dd16so29007681pac.2
 for <linux-mtd@lists.infradead.org>; Thu, 20 Aug 2015 15:34:44 -0700 (PDT)
Date: Thu, 20 Aug 2015 15:34:40 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 03/18] mtd: dataflash: Export OF module alias information
Message-ID: <20150820223440.GC81844@google.com>
References: <1440054451-1223-1-git-send-email-javier@osg.samsung.com>
 <1440054451-1223-4-git-send-email-javier@osg.samsung.com>
 <20150820215404.GA81844@google.com>
 <55D6510E.7010002@osg.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55D6510E.7010002@osg.samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 21, 2015 at 12:13:34AM +0200, Javier Martinez Canillas wrote:
> So this patch really is a no-op right now and is not fixing anything.
> As long as the driver has a MODULE_DEVICE_TABLE(spi,...), things will

This driver does not have a MODULE_DEVICE_TABLE() at all, nor does it
use spi_device_id. So, it is currently broken for the module use case.

> work without a MODULE_DEVICE_TABLE(of,...).

Brian
