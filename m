Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143c47-0004lU-00
	for mtd-list@infradead.org; Wed, 06 Dec 2000 10:44:47 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143c45-0004lN-00
	for mtd@infradead.org; Wed, 06 Dec 2000 10:44:46 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200012060445.OAA20682@singularity.tronunltd.com> 
References: <200012060445.OAA20682@singularity.tronunltd.com> 
To: "Ian" <Relativity@HumanHeuristic.com>
Cc: mtd@infradead.org
Subject: Re: Millennium 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 06 Dec 2000 10:44:19 +0000
Message-ID: <12499.976099459@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Relativity@HumanHeuristic.com said:
>  Is there any firmware required on the DoC2001 to make it perform its
> 8 x bootblock  memory magic?  .. or is it all done in glue logic?

Note that writing new stuff into the flash doesn't automatically update the 
IPL RAM. You need to power cycle the device before your new code actually 
appears in the RAM - resetting the host board doesn't necessarily work.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
