Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14gSbM-0001G0-00
	for mtd-list@infradead.org; Fri, 23 Mar 2001 14:31:40 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14gSbK-0001Fu-00
	for mtd@infradead.org; Fri, 23 Mar 2001 14:31:39 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200103231425.f2NEPYH21217@new-york.lcs.mit.edu> 
References: <200103231425.f2NEPYH21217@new-york.lcs.mit.edu>  <200103230202.f2N22R612056@new-york.lcs.mit.edu> <11429.985336657@redhat.com> 
To: decouto@lcs.mit.edu
Cc: mtd@infradead.org, ipaq@handhelds.org
Subject: Re: jffs2 problem 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 23 Mar 2001 14:31:22 +0000
Message-ID: <12498.985357882@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


decouto@lcs.mit.edu said:
>  i tried it again, but definitely erasing first.  similar thing:
> Argh. Special inode #1011 had more than one node

Very strange. Can you change DEFAULT_CONSOLE_LOGLEVEL to 8 in kernel/
printk.c, boot it and log all the messages? There'll be lots.


decouto@lcs.mit.edu said:
>  hmmm.  my last checkout and compile was say weds 21 march.

Ought to be OK. I haven't knowingly fixed something since then which I 
think could cause this behaviour.

What is ino #1101?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
