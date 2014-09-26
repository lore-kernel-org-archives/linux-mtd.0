Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXSiK-0000J7-Q4
 for linux-mtd@lists.infradead.org; Fri, 26 Sep 2014 10:25:25 +0000
Message-ID: <1411727075.23429.50.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/4] ubi-utils: ubidump compile enable
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Fri, 26 Sep 2014 13:24:35 +0300
In-Reply-To: <541D0AA1.60006@huawei.com>
References: <541D09C9.4080004@huawei.com> <541D0AA1.60006@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Bill Pringlemeir <bpringlemeir@nbsps.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2014-09-20 at 13:03 +0800, hujianyang wrote:
> Signed-off-by: hujianyang <hujianyang@huawei.com>
> ---
>  Makefile |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)

Could you please make it to be the last patch in the series. This will
make sure the tree compilation does not break when you are in the middle
of the series.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
