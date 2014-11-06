Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmDw0-0001BV-U5
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 03:40:33 +0000
Date: Thu, 6 Nov 2014 11:39:26 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: factor out write_enable() for erase
 commands
Message-ID: <20141106033926.GA26359@shldeISGChi005.sh.intel.com>
References: <1407374222-8448-8-git-send-email-computersforpeace@gmail.com>
 <1415183343-11891-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1415183343-11891-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <shijie8@gmail.com>,
 linux-mtd@lists.infradead.org
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
thanks

Acked-by: Huang Shijie <shijie.huang@intel.com>
