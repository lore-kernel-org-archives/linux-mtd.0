Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13WJ60-0000oy-00
	for mtd-list@infradead.org; Tue, 05 Sep 2000 14:49:04 +0100
Received: from runyon.cygnus.com ([205.180.230.5] helo=cygnus.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13WJ5y-0000os-00
	for mtd@infradead.org; Tue, 05 Sep 2000 14:49:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39B4F959.EA4AFEBD@cotw.com> 
References: <39B4F959.EA4AFEBD@cotw.com>  <21668.968158401@passion.cygnus.co.uk> 
To: "Steven J. Hill" <sjhill@cotw.com>
Cc: mtd@infradead.org
Subject: Re: Naming of functions in 'mtdcore.c' 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Sep 2000 14:48:48 +0100
Message-ID: <29781.968161728@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


sjhill@cotw.com said:
> For the 'register_mtd_user' and 'unregister_mtd_user' functions would
> renaming them to something like 'add_mtd_notify_callbacks' and
> 'del_mtd_notify_callbacks' be more understandable? At a first read it
> would to me. Comments? 

You may be right. I already changed it from {un,}register_mtd_notifier
to what it is at the moment because I thought it made it clearer. But I'm 
not really the right person to judge. 

Now it's in 2.4 like that, though, it may be best to leave it as-is.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
