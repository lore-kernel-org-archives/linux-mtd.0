Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgAWx-0001Hh-SF
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 10:49:40 +0000
Message-ID: <1413802155.7906.220.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd-utils:  Add macros to include/common.h
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Mon, 20 Oct 2014 13:49:15 +0300
In-Reply-To: <543FB3C1.9050800@huawei.com>
References: <543FB3C1.9050800@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-10-16 at 20:02 +0800, hujianyang wrote:
> This patch adds four macros:
> 
>     ALIGN, __ALIGN_MASK, min_t and max_t
> 
> to include/common.h.
> 
> Signed-off-by: hujianyang <hujianyang@huawei.com>

Hi, pushed this one to mtd-utils.git, thanks!
