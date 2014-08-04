Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEPlE-0000CB-Qb
 for linux-mtd@lists.infradead.org; Mon, 04 Aug 2014 21:25:45 +0000
Received: by mail-pd0-f176.google.com with SMTP id y10so36342pdj.7
 for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2014 14:25:19 -0700 (PDT)
Date: Mon, 4 Aug 2014 14:25:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH] mtd: spi-nor: add support for Micron M25PX80
Message-ID: <20140804212516.GB3711@ld-irv-0074>
References: <1406498168-13379-1-git-send-email-thomas.petazzoni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1406498168-13379-1-git-send-email-thomas.petazzoni@free-electrons.com>
Cc: Gregory Clement <gregory.clement@free-electrons.com>,
 Huang Shijie <b32955@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jul 27, 2014 at 11:56:08PM +0200, Thomas Petazzoni wrote:
> This commit adds the support in the spi-nor driver of the Micron
> M25PX80 flash, a 8 Mbit SPI flash from Micron.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Queued to l2-mtd.git/next. Thanks!

Brian
