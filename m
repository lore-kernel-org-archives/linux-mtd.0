Return-path: <David.Woodhouse@mvhi.com>
Received: from localhost ([127.0.0.1] ident=root)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 10hWSG-0000s9-00
	for mtd@imladris.demon.co.uk; Wed, 12 May 1999 11:41:36 +0100
Received: from pop3.mail.demon.net
	by localhost with POP3 (fetchmail-5.0.0)
	for mtd@imladris.demon.co.uk (multi-drop); Wed, 12 May 1999 11:41:36 +0100 (BST)
Received: from punt-2.mail.demon.net by mailstore for mtd@imladris.demon.co.uk
          id 926505642:20:07352:10; Wed, 12 May 99 10:40:42 GMT
To: Alexander Larsson <alex@signum.se>
Cc: mtd@imladris.demon.co.uk
Subject: Re: ANNOUNCE: Mailing list for memory technology devices. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 12 May 1999 11:40:01 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E10hWQj-000196-00@devel2.axiom.internal>
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>


alex@signum.se said:
>  I've done this too. Check out ftp://ftp.signum.se/pub/alex/flash.diff
> I did it for an embedded ppc 8xx port, but it's platform independent.
> Contains a generic flash layer and specific support for AMD Flash
> chips. It also has FTL support. 

Your code looks similar to mine in many respects, but is more likely to be
usable with the PCMCIA code. David Hinds has confirmed that he's willing to
allow memory handling stuff to be removed from the PCMCIA suite and placed into
the kernel, as long as the required functionality is present.

At first sight, it seems that the only thing my version has that isn't present 
in your code is the 'physmem' device, so I'll port that to your system, and 
then we can ditch my code, and concentrate on making your Common Flash 
Interface work happily with the PCMCIA code, before submitting an initial 
version to Linus for his newly-released 2.3 series.

Is it OK if I put your diff up for FTP next to my stuff, and use it as the 
basis for the CVS repository that I was intending to set up?


----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
