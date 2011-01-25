Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Phe9I-0006jl-QS
	for linux-mtd@lists.infradead.org; Tue, 25 Jan 2011 08:21:13 +0000
Received: by fxm19 with SMTP id 19so5111039fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Jan 2011 00:21:10 -0800 (PST)
Subject: Re: [PATCH v2 3/3] UBIFS: do not start the commit if there is
	nothing to commit
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Ogness <john.ogness@linutronix.de>
In-Reply-To: <87d3nq338b.fsf@vostro.fn.ogness.net>
References: <20101013163005.GB1889@silverbox.local>
	<1295200104.2470.5.camel@koala> <4D33FB78.5010208@nokia.com>
	<1295335817.2470.31.camel@koala> <1295336185.2470.33.camel@koala>
	<87ei8apf8a.fsf@vostro.fn.ogness.net> <1295608400.3186.2.camel@koala>
	<87d3nq338b.fsf@vostro.fn.ogness.net>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 25 Jan 2011 10:20:34 +0200
Message-ID: <1295943634.2227.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-01-21 at 12:28 +0100, John Ogness wrote:
> On 2011-01-21, Artem Bityutskiy wrote:
> > I need to look why there are still erases after mount.  Probably
> > this is actually part of mounting, not part of the first sync.  But
> > otherwise it sounds like you are satisfied, right?
> 
> Yes, it is definately a big improvement. Thanks!
> 
> > But I also have to do power cut tests emulation before really
> > pushing this forward.

The power cut simulation test is running.

> BTW: The return value description for the function nothing_to_commit()
> is backwards. It says that it returns 1 if there is something to
> commit, but actually it returns 1 if there is nothing to commit.

Amended, thanks. Also added:

Tested-by: John Ogness <john.ogness@linutronix.de>

Thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
