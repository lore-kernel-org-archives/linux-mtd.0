Message-ID: <1544161439.8955.3.camel@mhfsdcap03>
Subject: Re: [RESEND PATCH 2/4] mtd: spi-nor: mtk-quadspi: use ofpart for
 parsing partitions
From: Guochun Mao <guochun.mao@mediatek.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Weijie Gao <weijie.gao@mediatek.com>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Fri, 7 Dec 2018 13:43:59 +0800
In-Reply-To: <20181206153610.26db522c@bbrezillon>
References: <235ade9c5cda19fb0c9356913e3f56ad86600f59.1543472168.git.ryder.lee@mediatek.com>
 <6cca6844f426d4ad4e7c878420b363cfb34499aa.1543472168.git.ryder.lee@mediatek.com>
 <20181206153610.26db522c@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2018-12-06 at 15:36 +0100, Boris Brezillon wrote:
> On Thu, 29 Nov 2018 14:29:54 +0800
> Ryder Lee <ryder.lee@mediatek.com> wrote:
> 
> > From: Guochun Mao <guochun.mao@mediatek.com>
> > 
> > Replace mtd_device_register with mtd_device_parse_register for
> > parsing partitions and add ofpart support.
> 
> What's the problem with the default partition parser table [1]?
> 
> [1]https://elixir.bootlin.com/linux/latest/source/drivers/mtd/mtdpart.c#L793

No problem here.
This patch can be dropped.
Please help review others.

Thanks.
