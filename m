Return-path: <David.Woodhouse@mvhi.com>
Received: from localhost ([127.0.0.1] ident=root)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 10hWin-0000wG-00
	for mtd@imladris.demon.co.uk; Wed, 12 May 1999 11:58:41 +0100
Received: from pop3.mail.demon.net
	by localhost with POP3 (fetchmail-5.0.0)
	for mtd@imladris.demon.co.uk (multi-drop); Wed, 12 May 1999 11:58:41 +0100 (BST)
Received: from punt-2.mail.demon.net by mailstore for mtd@imladris.demon.co.uk
          id 926506710:20:24195:25; Wed, 12 May 99 10:58:30 GMT
Date: Wed, 12 May 1999 12:57:30 +0200 (CEST)
From: Alexander Larsson <alex@signum.se>
To: David Woodhouse <David.Woodhouse@mvhi.com>
cc: mtd@imladris.demon.co.uk
Subject: Re: ANNOUNCE: Mailing list for memory technology devices. 
In-Reply-To: <E10hWQj-000196-00@devel2.axiom.internal>
Message-ID: <Pine.LNX.4.04.9905121244520.32694-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 12 May 1999, David Woodhouse wrote:

> alex@signum.se said:
> >  I've done this too. Check out ftp://ftp.signum.se/pub/alex/flash.diff
> > I did it for an embedded ppc 8xx port, but it's platform independent.
> > Contains a generic flash layer and specific support for AMD Flash
> > chips. It also has FTL support. 
> 
> Your code looks similar to mine in many respects, but is more likely to be
> usable with the PCMCIA code. David Hinds has confirmed that he's willing to
> allow memory handling stuff to be removed from the PCMCIA suite and placed into
> the kernel, as long as the required functionality is present.

Ok. I haven't looked too closely on the PCMCIA code, as i know very
little about PCMCIA. I've used davids ftl layer though, with some
structural changes. How come my code is more usable with the PCMCIA code?
 
> At first sight, it seems that the only thing my version has that isn't present 
> in your code is the 'physmem' device, so I'll port that to your system, and 
> then we can ditch my code, and concentrate on making your Common Flash 
> Interface work happily with the PCMCIA code, before submitting an initial 
> version to Linus for his newly-released 2.3 series.

Ok. Sounds good. I did the flash code as a consultant for a customer, but
i'm currently working on some other stuff. That code is of strategic
intrest for us though (we do embedded linux developing) so i might be
able to help out a bit at work. I can certainly work on my spare time...
if i had any :)

The /dev/ftl devices i use are the same as those registred in the major nr
list. But the /dev/flash char devices use the experimental major 60. I was
gonna register it with hpa, but it seems /dev/flash was already registred
(as a  *block* device?).

By the way, how is the interface to PCMCIA flash cards? Do they just get
memory mapped or must you access it via ISA?
 
> Is it OK if I put your diff up for FTP next to my stuff, and use it as the 
> basis for the CVS repository that I was intending to set up?

Sure.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
