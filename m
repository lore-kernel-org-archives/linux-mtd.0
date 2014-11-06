Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmGoM-0001rQ-3S
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 06:44:51 +0000
Date: Thu, 6 Nov 2014 14:44:16 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2 1/3] mtd: spi-nor: add id/id_len for flash_info{}
Message-ID: <20141106064416.GA5826@shldeISGChi005.sh.intel.com>
References: <1407804896-1808-1-git-send-email-shijie.huang@intel.com>
 <1415255641-2289-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1415255641-2289-1-git-send-email-zajec5@gmail.com>
Cc: Marek =?utf-8?B?VmHFoXV0?= <marex@denx.de>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
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
thanks a lot.

I was just about to send out the new patch, then i saw this patch. :)

thanks
Huang Shijie
