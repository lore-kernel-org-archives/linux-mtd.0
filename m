Received: from www.tglx.de ([62.245.132.106])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PgFAb-0000ry-7o
	for linux-mtd@lists.infradead.org; Fri, 21 Jan 2011 11:28:47 +0000
To: dedekind1@gmail.com
Subject: Re: [PATCH v2 3/3] UBIFS: do not start the commit if there is nothing
	to commit
From: John Ogness <john.ogness@linutronix.de>
References: <20101013163005.GB1889@silverbox.local>
	<1295200104.2470.5.camel@koala> <4D33FB78.5010208@nokia.com>
	<1295335817.2470.31.camel@koala> <1295336185.2470.33.camel@koala>
	<87ei8apf8a.fsf@vostro.fn.ogness.net> <1295608400.3186.2.camel@koala>
Date: Fri, 21 Jan 2011 12:28:36 +0100
In-Reply-To: <1295608400.3186.2.camel@koala> (Artem Bityutskiy's message of
	"Fri\, 21 Jan 2011 13\:13\:20 +0200")
Message-ID: <87d3nq338b.fsf@vostro.fn.ogness.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2011-01-21, Artem Bityutskiy wrote:
> I need to look why there are still erases after mount.  Probably
> this is actually part of mounting, not part of the first sync.  But
> otherwise it sounds like you are satisfied, right?

Yes, it is definately a big improvement. Thanks!

> But I also have to do power cut tests emulation before really
> pushing this forward.

OK.

BTW: The return value description for the function nothing_to_commit()
is backwards. It says that it returns 1 if there is something to
commit, but actually it returns 1 if there is nothing to commit.

John Ogness
