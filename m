Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14tXBp-0008C3-00
	for mtd-list@infradead.org; Sat, 28 Apr 2001 17:03:21 +0100
Date: Sat, 28 Apr 2001 09:00:21 -0700
From: David Schleef <ds@schleef.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: mtd@infradead.org
Subject: Re: sharp driver dissimilarities
Message-ID: <20010428090021.A21620@stm.lbl.gov>
Reply-To: David Schleef <ds@schleef.org>
References: <20010427133716.A20218@stm.lbl.gov> <3AE98278.48DA955@daniel.com> <002801c0ceed$28aad830$0a01a8c0@Win1> <3AE98278.48DA955@daniel.com> <22885.988382072@redhat.com> <20010427133716.A20218@stm.lbl.gov> <9152.988454085@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9152.988454085@redhat.com>; from dwmw2@infradead.org on Sat, Apr 28, 2001 at 11:34:45AM +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sat, Apr 28, 2001 at 11:34:45AM +0100, David Woodhouse wrote:
> 
> Incidentally, is there any particular reason why the functionality of the 
> sharp driver shouldn't be provided by a more generic version of the Intel/
> Sharp CFI commandset driver? Once we fix up the probe, of course.

I tried and failed, but that may be just my lack of understanding
of the CFI driver.  The commands, command write locations, and
status bits have no similarity to other chip drivers.




dave...



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
