Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CFg4O-0005KE-Lp
	for linux-mtd@lists.infradead.org; Thu, 07 Oct 2004 17:45:06 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: jasmine@linuxgrrls.org
In-Reply-To: <37618.192.168.0.2.1097053811.squirrel@192.168.0.2>
References: <4162B2A0.5050200@akhela.com> <1096996674.22827.339.camel@thomas>
	<012901c4ab79$53d4bd20$ce077c0a@asus>
	<37618.192.168.0.2.1097053811.squirrel@192.168.0.2>
Content-Type: text/plain
Message-Id: <1097185032.11402.220.camel@thomas>
Mime-Version: 1.0
Date: Thu, 07 Oct 2004 23:37:12 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mizi support for jffs2 - FAQ
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-10-06 at 11:10, jasmine@linuxgrrls.org wrote:
> > I can't use un up to date kernel
> 
> Why not?

This answer is showing up repeadetly. There are various reasons:

1. I love the bugs and security holes in 2.4.18. This makes my job safe
and I can tinker for another couple of years.

2. It works and I'm not allowed to touch it, except for adding
functionality, because adding functionality is not disturbing the
working parts and we do not have to go through the whole test procedure
again. That's also known as the QA loophole.

3. Kernel versions are like red wine. Let them mature a couple of years
and you will be surprised how reliable they still work.

4. I have no time for porting to a new kernel version. I was told to
apply the XXX patch to the current one until tomorrow. It's your fault
that I will fail. So you are responsible. Hurry and safe my job. Send me
the backported patch.

5. This is the official kernel for this board which was supplied from my
vendor along with the nice click tools for my Windooze box to install
it. 

Seriously, not all of the above is fun and sarcasm. Sadly enough a lot
of it is reality.

But OTH this it not always the fault of the guy who is posting such
questions / requests. There are others to blame also.

1. Board vendors and semiconductor manufacturers. They provide crappy
and ugly kernel ports with random patched kernels which blow up at the
first ping -f. No way to update.

2. The sales guys who babble until the customer believes that the kernel
provided by (1) is the perfect solution.

3. Companies with self advertised "linux expertise" providing random
patched kernels, where you have a 8 Megabyte patch as a result of a diff
against the vanilla kernel it pretends to be forked of. No way to
update.

4. The sales guys who babble until the customer believes that the kernel
provided by (3) is the perfect solution.

Note, that (2) and (4) have different intentions. (2) want to sell chips
/ boards and dont care about the troubles. "Hey, you wanted a linux
kernel. You got one". (4) want to sell their dubious expertise in form
of more dubious support contracts or even use the linux bundle as an
entry to finally promote a proprietary solution which they have in their
portfolio too, when the customer fails with his linux project. "Hey, you
wanted linux. We always said use YYYY. But we could help you to fulfil
your project plan, if you use YYYY." Both want to lock in customers.

5. The managers who fall for the crap promoted by (1)-(4).

6. The managers who make themselve believe, that Linux is without costs.
They base project budgets and timelines on the erroneous assumption that
the community will fix all their problems for free within no time. 

7. The naivety of employees and their lack of courage to stand against
braindead management decisions. "He will kick my ass if I tell him that
the decision is braindead even if I can argue coherently" - Later - "He
is kicking my ass because I failed to tell him that I already new that
it is braindead before the decision was made." or "He is kicking my ass
because I'm failing to accomplish his braindead plan, but I must
succeed". 

In most of this cases there is a quick and dirty hack in the last minute
which rescues the ass and the loop starts over at (1)

That's my daily experience as a serious and contributing Linux
consultant / service provider. 

tglx
