Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 139x49-0003rF-00
	for mtd-list@infradead.org; Wed, 05 Jul 2000 22:50:45 +0100
Date: Wed, 5 Jul 2000 22:49:55 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Juan Gonzo <kayemmess@yahoo.ca>
cc: MTD Mailing List <mtd@infradead.org>
Subject: Re: MTD, JFFS, my target -- bringing them together?
In-Reply-To: <20000705201702.5221.qmail@web5304.mail.yahoo.com>
Message-ID: <Pine.LNX.4.21.0007052247490.1189-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 5 Jul 2000, Juan Gonzo wrote:

> From previous emails, it seems I have to supply a
> read16() and write16() function for MTD to work
> properly on my system.  Is this right?  Is that all
> I have to supply?  What about all that info from the
> website about populating the mtd_info struct and the
> add_mtd_device business?  Do I still have to do that?

No you don't. All you need to do is provide something based on the
physmap.c file which the CFI chip driver can use to access the chips. In
fact, in the majority of cases you should get away with only changing a
couple of #defines in that file to say where in physical memory the chips
are, and how large the range is that they're mapped into.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
