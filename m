Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pnw54-00017Z-88
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 16:42:50 +0000
Received: by iwn38 with SMTP id 38so2565176iwn.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 08:42:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1297437362.2760.57.camel@localhost>
References: <AANLkTikxCVO5Qs4amo1cCgnYVD3fYZdKh2in4e+X5EFV@mail.gmail.com>
	<1297002281.4460.6.camel@localhost>
	<AANLkTi=M58XrQYEhN1JGX3brBu2aV5h=oAv+Wb9oe46q@mail.gmail.com>
	<AANLkTimJFv1Uy2c70ewPUHYH58rQHT=VsDa3ioU9hJZh@mail.gmail.com>
	<AANLkTikH6AtyN45Z7wA4tpaxXsLhGUnZZj=bpC18F=xn@mail.gmail.com>
	<1297437362.2760.57.camel@localhost>
Date: Fri, 11 Feb 2011 16:42:47 +0000
Message-ID: <AANLkTimuASijpXoxJj75=0-a7kqGFGSXGvGDkQuLXDVj@mail.gmail.com>
Subject: Re: Testing a device using mtd_stresstest
From: David Peverley <pev@sketchymonkey.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Karl Beldan <karl.beldan@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Thanks for the useful feedback!

> I do not know YAFFS, ask Charles, but I _think_ YAFFS does not use
> sub-pages, so you han have that option enabled.
Yep, I posted to the YAFFS list ; interestingly the write verify
failure found a case in yaffs where a write failure wasn't tested and
(I believe) erroneously completes a checkpoint write as a result...!
Having said that from

> For sure, if you do not use sub-pages and it catches problems - have it
> enabled and nail the problems down.
Sure, that makes sense. Although I'm having fun trying to
differentiate issues ; I get both the write verify failures and the
"uncorrectable errors" and there's not necessarily a direct
correlation between occurrences so my gut tells me they're to separate
issues...!

> Yeah, I think the tests should not do this, they should just test and
> report you issues.
Ok, so to summarise my understanding so far, a failure during the
stresstest is likely to be one of two things ; either a failure due to
a bad block developing which is not unexpected or an actual failure of
the test case per-se, or it could be due to Something Else Bad which
is not expected and IS a test failure. The only way I can see to
differentiate between these two situations is via statistics. i.e. if
a block is repeatedly failing its likely bad. If random blocks are
failing separately its probably something else warranting
investigation. Is that correct?

If so would it be more useful to adapt the (kernel) stresstest so that
it doesn't abort the test run on a failure but instead keeps a tally
of blocks within which failures have occurred and runs to completion.
Does that sound like a beneficial change? I'm not sure what strategy
is used for discerning if a block is bad or not but nandtest.c from
mtd-utils simply marks if an erase or write fails at all so this would
hopefully give more useful feedback from the stresstest. Aborting the
test on what could be a normal bad block seems a little misleading,
although I'm admittedly an unusually ardent fan of tests being
unambiguous... :-)

Thanks!

~Pev
