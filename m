Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pYLy-0002br-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 17:29:22 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pYLx-0002bl-00
	for mtd@infradead.org; Tue, 17 Apr 2001 17:29:21 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3ADC62AE.66B350ED@daniel.com> 
References: <3ADC62AE.66B350ED@daniel.com>  <01041716025800.02061@rob> <01041715513200.02005@rob> <19294.987514727@redhat.com> <20801.987515671@redhat.com> <22300.987516491@redhat.com> 
To: Vipin Malik <vipin.malik@daniel.com>
Cc: rob@sysgo.de, Alexander Melichenko <AlexanderM@lrpeople.com>,
    mtd@infradead.org, mark.langsdorf@amd.com
Subject: Re: Elan SC520 - problem with MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 17 Apr 2001 17:26:04 +0100
Message-ID: <5360.987524764@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


vipin.malik@daniel.com said:
>  Anywhy, why I bring this is up, there is a *nasty* surprise waiting
> for folks that use the default address of 0x8400000 as programmed by
> the BIOS shipped with the board.

OK, so it's likely that the two drivers use different addresses just 
because they expect the board to have been set up differently? Is it 
possible to read the current values of these registers and ioremap() 
accordingly? Then we can make it a config option to reprogram them to a 
sane address. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
