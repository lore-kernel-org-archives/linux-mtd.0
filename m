Received: from mail-ie0-x22c.google.com ([2607:f8b0:4001:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5Kgq-00021J-Dh
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2014 19:39:23 +0000
Received: by mail-ie0-f172.google.com with SMTP id e14so8799469iej.3
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jan 2014 11:38:59 -0800 (PST)
Date: Mon, 20 Jan 2014 11:38:55 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH -next] mtd: plat_nand: remove redundant return value
 check of platform_get_resource()
Message-ID: <20140120193855.GQ8919@ld-irv-0074>
References: <CAPgLHd-2rHs_v0=tsnG08oJqaf1YmF2peeB_6KJQRnwK6r2N+w@mail.gmail.com>
 <001501cf0c05$0ca196c0$25e4c440$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <001501cf0c05$0ca196c0$25e4c440$%han@samsung.com>
Cc: 'Wei Yongjun' <weiyj.lk@gmail.com>,
 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 yongjun_wei@trendmicro.com.cn, 'Rob Herring' <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, 'Grant Likely' <grant.likely@linaro.org>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 08, 2014 at 09:03:24AM +0900, Jingoo Han wrote:
> On Tuesday, January 07, 2014 10:38 PM, Wei Yongjun wrote:
> > 
> > From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> > 
> > Remove unneeded error handling on the result of a call
> > to platform_get_resource() when the value is passed to
> > devm_ioremap_resource(). And move those two call together
> > to make the connection between them more clear.
> > 
> > Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Pushed to l2-mtd.git. Thanks!

Brian
