Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qFva-000102-00
	for mtd-list@infradead.org; Thu, 19 Apr 2001 16:01:02 +0100
Date: Thu, 19 Apr 2001 10:55:24 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: <joakim.tjernlund@lumentis.se>,
        "'Florian Schirmer / TayTron'" <schirmer@taytron.net>,
        "'Vipin Malik'" <vipin.malik@daniel.com>, <mtd@infradead.org>
Subject: Re: JFFS2 as root FS 
In-Reply-To: <13506.987685342@redhat.com>
Message-ID: <Pine.LNX.4.33.0104191051220.9400-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Thu, 19 Apr 2001, David Woodhouse wrote:

>
> joakim.tjernlund@lumentis.se said:
> >  I have tried to mount the FS again and the files are still there. It
> > still takes 1 min and 30 sec to mount it and sometime when I do a ls
> > the system hangs for 10-20 sec before the output from ls is seen. Is
> > this normal?
>
> That's very very slow. I don't know why it's being so slow for you.

Maybe the flash access timing is awfully slow?  Default values for such
things are often the slowest.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
