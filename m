Subject: Re: [PATCH] [MTD] include/linux/mtd/blktrans.h: fix wrong #blocks
	value reported by /proc/partitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
In-Reply-To: <5D8008F58939784290FAB48F549751981D10D58969@shsmsx502.ccr.corp.intel.com>
References: <5D8008F58939784290FAB48F549751981D10D58969@shsmsx502.ccr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Jul 2010 07:40:48 +0300
Message-ID: <1280119248.14917.8.camel@localhost>
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

On Thu, 2010-07-22 at 17:34 +0800, Dong, Chuanxiao wrote:
> Hi
> I found /proc/partitions file will report a wrong block numbers when I use a 8G
> NAND which has a larger than 4G partition. So here is a patch to fix this problem.
> Details are in below comments.
> Please review it.
> Thanks all.

Pushed to l2-mtd-2.6.git / master, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
