Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13CzvD-0006BK-00
	for mtd-list@infradead.org; Fri, 14 Jul 2000 08:30:07 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13CzvB-0006BD-00
	for mtd@infradead.org; Fri, 14 Jul 2000 08:30:06 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200007140358.WAA26445@duracef.shout.net> 
References: <200007140358.WAA26445@duracef.shout.net> 
To: Michael Elizabeth Chastain <mec@shout.net>
Cc: scote1@matrox.com, mtd@infradead.org, tao@acc.umu.se
Subject: Re: Config.in 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 14 Jul 2000 08:30:01 +0100
Message-ID: <8319.963559801@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mec@shout.net said:
>  I am not following the MTD discussion, but I gather the idea is to
> use the same Config.in files for both 2.2 and 2.3.  If you need to do
> that, I suppose you can use define_bool and get away with it. 

Ok. I'll leave Linus with define_tristate for now and change my copy back 
to define_bool. Hopefully I won't accidentally flush that change back to 
Linus.

Thanks.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
