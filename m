Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pdmK-0007Af-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 23:16:56 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pdmI-0007AZ-00
	for mtd@infradead.org; Tue, 17 Apr 2001 23:16:55 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3ADC73B1.1960BC87@daniel.com> 
References: <3ADC73B1.1960BC87@daniel.com>  <3ADC62AE.66B350ED@daniel.com> <01041716025800.02061@rob> <01041715513200.02005@rob> <19294.987514727@redhat.com> <20801.987515671@redhat.com> <22300.987516491@redhat.com> <5360.987524764@redhat.com> 
To: Vipin Malik <vipin.malik@daniel.com>
Cc: rob@sysgo.de, Alexander Melichenko <AlexanderM@lrpeople.com>,
    mtd@infradead.org, mark.langsdorf@amd.com
Subject: Re: Elan SC520 - problem with MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 17 Apr 2001 23:16:35 +0100
Message-ID: <10578.987545795@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


vipin.malik@daniel.com said:
> Well, that's assuming that the same regs are used by the different
> boot utilities to decode the FLASH banks. There are 15 different regs
> to do this job. You can use any 2!

> I guess that it could be done, you run though all 15 and (looking at
> the bits) first figure out which reg is used for the FLASH CS, then
> which address it's decoding the flash at.

> Urgh!

OK, I wish I hadn't asked now :)

I think I'm just going to stick my head in the sand on this one and accept 
what I'm given. It's just a leafnode driver, and I really can't keep 
track of them all unless they're doing something particularly naughty.

If AMD see fit to provide me with a new map driver and an explanation of 
why it either obsoletes or complements the existing one, I'll include it.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
