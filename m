Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VCajz-0000Pv-AO
 for linux-mtd@lists.infradead.org; Thu, 22 Aug 2013 19:40:20 +0000
Received: by mail-pa0-f52.google.com with SMTP id kq13so2561974pab.11
 for <linux-mtd@lists.infradead.org>; Thu, 22 Aug 2013 12:39:57 -0700 (PDT)
Date: Thu, 22 Aug 2013 12:39:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Libo Chen <clbchenlibo.chen@huawei.com>
Subject: Re: [PATCH RESEND 1/2] mtd: bcm47: convert kzalloc to avoid
 invalid access
Message-ID: <20130822193949.GA14837@ld-irv-0074.broadcom.com>
References: <51A6B7D4.7040202@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51A6B7D4.7040202@huawei.com>
Cc: Bill Pemberton <wfp5p@virginia.edu>, artem.bityutskiy@linux.intel.com,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Li Zefan <lizefan@huawei.com>,
 linux-mtd@lists.infradead.org, hauke@hauke-m.de, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 30, 2013 at 10:22:12AM +0800, Libo Chen wrote:
> 
> mtd is just member of bcm47xxsflash, so we should free bcm47xxsflash not its member.
> So I use devm_kazlloc instead of kazlloc to avoid it.
> 
> * Changelog:
>    convert to devm_kzalloc
> 
> Signed-off-by: Libo chen <libo.chen@huawei.com>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Resolved a conflict and pushed to l2-mtd.git. Thanks!

Brian
