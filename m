Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14tS4U-0006p6-00
	for mtd-list@infradead.org; Sat, 28 Apr 2001 11:35:26 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14tS4T-0006p0-00
	for mtd@infradead.org; Sat, 28 Apr 2001 11:35:25 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010427133716.A20218@stm.lbl.gov> 
References: <20010427133716.A20218@stm.lbl.gov>  <3AE98278.48DA955@daniel.com> <002801c0ceed$28aad830$0a01a8c0@Win1> <3AE98278.48DA955@daniel.com> <22885.988382072@redhat.com> 
To: David Schleef <ds@schleef.org>
Cc: Vipin Malik <vipin.malik@daniel.com>, joakim.tjernlund@lumentis.se,
    'Chris Read ' <chris.read@activesilicon.co.uk>, mtd@infradead.org
Subject: Re: Power blackouts and brownouts 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 28 Apr 2001 11:34:45 +0100
Message-ID: <9152.988454085@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ds@schleef.org said:
>  This is also a problem for soft-reset.  (Been there, dont that.)
> That's why the Sharp chip driver always puts the chips into read mode
> after checking the status.  I believe at least one of the other chip
> drivers don't do this. 

This bit me too, on suspend/resume. We now have MTD suspend/resume 
functions which deal with that case.

Incidentally, is there any particular reason why the functionality of the 
sharp driver shouldn't be provided by a more generic version of the Intel/
Sharp CFI commandset driver? Once we fix up the probe, of course.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
