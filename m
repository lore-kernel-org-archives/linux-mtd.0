Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAOrA-0007wm-Mb
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 13:12:01 +0000
Message-ID: <428914065.25267@cqu.edu.cn>
Subject: Re: [PATCH 4/4] UBI WL-Subsys: Improvement in prot tree
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: dedekind@infradead.org
In-Reply-To: <1228898668.13686.223.camel@sauron>
References: <1228823163.2753.18.camel@localhost.localdomain>
	<1228827803.13686.189.camel@sauron>
	<1228884752.3225.80.camel@localhost.localdomain>
	<1228898668.13686.223.camel@sauron>
Content-Type: text/plain
Date: Wed, 10 Dec 2008 21:11:05 +0800
Message-Id: <1228914665.3655.31.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2008-12-10 at 10:44 +0200, Artem Bityutskiy wrote:
> 
> I think it does not matter much and we may use the same constant for
> short term and unknown eraseblocks. I do not see much difference
> between
> 8 or 16. Does it really matter? We just want to prevent this
> eraseblock
> from being moved for some reasonable "time". And everything depends on
> work-load of course. So I think just using the same constant for all
> PEB

My opposite experiment indicates that such unified-protection-time
method seems to be not better than the different-protection-time one in
run time. the system run time fluctuates. 

One major reason, I think, is short term (youngest) PEBs got together in
the protection "queue", when they wear out the protection time and be
flushed to used RB-tree, quantities of wear-leveling worker may trigger
one time. 

> types is reasonable. This will be simpler.
> 
> But of course, the best way is to test things.
-- 
Yours sincerely
xiaochuan-xu(cqu.edu.cn)
