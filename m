Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OOozy-00061Y-IR
	for linux-mtd@lists.infradead.org; Wed, 16 Jun 2010 09:33:31 +0000
Subject: Re: [PATCH] UBI: fix delete compatible internal volume scan
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brijesh Singh <brijesh.s.singh@gmail.com>
In-Reply-To: <AANLkTim9DUdPdqqpXqrH9n7RqXrb9VTyc3AT36Kk6Wf7@mail.gmail.com>
References: <AANLkTimuYmRDCZCkoB9YHifngCwjp9_B2ucFQ1seaiM9@mail.gmail.com>
	<1274595417.8881.36.camel@localhost.localdomain>
	<1276669357.19028.280.camel@localhost>
	<AANLkTim9DUdPdqqpXqrH9n7RqXrb9VTyc3AT36Kk6Wf7@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 16 Jun 2010 12:30:29 +0300
Message-ID: <1276680629.19028.329.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-06-16 at 14:22 +0530, Brijesh Singh wrote:
> > Thirdly, even without your patch everything works just fine, because
> > even though we also add this PEB to the used tree, we'll never ever use
> > it, so it will not cause problems.
> I created internal delete compatible volume. My assumption was that
> this volume gets deleted in older versions of UBI.

Right.

>  So, UBI should not
> add this PEB to used tree.

As I described, it should not indeed. But adding it to the used tree
does not cause problems in practice. I mean that old UBI binaries which
do not contain your patch will also work just fine.

I've pushed your patch to the UBI tree.

>  Please correct me if my assumption is
> wrong.

It is right.

> I have one question: Should UBI ensure that delete compatible volume
> is deleted? If yes, should these erase blocks be deleted at
> initialization (not lazily)?

Hmm, good question. I think it is fine to delete them asynchronously. I
do not see any problems with that. If we have, e.g., a power cut before
they are actually erased, we will erased them next time we mount.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
