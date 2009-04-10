Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LsKGa-0002mR-2m
	for linux-mtd@lists.infradead.org; Fri, 10 Apr 2009 17:12:11 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB702FE5324@usw-am-xch-02.am.trimblecorp.net>
References: <C77C279BA71FD14985DC8E75FB265AB702DEEF07@usw-am-xch-02.am.trimblecorp.net>
	<49C8FC89.7040709@nokia.com>
	<C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
	<1238050770.3321.41.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702DEFBF5@usw-am-xch-02.am.trimblecorp.net>
	<C77C279BA71FD14985DC8E75FB265AB702E4C3CA@usw-am-xch-02.am.trimblecorp.net>
	<1239366310.3390.9.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE51AC@usw-am-xch-02.am.trimblecorp.net>
	<1239376652.3390.49.camel@localhost.localdomain>
	<1239378582.3390.66.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE5324@usw-am-xch-02.am.trimblecorp.net>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 10 Apr 2009 20:11:40 +0300
Message-Id: <1239383500.3390.76.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	Urs Muff <urs_muff@Trimble.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-04-10 at 11:00 -0600, Eric Holmberg wrote:
> Thank you very much for your help so far. 
NP, this is all I can do now without having real NOR and
much time :-)

>  I am going to do two things:
>  1. Turn off write buffering which converts the NOR minimum I/O size from 1 to effectively 32 16-bit words (64 bytes) and re-run all of the tests.

Err, which buffering? Is this something at the flash driver
level? 

Note, UBIFS never talks to MTD level, it talks only
to UBI level, which talks to MTD. UBI will provide UBIFS
min. I/O unit size which it reads from mtd->writesize.
Then if it is < 8, UBIFS will use 8 instead. There is not
fundamental reason for this, it was just easier to implement
UBIFS this way. But this is not big deal.

In your case, as I see from your logs, min. I/O unit reported
from MTD to UBI is 1, and from UBI to UBIFS it is 1, but then
UBIFS will use 8 instead. This means all write commands UBIFS
will issue will be aligned to 8 and be multiple of 8.

So if you are talking about turning off some buffering on
MTD level, may be it is ok. But if you are talking about
UBIFS level - no need to do anything there.

>  2. While this is running, I'm going to start following the modifications and debugging path that you outlined.
> 
> I'll report back with findings and potential modifications -- as always, feel free to ping me if you don't hear anything!

OK.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
