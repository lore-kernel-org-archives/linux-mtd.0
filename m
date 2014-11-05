Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xlya8-00083H-LY
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 11:16:57 +0000
Received: by mail-pa0-f42.google.com with SMTP id bj1so610287pad.1
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 03:16:35 -0800 (PST)
Date: Wed, 5 Nov 2014 03:16:31 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie.huang@intel.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: remove the jedec_id/ext_id
Message-ID: <20141105111631.GJ22361@norris-Latitude-E6410>
References: <1407804896-1808-1-git-send-email-shijie.huang@intel.com>
 <1407804896-1808-2-git-send-email-shijie.huang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1407804896-1808-2-git-send-email-shijie.huang@intel.com>
Cc: marex@denx.de, linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 12, 2014 at 08:54:55AM +0800, Huang Shijie wrote:
> The "id" array contains all the information about the JEDEC and the
> manufacturer ID info, this patch remove the jedec_id/ext_id from the
> flash_info.
> 
> Signed-off-by: Huang Shijie <shijie.huang@intel.com>

This patch does not apply any more. Can you rebase?

Brian
