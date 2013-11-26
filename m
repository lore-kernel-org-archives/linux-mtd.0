Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlS2k-000120-JK
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 23:27:49 +0000
Received: by mail-ie0-f169.google.com with SMTP id e14so10860268iej.0
 for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2013 15:27:25 -0800 (PST)
Date: Tue, 26 Nov 2013 15:27:20 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Wei Yongjun <weiyj.lk@gmail.com>
Subject: Re: [PATCH] mtd: mpc5121_nfc: drop devm_free_irq of devm_
 allocated irq
Message-ID: <20131126232720.GM9468@ld-irv-0074.broadcom.com>
References: <CAPgLHd8G-uaG3a7DfA-eAhcdKD3yXzpCuQJ2c8qFe0412pQX2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPgLHd8G-uaG3a7DfA-eAhcdKD3yXzpCuQJ2c8qFe0412pQX2Q@mail.gmail.com>
Cc: artem.bityutskiy@linux.intel.com, gsi@denx.de, rob.herring@calxeda.com,
 yongjun_wei@trendmicro.com.cn, wfp5p@virginia.edu,
 linux-mtd@lists.infradead.org, grant.likely@linaro.org, agust@denx.de,
 shijie8@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 25, 2013 at 03:40:38PM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> The devm_request_irq function allocates irq that is released
> when a driver detaches. Thus, there is no reason to explicitly
> call devm_free_irq in probe or remove functions.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Pushed to l2-mtd.git. Thanks!

Brian
