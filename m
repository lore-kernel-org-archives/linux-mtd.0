Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 148078-0003gU-00
	for mtd-list@infradead.org; Mon, 18 Dec 2000 13:14:02 +0000
Message-ID: <52AF3CB987C7D41183CD0090271F67C3184D@m4eng.m4data.co.uk>
From: Simon Munton <Simon.Munton@m4data.co.uk>
To: David Woodhouse <dwmw2@infradead.org>, jffs-dev@axis.com,
   mtd@infradead.org
Subject: RE: JFFS: deleted files still appear in directory 
Date: Mon, 18 Dec 2000 13:13:44 -0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Yep, that fixed it. I'll try and break something else now.

Simon

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: 18 December 2000 01:06 pm
> To: Simon Munton; jffs-dev@axis.com
> Subject: Re: JFFS: deleted files still appear in directory 
> 
> 
> 
> Simon.Munton@m4data.co.uk said:
> > There's still a problem with the following sequence of commands:
> > # touch foo 
> > # touch bar
> > # mv foo bar
> > # rm bar
> > rm: cannot unlink `bar': Input/output error 
> 
> Hopefully that's fixed by the change to jffs_find_child() 
> which I just 
> committed.
> 
> 
> --
> dwmw2
> 
> 


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
