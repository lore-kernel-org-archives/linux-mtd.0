Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEPmG-0000Vu-C8
 for linux-mtd@lists.infradead.org; Mon, 04 Aug 2014 21:26:50 +0000
Received: by mail-pa0-f46.google.com with SMTP id lj1so36098pab.19
 for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2014 14:26:23 -0700 (PDT)
Date: Mon, 4 Aug 2014 14:26:20 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: weiyj_lk@163.com
Subject: Re: [PATCH -next] mtd: atmel_nand: remove redundant dev_err call
Message-ID: <20140804212620.GD3711@ld-irv-0074>
References: <1406553595-29939-1-git-send-email-weiyj_lk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1406553595-29939-1-git-send-email-weiyj_lk@163.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jingoo Han <jg1.han@samsung.com>, Josh Wu <Josh.wu@atmel.com>,
 Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Grant Likely <grant.likely@linaro.org>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 28, 2014 at 09:19:55PM +0800, weiyj_lk@163.com wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Queued to l2-mtd.git/next. Thanks!

Brian
