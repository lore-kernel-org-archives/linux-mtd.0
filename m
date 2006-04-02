Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FQ0Bp-0000NG-UN
	for linux-mtd@lists.infradead.org; Sun, 02 Apr 2006 06:52:17 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0603311143460.14923@localhost.localdomain>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<442B9FA5.9070901@ru.mvista.com> <442BF839.8060402@intel.com>
	<1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com> <442CE217.8080103@yandex.ru>
	<Pine.LNX.4.64.0603311143460.14923@localhost.localdomain>
Content-Type: text/plain
Date: Sun, 02 Apr 2006 14:51:40 +0400
Message-Id: <1143975101.3579.121.camel@sauron.oktetlabs.ru>
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

On Fri, 2006-03-31 at 11:49 -0500, Nicolas Pitre wrote:
> But... before going that far, is this something that really makes sense 
> in practice?
> IMHO striping NOR and NAND together simply makes no sense.  NOR and NAND 
> are fundamentally different things when it comes to writing to them, and 
> apart from evaluation boards where every possible peripheral can be 
> found you rarely will find both NOR and NAND in the same real life 
> design.
> 
> So why bother?
Err, I did not offer to do this, right? I should have used the
conjunctive mood (would, could be, etc) for that, sorry.

I don't at all think it is sane, I just wanted to say that there is no
fundamental reasons why this cannot work. The other question that this
seems to be a perversion, but it still can work, in theory. And if all
is done correctly, I should be able to stripe NAND and NOR, in theory.
But again, I emphasize, I do not offer to try this combination, or to
test it.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
