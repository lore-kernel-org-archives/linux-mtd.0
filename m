Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14kWw3-0000Ob-00
	for mtd-list@infradead.org; Tue, 03 Apr 2001 20:57:51 +0100
Date: Tue, 3 Apr 2001 21:56:39 +0200 (CEST)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: Directory restructure? 
In-Reply-To: <23328.985646097@redhat.com>
Message-ID: <Pine.LNX.4.21.0104032147210.21780-100000@godzilla.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 26 Mar 2001, David Woodhouse wrote:
> >  Hopefully you can play that game directly within the repository so
> > not to lose log history. 
> 
> That's the plan, yes.

There is no clean way of moving files in cvs and retaining history :( it's
one of the (few) bad things with cvs (another is that you cannot really
use -D to check out an old version cleanly).

I think the closest you can get is to cp the ,v files to the new place
and then do cvs rm on the original files (so you can restore an earlier
version if you want). If you do plain mv you screw that up (as well as any
person who has a checkout).

You'll need to manually remove the tags from the cp'ed files though,
otherwise you'll get problems backing up as well (you'll get duplicates).

-BW



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
