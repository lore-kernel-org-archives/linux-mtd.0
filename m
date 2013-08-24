Received: from mail-pd0-f169.google.com ([209.85.192.169])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VD5iN-00048M-V5
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2013 04:44:46 +0000
Received: by mail-pd0-f169.google.com with SMTP id r10so1428989pdi.14
 for <linux-mtd@lists.infradead.org>; Fri, 23 Aug 2013 21:44:19 -0700 (PDT)
Date: Fri, 23 Aug 2013 21:44:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Wei Yongjun <weiyj.lk@gmail.com>
Subject: Re: [PATCH -next] mtd: atmel_nand: fix error return code in
 atmel_nand_probe()
Message-ID: <20130824044410.GA19575@brian-ubuntu>
References: <CAPgLHd8an7_iEV1eTNGFmQ8B4CM=FGu0jrov_A=L9JRJ8AFKPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPgLHd8an7_iEV1eTNGFmQ8B4CM=FGu0jrov_A=L9JRJ8AFKPA@mail.gmail.com>
Cc: devicetree@vger.kernel.org, artem.bityutskiy@linux.intel.com,
 jg1.han@samsung.com, rob.herring@calxeda.com, josh.wu@atmel.com,
 yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org,
 grant.likely@linaro.org, plagnioj@jcrosoft.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 23, 2013 at 10:50:36AM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Pushed to l2-mtd.git. Thanks!

Brian
