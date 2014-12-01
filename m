Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvM5b-0003ag-HN
 for linux-mtd@lists.infradead.org; Mon, 01 Dec 2014 08:12:11 +0000
Received: by mail-pa0-f44.google.com with SMTP id et14so10598910pad.31
 for <linux-mtd@lists.infradead.org>; Mon, 01 Dec 2014 00:11:47 -0800 (PST)
Date: Mon, 1 Dec 2014 00:11:43 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2 1/3] mtd: spi-nor: add id/id_len for flash_info{}
Message-ID: <20141201081143.GD29070@brian-ubuntu>
References: <1407804896-1808-1-git-send-email-shijie.huang@intel.com>
 <1415255641-2289-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1415255641-2289-1-git-send-email-zajec5@gmail.com>
Cc: Marek =?utf-8?B?VmHFoXV0?= <marex@denx.de>,
 Huang Shijie <shijie.huang@intel.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 06, 2014 at 07:34:01AM +0100, Rafał Miłecki wrote:
> From: Huang Shijie <shijie.huang@intel.com>
> 
> This patch adds the id/id_len fields for flash_info{}, and rewrite the
> INFO to fill them. And at last, we read out 6 bytes in the spi_nor_read_id(),
> and we use these new fields to parse out the correct flash_info.
> 
> Signed-off-by: Huang Shijie <shijie.huang@intel.com>
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
> V2: s/strncmp/memcmp/ as we don't compare strings at all

Applied to l2-mtd.git. Thanks!

Brian
