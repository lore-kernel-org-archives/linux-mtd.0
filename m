Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuG0S-0004XE-T9
 for linux-mtd@lists.infradead.org; Tue, 10 Jun 2014 06:58:05 +0000
Message-ID: <1402383462.20454.58.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: Fix code issues detected by Fortify
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Tue, 10 Jun 2014 09:57:42 +0300
In-Reply-To: <53911CE9.8020401@huawei.com>
References: <53911CE9.8020401@huawei.com>
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

On Fri, 2014-06-06 at 09:44 +0800, hujianyang wrote:
> Hi Artem,
> 
> With the help of Fortify, I found some problems in source
> code. I would like to fix them in this patch.
> 
> Please help me review them!
> 
> There is no need to add a return value checking in journal.c,
> just in order to avoid a "value never read" warning. Remove
> statements in other files for the same reason.

Would you please just split this patch on smaller ones and submit the
series, I'll pick it up.

-- 
Best Regards,
Artem Bityutskiy
