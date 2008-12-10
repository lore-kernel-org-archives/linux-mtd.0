Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAH5F-0000AV-KX
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 04:54:02 +0000
Message-ID: <428884192.13309@cqu.edu.cn>
Subject: Re: [PATCH 4/4] UBI WL-Subsys: Improvement in prot tree
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: dedekind@infradead.org
In-Reply-To: <1228827803.13686.189.camel@sauron>
References: <1228823163.2753.18.camel@localhost.localdomain>
	<1228827803.13686.189.camel@sauron>
Content-Type: text/plain
Date: Wed, 10 Dec 2008 12:52:32 +0800
Message-Id: <1228884752.3225.80.camel@localhost.localdomain>
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


> > +#define ST_PROTECTION 17
> > +#define U_PROTECTION  11
> > +#define LT_PROTECTION 5
> 
> I doubt these constants make much sense. I would suggest you to get rid
> of them and simplify things. Let's have only one constant instead of 3.


> This will allow us to implement efficient protection queue
>  which you will not need to walk at all.
Sorry, I don't quite follow this meaning.
You mean one protection list (not lists) could filfull the function?

> So I'd suggest you to send a separate "preparation" patch which
> introduces one constant instead of 3. E.g.,
> 
> #define PROTECTION 10
> 
> It may be re-named to PROT_LIST_LEN later, probably.
> 
> How does this plan sound to you?
> 

These three constants are the part of the whole Wear-leveling algorithm,
not only for the protection tree/lists. especially for the GET mothed. 
As far as I could see, Different type data should protect different
'time'. protection 'time' classification makes sense. By means of the
classification, we can implement some more improvement, for instance:

1. UBI_LONGTERM data's PEB may not be protected, but insert into the
USED RB-tree directly, whereas other type data should do.

2. We may split the @dtype into more sub-type. Take the UBI_UNKNOWN as
an example, it seems to have many UBI_UNKNOWN type date in the current
UBI/UBIFS implementation. We may be able to dynamic evaluate the real
type of these UBI_UNKNOWN data in the EBA Sub-system and then GET more
optimal PEB, although this seems to be not so easy.

fundamentally, the question, in my opinion, is not one or three
constants, but how much 'time' corresponding type data should be
protected.

Listen with your suggestion. Thanks.

-- 
Yours sincerely
xiaochuan-xu(cqu.edu.cn)
