Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13UAv2-0006tM-00
	for mtd-list@infradead.org; Wed, 30 Aug 2000 17:40:56 +0100
Received: from passion.cygnus.co.uk ([194.130.39.73] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13UAv1-0006tG-00
	for mtd@infradead.org; Wed, 30 Aug 2000 17:40:55 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <30881.967653096@passion.cygnus.co.uk> 
References: <30881.967653096@passion.cygnus.co.uk>  <16105.967648027@passion.cygnus.co.uk> <1512880772E@mamao.cetuc.puc-rio.br> <20000828185018.A2777@localhost> 
Cc: miguel@cetuc.puc-rio.br, Ciro Cattuto <ciro@prosa.it>, mtd@infradead.org
Subject: Re: GRUB on DOC: 2Mb issues 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 30 Aug 2000 17:39:57 +0100
Message-ID: <1253.967653597@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dwmw2@infradead.org said:
> I've hacked it up. It doesn't yet work but I'm going home. I've
> committed  the changes to makecsum.c, and that should now work on both
> types of device  - it definitely works on the 512-byte-page devices.

> The actual Grub loader code doesn't yet work so I haven't yet
> committed it.  It's horribly ugly too. Patch below. 

Actually, the RH7 beta had munged my clock and it was a lot earlier than I 
thought it was, so I didn't go home.

I've just committed an attempt at fixing this. I haven't tested it, so I 
don't know that it doesn't work, and I'm happy to commit it :)

This time I really am leaving.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
