Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FQ0fO-0001MP-0H
	for linux-mtd@lists.infradead.org; Sun, 02 Apr 2006 07:22:52 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0603311152310.14923@localhost.localdomain>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<442B9FA5.9070901@ru.mvista.com> <442BF839.8060402@intel.com>
	<1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com>
	<442CE217.8080103@yandex.ru> <442CE2DC.7020505@yandex.ru>
	<442CE5AB.8030903@intel.com>
	<1143795335.3579.63.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0603311152310.14923@localhost.localdomain>
Content-Type: text/plain
Date: Sun, 02 Apr 2006 15:22:13 +0400
Message-Id: <1143976933.3579.153.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alexander Belyakov <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] MTD: Striping layer core
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I'm sorry but I must disagree with your assertion above.
NP :-), I just expressed my opinion, it of course does not have to be
correct!

> Yes the MTD interface might need a big revamp... but why would that be 
> related to stripe at all?
Note, I did not say: guys, I think you definitely must do that. I quote
myself: "And the best thing you can do is"... Well, probably I should
have said "And the best thing you *could do* is"? Please, remember, that
I don't have an excellent feeling of English language (yet, I hope :-))
so some things may sound tough while I do not mean this. Apologies.

I emphasize, I'm saying about how I think it would be better to do this.
If our Intel partners like my Ideas, they may make use of them. If they
don't, they surely don't have to. They may argue and show me that what
I'm talking about is insane. I understand that they may have no time to
re-work MTD.

> Why would a striped MTD device be different from, say, a partitioned MTD 
> device?
I opposite, I think they must look the same way for dumb applications.
But smart applications, which may want to use some stripe-specific
things, still have to have a way to figure out that this MTD device is a
striping device. I hope you don't object here. And I would extend this
statement: 

-- the MTD interface should be completely uniform, but there has to be a
uniform way to figure out the type of the underlying MTD device. Using
this type applications may start using some device-specific things, but
not via mtd_info, but using the corresponding MTD subsystem (NAND
subsystem, stripe subsystem, DataFlash subsystem, etc).

Please, look at my logical chain. Once there should be a way to
recognize the type of MTD devices, the right way to do this is to look
at the mtd->type field. And hence, it should be MTD_STRIPE.

Question: well, fine, but how will we point whether it is NOR or NAND?
Answer: Indeed, this is a problem. I think "the right" way is to get rid
of the need to realize whether this is NOR or NAND at all. To do this,
we have to to make the MTD interface more generic.

I buy your grounded criticism. But I do not see an alternative offer how
this should look from you. I assume you mean that no MTD_STRIPE stripe
should be introduced, and that mtd->type have to contain MTD_NOR,
MTD_NAND, or whatever the striped flash is.

Well, this will work. This is easier. I do not object. But this is not
perfect in my opinion.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
