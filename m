Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhD0e-0005SY-MB
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 07:08:21 +0000
Message-ID: <1399273676.15290.1.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] UBIFS: Fix assert failed in ubifs_set_page_dirty
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Laurence Withers <lwithers@guralp.com>
Date: Mon, 05 May 2014 10:07:56 +0300
In-Reply-To: <20140430121846.GI1821@guralp.com>
References: <535B7B96.9030008@huawei.com> <536092CE.2090209@huawei.com>
 <20140430121846.GI1821@guralp.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, adrian.hunter@intel.com,
 hujianyang <hujianyang@huawei.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-04-30 at 12:18 +0000, Laurence Withers wrote:
> On Wed, Apr 30, 2014 at 02:06:06PM +0800, hujianyang wrote:
> > According to this situation, my v2 fix returns from page_mkwrite
> > without performing unlock_page. We return VM_FAULT_LOCKED instead
> > of just return 0. After doing this, the race above will not happen.
> 
> Hi,
> 
> I have been testing patch v1 on our hardware. Normally, at higher data rates,
> we can hit the assert in under 8 hours. So far I have been running for 48
> hours on one system without seeing the assert message.
> 
> I will now switch to running v2 and see if I can't find a few more systems to
> run in parallel.
> 
> Many thanks, and bye for now,

So can I add:

Tested-by: Laurence Withers <lwithers@guralp.com>

?

-- 
Best Regards,
Artem Bityutskiy
