Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhCdB-0004pc-2I
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 06:44:05 +0000
Message-ID: <1399272221.17496.113.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: Remove unused variables in ubifs_budget_space
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Date: Mon, 05 May 2014 09:43:41 +0300
In-Reply-To: <535F040C.8010903@huawei.com>
References: <535F040C.8010903@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-04-29 at 09:44 +0800, hujianyang wrote:
> I found two variables in ubifs_budget_space declared but not
> use. This state remains since the first commit 1e5176. So just
> remove them.
> 
> Signed-off-by: hujianyang <hujianyang@huawei.com>

Applied to linux-ubifs.git tree, thanks!

-- 
Best Regards,
Artem Bityutskiy
