Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LAKiQ-0000q8-VW
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 08:46:43 +0000
Subject: Re: [PATCH 4/4] UBI WL-Subsys: Improvement in prot tree
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
In-Reply-To: <1228884752.3225.80.camel@localhost.localdomain>
References: <1228823163.2753.18.camel@localhost.localdomain>
	<1228827803.13686.189.camel@sauron>
	<1228884752.3225.80.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Wed, 10 Dec 2008 10:44:28 +0200
Message-Id: <1228898668.13686.223.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-12-10 at 12:52 +0800, xiaochuan-xu wrote:
> > This will allow us to implement efficient protection queue
> >  which you will not need to walk at all.
> Sorry, I don't quite follow this meaning.
> You mean one protection list (not lists) could filfull the function?

I was thinking about a pipe-like design. When you want to protect a PEB,
you put it to the head of a pipe. This guarantees that it will go out of
the pipe after N erase cycles, where N is the length of the pipe (e.g.,
10). When any eraseblock is erased, it takes one element from the head
of the pipe.

Thus, you will not need to walk any list when in the erase worker.
You'll need to just take the element from the end of the pipe. Well,
some tricks are needed to guarantee that it always takes N erase cycles
for _any_ element to get out of the protection pipe. And the data
inserting / removing elements should be quick and O(1).

> These three constants are the part of the whole Wear-leveling algorithm,
> not only for the protection tree/lists. especially for the GET mothed.=20
> As far as I could see, Different type data should protect different
> 'time'. protection 'time' classification makes sense. By means of the
> classification, we can implement some more improvement, for instance:
>=20
> 1. UBI_LONGTERM data's PEB may not be protected, but insert into the
> USED RB-tree directly, whereas other type data should do.

Yes, I guess.

> 2. We may split the @dtype into more sub-type. Take the UBI_UNKNOWN as
> an example, it seems to have many UBI_UNKNOWN type date in the current
> UBI/UBIFS implementation. We may be able to dynamic evaluate the real
> type of these UBI_UNKNOWN data in the EBA Sub-system and then GET more
> optimal PEB, although this seems to be not so easy.

May be, but this is a separate thing.

> fundamentally, the question, in my opinion, is not one or three
> constants, but how much 'time' corresponding type data should be
> protected.

I think it does not matter much and we may use the same constant for
short term and unknown eraseblocks. I do not see much difference between
8 or 16. Does it really matter? We just want to prevent this eraseblock
from being moved for some reasonable "time". And everything depends on
work-load of course. So I think just using the same constant for all PEB
types is reasonable. This will be simpler.

But of course, the best way is to test things.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
