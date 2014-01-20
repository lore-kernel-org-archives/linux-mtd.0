Date: Mon, 20 Jan 2014 11:39:21 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH -next] mtd: nuc900_nand: remove redundant return value
 check of platform_get_resource()
Message-ID: <20140120193921.GR8919@ld-irv-0074>
References: <CAPgLHd_RMOPLP2f4nA1vqNNddocMUX7f-gE29TTkuJZPUm=SWw@mail.gmail.com>
 <001401cf0c04$691d63d0$3b582b70$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <001401cf0c04$691d63d0$3b582b70$%han@samsung.com>
Cc: 'Wei Yongjun' <weiyj.lk@gmail.com>, 'Wan ZongShun' <mcuos.com@gmail.com>,
 linux-kernel@vger.kernel.org, yongjun_wei@trendmicro.com.cn,
 linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 08, 2014 at 08:58:49AM +0900, Jingoo Han wrote:
> On Tuesday, January 07, 2014 10:39 PM, Wei Yongjun wrote:
> > 
> > From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> > 
> > Remove unneeded error handling on the result of a call
> > to platform_get_resource() when the value is passed to
> > devm_ioremap_resource().
> > 
> > Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Pushed to l2-mtd.git. Thanks!

Brian
