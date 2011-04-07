Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7pYl-0007ga-1H
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2011 13:47:43 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p37DldWt021944
	for <linux-mtd@lists.infradead.org>; Thu, 7 Apr 2011 16:47:40 +0300
Subject: Re: [PATCHv2] tests: introduce new target tests in Makefile
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
In-Reply-To: <1302182824.689.6.camel@fs-test.research.nokia.com>
References: <1302173079.2407.30.camel@localhost>
	<70d48001851ef7d188d07b2b0846548bd142f246.1302181786.git.ext-andriy.shevchenko@nokia.com>
	<1302181805.2407.39.camel@localhost>
	<1302182824.689.6.camel@fs-test.research.nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 07 Apr 2011 16:44:54 +0300
Message-ID: <1302183894.2407.41.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-04-07 at 16:27 +0300, Andy Shevchenko wrote:
> On Thu, 2011-04-07 at 16:10 +0300, Artem Bityutskiy wrote:
> > On Thu, 2011-04-07 at 16:10 +0300, Andy Shevchenko wrote:
> > > +
> > > +tests::
> > > +	$(MAKE) -C $(TESTS)
> > 
> > two colons?
> Yep, exactly.
> 
> We have tests subdirectory, and we have tests rule in tests/Makefile.
> So, double colon here makes the rule a) independent, b) runs every time
> when asked.

Ok, got it.

Pushed to mtd-utils.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
