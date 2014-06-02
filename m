Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrNdu-0004T2-MD
 for linux-mtd@lists.infradead.org; Mon, 02 Jun 2014 08:30:54 +0000
Message-ID: <1401697830.11182.120.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: Remove incorrect assertion in shrink_tnc()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Date: Mon, 02 Jun 2014 11:30:30 +0300
In-Reply-To: <538988F7.8090805@huawei.com>
References: <53894EF4.5030607@huawei.com> <538988F7.8090805@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Dolev Raviv <draviv@codeaurora.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2014-05-31 at 15:47 +0800, hujianyang wrote:
> Hi Artem,
> 
> In previous mail, I introduce a condition I found that may hit assert
> failed in shrink_tnc(). So I think this assertion is useless. But I
> don't know if there are any leaks in @c->clean_zn_cnt. Although I've
> done some tests and found everything is OK, I'm still not sure of that.

Yes, this sounds like a great idea. Could you please send a proper patch
containing this change (S-o-b, etc). Many thanks!

-- 
Best Regards,
Artem Bityutskiy
