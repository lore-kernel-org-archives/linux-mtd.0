Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvMCy-0005z3-Eb
 for linux-mtd@lists.infradead.org; Mon, 01 Dec 2014 08:19:48 +0000
Received: by mail-pa0-f53.google.com with SMTP id kq14so10651526pab.40
 for <linux-mtd@lists.infradead.org>; Mon, 01 Dec 2014 00:19:27 -0800 (PST)
Date: Mon, 1 Dec 2014 00:19:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: spi-nor: factor out write_enable() for erase
 commands
Message-ID: <20141201081924.GG29070@brian-ubuntu>
References: <1407374222-8448-8-git-send-email-computersforpeace@gmail.com>
 <1415183343-11891-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1415183343-11891-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 05, 2014 at 02:29:03AM -0800, Brian Norris wrote:
> write_enable() was being duplicated to both m25p80.c and fsl-quadspi.c.
> But this should be handled within the spi-nor abstraction layer.
> 
> At the same time, let's add write_disable() after erasing, so we don't
> leave the flash in a write-enabled state afterward.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Applied to l2-mtd.git
