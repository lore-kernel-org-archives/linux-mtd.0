Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13lRu7-0001kh-00
	for mtd-list@infradead.org; Tue, 17 Oct 2000 09:15:23 +0100
Received: from dyna252.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13lRu6-0001kb-00
	for mtd@infradead.org; Tue, 17 Oct 2000 09:15:22 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10010161604200.19953-100000@xanadu.vipswitch.com> 
References: <Pine.LNX.4.10.10010161604200.19953-100000@xanadu.vipswitch.com> 
To: Nicolas Pitre <nico@cam.org>
Cc: Amy Fong <jitvrlcw@umail.furryterror.org>, mtd@infradead.org
Subject: Re: typo in sbc_mediagx.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 17 Oct 2000 09:15:37 +0100
Message-ID: <31016.971770537@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


nico@cam.org said:
> Fixed. 

Thanks. 

Note that if you're using mtdblock.c you'll need to use v1.23 - 1.24 is my 
first attempt at using a kernel thread and it doesn't actually appear to 
work. It'll probably be a few days before I get a chance to look at it 
again - volunteers are welcome if you feel so inclined :)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
