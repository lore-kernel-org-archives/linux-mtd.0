Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXStT-0007bh-AC
 for linux-mtd@lists.infradead.org; Fri, 26 Sep 2014 10:36:55 +0000
Message-ID: <1411727765.23429.61.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: Align the dump messages of SB_NODE
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Fri, 26 Sep 2014 13:36:05 +0300
In-Reply-To: <541D24CF.1040705@huawei.com>
References: <541D24CF.1040705@huawei.com>
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

On Sat, 2014-09-20 at 14:55 +0800, hujianyang wrote:
> I found the dump messages of UBIFS_SB_NODE is not aligned. This
> patch remove the extra space from the line which is retracted.
> 
> 
> Signed-off-by: hujianyang <hujianyang@huawei.com>

This was not a typo, this was intentional. We first print the all flags
in a hex format, and then we "decode" it and print the values of the
individual flags with an additional indent. The indent is to make it
clear that these line belong to the flags, and they are not independent
values.

-- 
Best Regards,
Artem Bityutskiy
