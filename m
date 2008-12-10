Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAFBg-0000H2-JQ
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 02:52:33 +0000
Message-ID: <428876902.01850@cqu.edu.cn>
Subject: Re: [PATCH 2/4] UBI WL-Subsys: Improvement in prot tree
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: dedekind@infradead.org
In-Reply-To: <1228827480.13686.182.camel@sauron>
References: <1228823094.2753.14.camel@localhost.localdomain>
	<1228827480.13686.182.camel@sauron>
Content-Type: text/plain
Date: Wed, 10 Dec 2008 10:51:04 +0800
Message-Id: <1228877464.3225.14.camel@localhost.localdomain>
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


On Tue, 2008-12-09 at 14:58 +0200, Artem Bityutskiy wrote:
> On Tue, 2008-12-09 at 19:44 +0800, xiaochuan-xu wrote:
> > +/*
> > + * It's impossible that the first field of rb_node structure is equal to 0x2
> > + * and 0x3, so Ox2 is used to check whether the physical eraseblock is in one
> > + * of prot lists or not. 0x3 is used for prot list head's mark.
> > + */
> > +#define PROT_LIST_NODE 0x2
> > +#define PROT_LIST_HEAD 0x3
> 
> This is hacky a bit. 

Thanks for your reminding. I'll get rid of them.

> AFAIK, rb-tree code does have optimizations which
> use the lowest bits of pointers, so I am not sure 2 and 3 are completely
> impossible. 
> 
BTW, if I understand the RB-tree well, the 2nd bit of @rb_parent (the
1st field of struct rb_node) is impossible to be "1". Correct me, if I'm
wrong. Thanks!

> But I think this is anyway not needed at all. The only reason you need
> this is to quickly find out if the entry is in the protection list or
> not, right? And from the code I see the only user of this is the
> 'paranoid_check_in_prot_lists()' function. But this is just a debugging
> function, which is normally compiled out. You do not have to optimize it
> at all. Just let it walk the list and check.
> 
> So, please, let's get rid of these constants.

OK!

> 
-- 
Yours sincerely
xiaochuan-xu(cqu.edu.cn)
