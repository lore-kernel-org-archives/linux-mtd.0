Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14JHKK-0006i4-00
	for mtd-list@infradead.org; Thu, 18 Jan 2001 15:50:16 +0000
From: mark.langsdorf@amd.com
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F288@txexmta8.amd.com>
To: dwmw2@infradead.org
cc: mtd@infradead.org, jffs-dev@axis.com
Subject: RE: 101% in use?
Date: Thu, 18 Jan 2001 09:48:57 -0600
MIME-Version: 1.0
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> On Tue, 16 Jan 2001 mark.langsdorf@amd.com wrote:
> 
> > I've finally gotten my flash system 95% working, and now I'm
> > performing some stress tests to make sure that everything is
> > good.
> 
> At last :) Good. Have you solved the random oops on write 
> cycles to the ioremapped flash addresses, then?

	Yes, it looks like it was a combination of the code to
calculate offset addresses in cfi_cmdset_0002.c being totally
hosed, and the terrible habit of writing 0xff to non 0xff flash
bytes.  (Both problems have already been fixed in the mainline
code, at about the same time I fixed them in my code base.
Sigh...)

> > The partition size is 14.5 megs, give or take a bit, and
> > I have a very large directly (around 2.7 megs) that I'm
> > repeatedly copying onto the disk and deleting.  At one
> > point, I got my italicization (according to df) up to 
> > 101%, with a negative number of free blocks.  Is this bad?
> 
> I wouldn't worry too much about the results of df. We 
> basically make stuff up in jffs_statfs(). It's only if the
> internal filesystem code _really_ thinks there are negative
> amounts of free space that I'd start to
> wet myself. And I don't think that's the case.

	Okay, that's what I figured, but I wanted to be sure.

-Mark Langsdorf
AMD, Inc.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
