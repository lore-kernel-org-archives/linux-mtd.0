Received: from mail-pb0-x22d.google.com ([2607:f8b0:400e:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VD67m-0004Ks-5j
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2013 05:10:59 +0000
Received: by mail-pb0-f45.google.com with SMTP id mc17so1440140pbc.32
 for <linux-mtd@lists.infradead.org>; Fri, 23 Aug 2013 22:10:36 -0700 (PDT)
Date: Fri, 23 Aug 2013 22:10:32 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Wei Yongjun <weiyj.lk@gmail.com>
Subject: Re: [PATCH -next] mtd: ofpart: use for_each_child_of_node() macro
Message-ID: <20130824051032.GD19575@brian-ubuntu>
References: <CAPgLHd_zSXzRWGgQUzsmsM4beiTFKoWtcic6QmJdxhfBvNEZYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPgLHd_zSXzRWGgQUzsmsM4beiTFKoWtcic6QmJdxhfBvNEZYg@mail.gmail.com>
Cc: devicetree@vger.kernel.org, rob.herring@calxeda.com,
 Huang Shijie <b32955@freescale.com>, yongjun_wei@trendmicro.com.cn,
 linux-mtd@lists.infradead.org, grant.likely@linaro.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 23, 2013 at 11:04:27AM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Use for_each_child_of_node() macro instead of open coding it.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Pushed to l2-mtd.git. Thanks!

Brian
