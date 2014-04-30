Received: from chrysocolla.lwithers.me.uk ([2001:41c8:1:5763::2])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfTUC-0004g8-BP
 for linux-mtd@lists.infradead.org; Wed, 30 Apr 2014 12:19:41 +0000
Date: Wed, 30 Apr 2014 12:18:46 +0000
From: Laurence Withers <lwithers@guralp.com>
To: hujianyang <hujianyang@huawei.com>
Message-ID: <20140430121846.GI1821@guralp.com>
References: <535B7B96.9030008@huawei.com>
 <536092CE.2090209@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <536092CE.2090209@huawei.com>
Subject: Re: [PATCH v2] UBIFS: Fix assert failed in ubifs_set_page_dirty
Cc: linux-mtd <linux-mtd@lists.infradead.org>, adrian.hunter@intel.com,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 30, 2014 at 02:06:06PM +0800, hujianyang wrote:
> According to this situation, my v2 fix returns from page_mkwrite
> without performing unlock_page. We return VM_FAULT_LOCKED instead
> of just return 0. After doing this, the race above will not happen.

Hi,

I have been testing patch v1 on our hardware. Normally, at higher data rates,
we can hit the assert in under 8 hours. So far I have been running for 48
hours on one system without seeing the assert message.

I will now switch to running v2 and see if I can't find a few more systems to
run in parallel.

Many thanks, and bye for now,
-- 
Laurence Withers, <lwithers@guralp.com>                http://www.guralp.com/
