Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132l5M-0001UH-00
	for mtd-list@infradead.org; Fri, 16 Jun 2000 02:38:16 +0100
Message-ID: <394A57CC.1080403@ctam.com.au>
Date: Fri, 16 Jun 2000 11:37:32 -0500
From: Brendan Simon <brendan.simon@ctam.com.au>
Reply-To: brendan.simon@ctam.com.au
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: akc <akc@pel.dk>, mtd@infradead.org
Subject: Re: CVS access
References: <39489799.EDB77B51@pel.dk> <15540.961058977@cygnus.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> =

> akc@pel.dk said:
> > I tried the Anonymous CVS access, as described, but receives
> > connection refused after entering the password ???
> =

> Works from here. Are you sure you're not firewalled? I don't understand=
 how =

> you can receive 'connection refused' after it's already asked you for a=
 =

> password - you're already connected by then.
I do not think this is true.=A0 I have just tried to do a cvs login to a =

unix machine at work which does not have a cvs server.=A0 It still asks m=
e =

for a password regardless of whether a cvs server is running or not.=A0 I=
t =

seems that as long as a valid host name is supplied, then a password =

will be prompted for before trying to communicate with the cvs server.

> Can you cut and paste exactly what you see?
This would certainly help :)

Brendan Simon.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
