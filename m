Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmjZa-0006Pf-Ou
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 07:00:38 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
References: <C77C279BA71FD14985DC8E75FB265AB702DEEF07@usw-am-xch-02.am.trimblecorp.net>
	<49C8FC89.7040709@nokia.com>
	<C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 Mar 2009 08:59:30 +0200
Message-Id: <1238050770.3321.41.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-03-24 at 11:04 -0600, Eric Holmberg wrote:
> > Also, could you tell us what MTD drivers you are using?
> I'm using the physmap CFI flash driver for a CFI-compliant S29GL256P90F
> 256Mbit NOR flash chip.  Is that what you're asking for?
> 
> I'll keep working on a better way to reproduce the problem.  Let me know
> if I need to add some printk statements somewhere and/or enable UBI or
> MTD debugging.

Any news? I am afraid your problem will be that UBIFS floods to much.
In that case try to enable debugging in the config, but do not enable
any debugging messages. Even with this UBIFS should give useful dumps
when this error happens:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

And BTW, we did not test UBIFS well enough on NOR, and never tested
unclean reboots on NOR, but tested them _a lot_ on NAND. So there
may be some problems, but hopefully we can fix them.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
