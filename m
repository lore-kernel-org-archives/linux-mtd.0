Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143cN1-0004uq-00
	for mtd-list@infradead.org; Wed, 06 Dec 2000 11:04:19 +0000
Date: Wed, 6 Dec 2000 21:04:11 +1000
Message-Id: <200012061104.VAA22134@singularity.tronunltd.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: Millennium
From: "Ian" <Relativity@HumanHeuristic.com>
Cc: <mtd@infradead.org>
Reply-To: "Ian" <Relativity@HumanHeuristic.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



Yep - that's cool.  That was in the AppNote Ollie referred me to (and I think it mentions 
that somewhere on their utils disk ... or the notes that go with it).



  ----- Original Message -----
>From: "David Woodhouse" <dwmw2@infradead.org>
>To: "Ian" <Relativity@humanheuristic.com>
>Subject:  Re: Millennium
>Date: Wed, 06 Dec 2000 10:44:19 +0000
>
> 
> Relativity@HumanHeuristic.com said:
> >  Is there any firmware required on the DoC2001 to make it perform its
> > 8 x bootblock  memory magic?  .. or is it all done in glue logic?
> 
> Note that writing new stuff into the flash doesn't automatically update the 
> IPL RAM. You need to power cycle the device before your new code actually 
> appears in the RAM - resetting the host board doesn't necessarily work.
> 
> --
> dwmw2
> 
> 
> 

--
http://HumanHeuristic.com/
"Bringing people together in a world full of computers"



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
