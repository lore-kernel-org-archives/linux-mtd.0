Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7OZ8-0006S4-SO
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 12:44:11 +0000
Message-ID: <1405514626.5423.24.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: Fix empty_log_bytes()  computing error
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Wed, 16 Jul 2014 15:43:46 +0300
In-Reply-To: <1405514327.5423.23.camel@sauron.fi.intel.com>
References: <53BF4851.4040105@huawei.com>
 <1405508618.1906.26.camel@sauron.fi.intel.com>
 <53C6658F.3020605@huawei.com>
 <1405514327.5423.23.camel@sauron.fi.intel.com>
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

On Wed, 2014-07-16 at 15:38 +0300, Artem Bityutskiy wrote:
> I guess you will continue testing, right? Please, use these patches and
> let me know if they are wrong, if they help or not, etc. I'll send the 2
> patches shortly.

By the way, you may try making the log smaller or larger, instead of
using the default size - may be it'll help making the issue easier to
reproduce?

-- 
Best Regards,
Artem Bityutskiy
