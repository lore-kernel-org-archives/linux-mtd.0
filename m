Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7Ncy-0000un-Ej
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 11:44:04 +0000
Message-ID: <1405511021.5423.12.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 6/7] New utility ubidump
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Wed, 16 Jul 2014 14:43:41 +0300
In-Reply-To: <53C6618F.3010707@huawei.com>
References: <53BA491E.8060502@huawei.com> <53BA4B98.1080000@huawei.com>
 <1405497907.1920.27.camel@sauron.fi.intel.com>
 <53C63DA2.5080200@huawei.com>
 <1405507040.1906.18.camel@sauron.fi.intel.com>
 <53C6618F.3010707@huawei.com>
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

On Wed, 2014-07-16 at 19:27 +0800, hujianyang wrote:
> If you get some new ideas, please tell me as soon
> as possible.

The problem is that I do not know if I have more ideas. You may spend a
lot of time on this stuff and then I send one of my ideas may render
your work useless.

This is why I suggest to start small, do just the UBIFS nodes dump,
nothing else. Just forget about UBI. Then let's review that and make
part of mtd-utils. This will clarify the vision, and we may add UBI
support then separately.


-- 
Best Regards,
Artem Bityutskiy
