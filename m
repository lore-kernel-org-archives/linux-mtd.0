Return-path: <David.Woodhouse@mvhi.com>
Received: from localhost ([127.0.0.1] ident=root)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 10kTVA-0002Rv-00
	for mtd@imladris.demon.co.uk; Thu, 20 May 1999 15:08:48 +0100
Received: from pop3.mail.demon.net
	by localhost with POP3 (fetchmail-5.0.0)
	for mtd@imladris.demon.co.uk (multi-drop); Thu, 20 May 1999 15:08:48 +0100 (BST)
Received: from punt-1.mail.demon.net by mailstore for mtd@imladris.demon.co.uk
          id 927209316:10:12706:10; Thu, 20 May 99 14:08:36 GMT
Message-Id: <199905181403.HAA02853@devel.ftel.com>
Date: Tue, 18 May 1999 07:03:45 -0700 (PDT)
To: David.Woodhouse@mvhi.com
Cc: Linux-MTD mailing list <mtd@imladris.demon.co.uk>
From: Mike Kilburn <mkilburn@ftel.net>
Subject: Re[2]: RFC: kernel-based PCMCIA ...
In-Reply-To: <E10kQCS-0001AQ-00@devel2.axiom.internal>
MIME-Version: 1.0
Content-Type: text/plain
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse <David.Woodhouse@mvhi.com> wrote:
> 
> My main concern at the moment is producing a standalone driver for the
> DoC2000,
> with FTL built-in to it, for embedded systems using the 2.0 kernel. As soon
> as
> I've done that, I'll be turning back to the generic subsystem design, and
> producing a DoC2000 driver for the new system.

Is there any beta code available for this. We have a PC104 with a 4M boot
flash from M-Systems. The vendor of the PC104 wont give us any hardware 
details on accessing the Flash and they say they are working with M-Systems
to have a driver in a month or so. We dont want to be dependent on them for
a driver.

> 
> As an aside - we may have patent problems with using FTL on anything other 
> than PCMCIA devices. Our position on this is as yet undecided. 
> I've suggested that perhaps the flags for each low-level device should
> include
> a PCMCIA/ NON-PCMCIA bit, and the default configuration of the FTL driver
> should refuse to work with non-PCMCIA devices. I don't really know what else
> we
> can do.

Why would a PCMICA be any different than a Flash on a PC104 cpu card?



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
