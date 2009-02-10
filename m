Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LWpqO-0003d1-B4
	for linux-mtd@lists.infradead.org; Tue, 10 Feb 2009 10:27:59 +0000
Subject: Re: [RFC / PATCH] ubiformat: make it work on mtd parts > 2GiB
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <4991542C.4080206@linutronix.de>
References: <20090210095614.GA1995@www.tglx.de>
	<1234260416.17790.109.camel@localhost.localdomain>
	<4991542C.4080206@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Feb 2009 12:27:39 +0200
Message-Id: <1234261659.17790.117.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-02-10 at 11:17 +0100, Sebastian Andrzej Siewior wrote:
> > I do not think you need to make eraseblock number and offset to be
> > unsigned. In fact, I'd like them to be signed, because this is the same
> > we have in the kernel (in UBI/UBIFS), and I'd like to be more or less
> > consistent.
> That is a point. However those things should never be negative so maybe we 
> could change this in kernel.

They should not indeed be negative. However, signed numbers are just
much more appropriate when you write the code, because you may put an
error code there if something goes wrong.

For example, the UBIFS Garbage collector returns the freed eraseblock
number in case of success or a negative error code in case of failure.
Compare:

int ubifs_garbage_collect(struct ubifs_info *c)

and

int ubifs_garbage_collect(struct ubifs_info *c, unsigned int *leb)

The first prototype is what we have now. The second is what we would
have to have to be able to return LEB number and error code.

And vs. changing UBI/UBIFS - that would be really a lot of work.

Anyway, the thing is that 31-bit should be more than enough for
eraseblock number.

> While we here, I get a couple of "compare between signed and unsigned" 
> warnings from gcc. I tried to clean them up but I end up with huge patches 
> similar to this one. Are you aware of those or you simply don't get them?

I'd rather shut the warnings up by an gcc option - is there such an
option?

I mean, IMO most of these warnings are not really sane, and cleaning
that up just adds mess - you stop understanding why is something signed
or unsigned :-)

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
