From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <1097185032.11402.220.camel@thomas>
References: <4162B2A0.5050200@akhela.com> <1096996674.22827.339.camel@thomas>
	<012901c4ab79$53d4bd20$ce077c0a@asus>
	<37618.192.168.0.2.1097053811.squirrel@192.168.0.2>
	<1097185032.11402.220.camel@thomas>
Content-Type: text/plain
Message-Id: <1097186945.6525.25.camel@baythorne.infradead.org>
Mime-Version: 1.0
Date: Thu, 07 Oct 2004 23:09:06 +0100
Content-Transfer-Encoding: 7bit
Cc: jasmine@linuxgrrls.org, linux-mtd@lists.infradead.org
Subject: Re: mizi support for jffs2 - FAQ
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-10-07 at 23:37 +0200, Thomas Gleixner wrote:
> But OTH this it not always the fault of the guy who is posting such
> questions / requests. There are others to blame also.
> 
> 1. Board vendors and semiconductor manufacturers. They provide crappy
> and ugly kernel ports with random patched kernels which blow up at the
> first ping -f. No way to update.

Invalid excuse. What muppet bought hardware for which there aren't real
GPL'd drivers which are actually merged (or at least mergeable). Clean
code doesn't stop working from version to version. It it ain't supported
or supportable, buy something else. Or make it supported. But don't come
crying to me.

> 2. The sales guys who babble until the customer believes that the kernel
> provided by (1) is the perfect solution.

Invalid excuse. If they're really that clueless it's fixable by taking a
newer kernel and just changing the numbers back. Long term solution is
to take a baseball bat to your sales team.

> 3. Companies with self advertised "linux expertise" providing random
> patched kernels, where you have a 8 Megabyte patch as a result of a diff
> against the vanilla kernel it pretends to be forked of. No way to
> update.

Invalid excuse. If anyone out there is really proud of giving money to
such muppets please contact me privately. I have a bridge you may be
interested in.

> 4. The sales guys who babble until the customer believes that the kernel
> provided by (3) is the perfect solution.

Fish. Didn't we do this one?

> Note, that (2) and (4) have different intentions. (2) want to sell chips
> / boards and dont care about the troubles. "Hey, you wanted a linux
> kernel. You got one". (4) want to sell their dubious expertise in form
> of more dubious support contracts or even use the linux bundle as an
> entry to finally promote a proprietary solution which they have in their
> portfolio too, when the customer fails with his linux project. "Hey, you
> wanted linux. We always said use YYYY. But we could help you to fulfil
> your project plan, if you use YYYY." Both want to lock in customers.
> 
> 5. The managers who fall for the crap promoted by (1)-(4).

Invalid excuse. The working relationship is wrong here. It is the duty
of the manager to protect the engineer from the horrid nasty customers
-- and it is the duty of the engineer to protect his manager from idiocy
like the above.

> 6. The managers who make themselve believe, that Linux is without costs.
> They base project budgets and timelines on the erroneous assumption that
> the community will fix all their problems for free within no time. 

Invalid excuse. And it's only going to make it worse if you try to cover
it up.

> 7. The naivety of employees and their lack of courage to stand against
> braindead management decisions. "He will kick my ass if I tell him that
> the decision is braindead even if I can argue coherently" - Later - "He
> is kicking my ass because I failed to tell him that I already new that
> it is braindead before the decision was made." or "He is kicking my ass
> because I'm failing to accomplish his braindead plan, but I must
> succeed". 

You only really have one option in this situation if you want to retain
long-term credibility. You just say 'no'.

It's very simple. These people come to you because you are supposed to
know best. If they were capable of making decisions and writing code for
themselves, you wouldn't be talking to them in the first place. 

So you either do it right, and build a reputation for being perhaps a
little bit forthright but generally useful, or you bodge together some
crap and continuously get associated with the kind of results that
achieves. Your call. 

Personally, I know which side I prefer to err on :)

> That's my daily experience as a serious and contributing Linux
> consultant / service provider. 

Amen :)

-- 
dwmw2
