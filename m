Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Tl4R-0002Eg-00
	for mtd-list@infradead.org; Fri, 16 Feb 2001 13:37:11 +0000
Received: from maggiore.dsnet.it ([195.250.233.15])
	by infradead.org with smtp (Exim 3.20 #2)
	id 14Tl4P-0002Ea-00
	for mtd@infradead.org; Fri, 16 Feb 2001 13:37:10 +0000
Received: from sat2520cdt.distelco.it (host70.distelco.it [192.168.1.70])
	by deunan.distelco.it (8.9.3/8.8.7) with ESMTP id OAA28399
	for <mtd@infradead.org>; Fri, 16 Feb 2001 14:29:37 +0100
Message-Id: <4.3.1.0.20010216131159.00b57ef0@mbox.distelco.it>
Date: Fri, 16 Feb 2001 14:37:59 +0100
To: mtd@infradead.org
From: Matteo Costa <matteoc@distelco.it>
Subject: Re: updated lilo mtd patch?
In-Reply-To: <14987.2331.244249.640182@pyramid.insynq.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

You have to remove the two line that define LCF_LARGE_EBDA in the Makefile.
I think this option is no more needed in this version of lilo.
Then you can compile correctly and you should be able to boot without errors.
BTW I'm using a 2.4 kernel, I never tested on a 2.2 kernel.


At 14.39 14/02/01 -0800, you wrote:
>hi there. i'm looking for an updated mtd patch for lilo. the patch in
>cvs seems to be against lilo 21, and doesn't apply cleanly against
>21.6.1, the latest version.
>
>i resolved the obvious conflicts by hand, but the patched lilo doesn't
>compile at all.
>
>--
>  ___________________________________
>| Ian Eure - <ieure@insynq.com>     | "You're living in a facist world...
>|         -  Developer -            | Freedom is a luxury." -Front Line
>|        -  InsynQ, Inc. -          | Assembly, "Digital Tension Dementia"
>| Your Internet Utility Company.tm  |________________________________________
>
>
>To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


<Il problema quando si e' puntuali e' che non c'e' mai nessuno ad apprezzarlo>

Matteo



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
