Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]
	helo=pug.o-hand.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HNB1m-0007m1-FL
	for linux-mtd@lists.infradead.org; Fri, 02 Mar 2007 11:54:47 -0500
Subject: Re: [PATCH 4/9] swap: Simplify shmem_unuse() usage [optional]
From: Richard Purdie <rpurdie@openedhand.com>
To: Hugh Dickins <hugh@veritas.com>
In-Reply-To: <Pine.LNX.4.64.0703021631470.11135@blonde.wat.veritas.com>
References: <1172850884.11149.124.camel@localhost.localdomain>
	<Pine.LNX.4.64.0703021631470.11135@blonde.wat.veritas.com>
Content-Type: text/plain
Date: Fri, 02 Mar 2007 16:54:35 +0000
Message-Id: <1172854476.11149.147.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Nick Piggin <nickpiggin@yahoo.com.au>, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org, kernel list <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-03-02 at 16:44 +0000, Hugh Dickins wrote:
> Definite NAK to this one from me: I'm sorry the optimization confuses
> you, but it's well commented at both ends, and speeds up shmem swapoff
> very significantly e.g. minutes down to seconds.  There may well be a
> less confusing way of achieving the same effect, with another return
> code from shmem_unuse, and some gotos, but I'm not all that keen.

Currently there is only one site its used in but with the changes, you
end up with two. My concern is that the behaviour of that function is
not obvious to anyone new to the code and I suspect something will get
broken at some point due to that, even if comments are there.

I'd have no problem with a different return code and some gotos and/or
improved logic. The changes these patches make might even make that
easier to implement. I'll take another look at it and see if I can find
a nicer patch.

> Your other patches, well, as ever I hope I'll get to look at them,
> but there are so many people, all much quicker than me, playing in
> mm these days...

I'm open to offers... :)

Cheers,

Richard
