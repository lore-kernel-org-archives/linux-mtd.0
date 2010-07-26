Subject: Re: [PATCH] [MTD] include/linux/mtd/blktrans.h: fix wrong #blocks
	value reported by /proc/partitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
In-Reply-To: <1280119248.14917.8.camel@localhost>
References: <5D8008F58939784290FAB48F549751981D10D58969@shsmsx502.ccr.corp.intel.com>
	<1280119248.14917.8.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Jul 2010 07:45:34 +0300
Message-ID: <1280119534.14917.9.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Yuan,
	Hang" <hang.yuan@intel.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>, "Woodhouse,
	David" <david.woodhouse@intel.com>, "Gao, Yunpeng" <yunpeng.gao@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-07-26 at 07:40 +0300, Artem Bityutskiy wrote:
> On Thu, 2010-07-22 at 17:34 +0800, Dong, Chuanxiao wrote:
> > Hi
> > I found /proc/partitions file will report a wrong block numbers when I use a 8G
> > NAND which has a larger than 4G partition. So here is a patch to fix this problem.
> > Details are in below comments.
> > Please review it.
> > Thanks all.
> 
> Pushed to l2-mtd-2.6.git / master, thanks.

Umm, no, kicked out. It introduces warnings:

drivers/mtd/inftlcore.c: In function ‘inftl_add_mtd’:
drivers/mtd/inftlcore.c:112: warning: format ‘%lx’ expects type ‘long unsigned int’, but argument 2 has type ‘uint64_t’
  CC [M]  drivers/mtd/nftlcore.o
  CC [M]  drivers/mtd/nftlmount.o
drivers/mtd/nftlcore.c: In function ‘nftl_add_mtd’:
drivers/mtd/nftlcore.c:101: warning: format ‘%lx’ expects type ‘long unsigned int’, but argument 2 has type ‘uint64_t’

Please, use 'unsigned long long' and %llx modifiers in the prints.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
