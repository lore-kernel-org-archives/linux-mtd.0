Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHF6d-0005XF-4R
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2015 17:43:59 +0000
Received: by pdjr16 with SMTP id r16so106824783pdj.3
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2015 10:43:34 -0700 (PDT)
Date: Mon, 20 Jul 2015 10:43:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Alexey Firago <alexey_firago@mentor.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: set SECT_4K for n25q064 SPI flash
Message-ID: <20150720174331.GE24125@google.com>
References: <1435658026-10627-1-git-send-email-alexey_firago@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1435658026-10627-1-git-send-email-alexey_firago@mentor.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 30, 2015 at 12:53:46PM +0300, Alexey Firago wrote:
> Micron n25q064 flash supports 4 KiB erase sectors.
> 
> Signed-off-by: Alexey Firago <alexey_firago@mentor.com>

Pushed to l2-mtd.git. Thanks!

Brian
