Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143E0I-0007bY-00
	for mtd-list@infradead.org; Tue, 05 Dec 2000 09:03:14 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143E0H-0007bS-00
	for mtd@infradead.org; Tue, 05 Dec 2000 09:03:13 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.30.0012041525460.16670-100000@xanadu.gn.com> 
References: <Pine.LNX.4.30.0012041525460.16670-100000@xanadu.gn.com> 
To: Nicolas Pitre <nico@cam.org>
Cc: mark.langsdorf@amd.com, mtd@infradead.org
Subject: Re: Odd behavior of JFFS with AMD chips - kernel panic! 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Dec 2000 09:03:04 +0000
Message-ID: <5734.976006984@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


nico@cam.org said:
>  David --> This is really really misleading and non-intuitive.  Is
> there a good reason to have a separate device node only for read-only
> access?

No good reason. I inherited the device nodes from a previous driver - as
they're already been registered, it made sense at the time to use them as
they were.

I'm reluctant to change them now unless we register a new major number for
them, to prevent confusion. Changing them but keeping the same major# would
even bite the people who _did_ bother to read the documentation and/or run
the provided MAKEDEV script. :)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
