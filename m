Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17I5fU-0000mX-00
	for <linux-mtd@lists.infradead.org>; Wed, 12 Jun 2002 11:48:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <614CC7C21856D1118DA30060B06B487302ACCA37@SMF-NT-MAIL1> 
References: <614CC7C21856D1118DA30060B06B487302ACCA37@SMF-NT-MAIL1> 
To: Eric Nelson <eric_n2@verifone.com>
Cc: brendan.simon@bigpond.com, linux-mtd@lists.infradead.org
Subject: Re: DOC2000 partitiioning question 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 12 Jun 2002 11:47:50 +0100
Message-ID: <24980.1023878870@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I discarded your message at first because I couldn't find any original 
content. It's customary to quote only the relevant part of the message to 
which you're replying, with a suitable marker such as '> ' to distinguish 
it from your own text.

eric_n2@verifone.com said:
>  I know, from following this list, that there are many, like me, who
> have no choice but to use DOC, and are sold on JFFS2, but just don't
> have the time or expertise to make these modifications.  I know you
> are busy, but you are the expert, and it would be widely appreciated
> if you lend your expertise to finishing porting JFFS2 to DOC, so I,
> and many others, could quit telling our bosses that JFFS2 is
> definitely the best, but it's not quite ready for DOC?? 

It's getting there, slowly. I dispute the implication that I'm the only
person with sufficient expertise -- Thomas has done a very good job of
implementing most of the NAND support, for example.

I don't have much time either -- certainly not enough to set up the hardware
and run tests on it. But I _can_ find some time occasionally to work on it
if someone tests it and points out problems. 

The thing is -- I haven't received any failure reports for NAND flash
recently. That either means it's perfect or it means nobody cares enough to
even test it. 

The only way it's going to progress from the "I think it works, wouldn't
want to ship it yet" state to "Ready for production", even if the code
itself is actually perfect already, is by getting tested hard.

That means either someone out there getting off their proverbial wossname
and testing it, reporting the results to my satisfaction, or me getting
assigned sufficient time to do it. I was sort of hoping the former was more
likely -- because the latter isn't.

--
dwmw2
