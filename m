Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14tEzr-0004P6-00
	for mtd-list@infradead.org; Fri, 27 Apr 2001 21:37:47 +0100
Date: Fri, 27 Apr 2001 13:37:17 -0700
From: David Schleef <ds@schleef.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Vipin Malik <vipin.malik@daniel.com>, joakim.tjernlund@lumentis.se,
	'Chris Read ' <chris.read@activesilicon.co.uk>, mtd@infradead.org
Subject: Re: Power blackouts and brownouts
Message-ID: <20010427133716.A20218@stm.lbl.gov>
Reply-To: David Schleef <ds@schleef.org>
References: <3AE98278.48DA955@daniel.com> <002801c0ceed$28aad830$0a01a8c0@Win1> <3AE98278.48DA955@daniel.com> <22885.988382072@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22885.988382072@redhat.com>; from dwmw2@infradead.org on Fri, Apr 27, 2001 at 03:34:32PM +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, Apr 27, 2001 at 03:34:32PM +0100, David Woodhouse wrote:
> 
> Note that 'well designed embedded systems' does _not_ include the Intel
> Assabet platform. I believe nothing ever asserts the flash reset line, so if
> you reset while the flash is in a mode other than read mode, the CPU's reset
> vector is pointing at status words :)

This is also a problem for soft-reset.  (Been there, dont that.)
That's why the Sharp chip driver always puts the chips into read
mode after checking the status.  I believe at least one of the
other chip drivers don't do this.



dave...



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
