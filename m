Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13whPR-0002YJ-00
	for mtd-list@infradead.org; Fri, 17 Nov 2000 09:02:13 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13whPQ-0002YD-00
	for mtd@infradead.org; Fri, 17 Nov 2000 09:02:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01C05075.8E6A49E0@smithwicks.softsys.co.at> 
References: <01C05075.8E6A49E0@smithwicks.softsys.co.at> 
To: Erwin Authried <eauth@softsys.co.at>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: block device for 2.0 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 17 Nov 2000 09:02:05 +0000
Message-ID: <21821.974451725@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


eauth@softsys.co.at said:
> Ok., I have modified it this way. I don't know in detail what kind of
> changes are planned for module support, thus I'd like to know if it's
> ok. to modify cfi_probe.c to be able to compile without module support
> before I commit that: 

I think we need to rewrite the part that load/calls the command set code.
It's fairly horrible. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
