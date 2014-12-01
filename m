Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvMAX-0005XA-3g
 for linux-mtd@lists.infradead.org; Mon, 01 Dec 2014 08:17:17 +0000
Received: by mail-pa0-f53.google.com with SMTP id kq14so10618218pab.12
 for <linux-mtd@lists.infradead.org>; Mon, 01 Dec 2014 00:16:55 -0800 (PST)
Date: Mon, 1 Dec 2014 00:16:52 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie.huang@intel.com>
Subject: Re: [PATCH 3/3] mtd: spi-nor: add support for s25fl128s
Message-ID: <20141201081652.GF29070@brian-ubuntu>
References: <1407804896-1808-1-git-send-email-shijie.huang@intel.com>
 <1407804896-1808-3-git-send-email-shijie.huang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1407804896-1808-3-git-send-email-shijie.huang@intel.com>
Cc: marex@denx.de, linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 12, 2014 at 08:54:56AM +0800, Huang Shijie wrote:
> We need to store the six bytes ID for s25fl128s, since it shares the same
> five bytes with s25fl129p1.
> 
> This patch adds a macro INFO6 which is used for the six bytes ID flash, and adds
> a new item for the s25fl128s.
> 
> Signed-off-by: Huang Shijie <shijie.huang@intel.com>

Applied to l2-mtd.git. Thanks.

Brian
