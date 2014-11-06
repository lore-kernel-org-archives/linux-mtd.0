Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmBBV-0008S5-9B
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 00:44:21 +0000
Date: Thu, 6 Nov 2014 08:44:31 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: remove the jedec_id/ext_id
Message-ID: <20141106004430.GA18885@shldeISGChi005.sh.intel.com>
References: <1407804896-1808-1-git-send-email-shijie.huang@intel.com>
 <1407804896-1808-2-git-send-email-shijie.huang@intel.com>
 <20141105111631.GJ22361@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141105111631.GJ22361@norris-Latitude-E6410>
Cc: marex@denx.de, linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 05, 2014 at 03:16:31AM -0800, Brian Norris wrote:
> On Tue, Aug 12, 2014 at 08:54:55AM +0800, Huang Shijie wrote:
> > The "id" array contains all the information about the JEDEC and the
> > manufacturer ID info, this patch remove the jedec_id/ext_id from the
> > flash_info.
> > 
> > Signed-off-by: Huang Shijie <shijie.huang@intel.com>
> 
> This patch does not apply any more. Can you rebase?
ok, no preblem.

thanks
Huang Shijie
