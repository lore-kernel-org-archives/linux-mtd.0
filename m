Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvM7T-0003yI-3A
 for linux-mtd@lists.infradead.org; Mon, 01 Dec 2014 08:14:07 +0000
Received: by mail-pd0-f180.google.com with SMTP id p10so10457407pdj.39
 for <linux-mtd@lists.infradead.org>; Mon, 01 Dec 2014 00:13:45 -0800 (PST)
Date: Mon, 1 Dec 2014 00:13:42 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie.huang@intel.com>
Subject: Re: [PATCH] mtd: spi-nor: remove the jedec_id/ext_id
Message-ID: <20141201081342.GE29070@brian-ubuntu>
References: <20141105111631.GJ22361@norris-Latitude-E6410>
 <1415244273-8230-1-git-send-email-shijie.huang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1415244273-8230-1-git-send-email-shijie.huang@intel.com>
Cc: marex@denx.de, linux-mtd@lists.infradead.org, zajec5@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 06, 2014 at 11:24:33AM +0800, Huang Shijie wrote:
> The "id" array contains all the information about the JEDEC and the
> manufacturer ID info, this patch remove the jedec_id/ext_id from the
> flash_info.
> 
> Signed-off-by: Huang Shijie <shijie.huang@intel.com>
> ---
>   rebase this patch on the latest l2-mtd

Applied to l2-mtd.git. Thanks!

Brian
