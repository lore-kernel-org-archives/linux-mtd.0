Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccGl2-0001PL-Ox
 for linux-mtd@lists.infradead.org; Fri, 10 Feb 2017 19:21:27 +0000
Received: by mail-pf0-x244.google.com with SMTP id 68so1115893pfx.2
 for <linux-mtd@lists.infradead.org>; Fri, 10 Feb 2017 11:21:03 -0800 (PST)
Date: Fri, 10 Feb 2017 11:20:59 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Wei Yongjun <weiyj.lk@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Wei Yongjun <weiyongjun1@huawei.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] mtd: aspeed: remove redundant dev_err call in
 aspeed_smc_probe()
Message-ID: <20170210192059.GC125303@google.com>
References: <20170208162310.6048-1-weiyj.lk@gmail.com>
 <6c10cdf0-5b91-000c-a8c3-78f41d47bac3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c10cdf0-5b91-000c-a8c3-78f41d47bac3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 09, 2017 at 09:50:23AM +0100, Marek Vasut wrote:
> On 02/08/2017 05:23 PM, Wei Yongjun wrote:
> > From: Wei Yongjun <weiyongjun1@huawei.com>
> > 
> > There is a error message within devm_ioremap_resource
> > already, so remove the dev_err call to avoid redundant
> > error message.
> > 
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

The driver is new for 4.11, so I'll just take this now, directly.
Applied to l2-mtd.git.
