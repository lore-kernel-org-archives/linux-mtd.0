Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13FHJT-0000CO-00
	for mtd-list@infradead.org; Thu, 20 Jul 2000 15:28:35 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13FHJS-0000CF-00
	for mtd@infradead.org; Thu, 20 Jul 2000 15:28:34 +0100
Date: Thu, 20 Jul 2000 15:28:31 +0100 (BST)
From: David Woodhouse <dwmw2@passion.cygnus.co.uk>
To: Studio Balbi <balbi@iol.it>
cc: mtd@infradead.org, jffs-dev@axis.com
Subject: Re: RFC about my application
In-Reply-To: <001501bff234$bae479e0$01ffa8c0@studiobalbi.it>
Message-ID: <Pine.LNX.4.21.0007201527000.23213-100000@passion.cygnus.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 20 Jul 2000, Studio Balbi wrote:

> I need to change often some bytes of information inside a big file.
> I thougth I could store this information in a separate file or as a suffix
> to the file name rather than into the file. Could this two options give me
> some advantages in term of saving flash writes or reliability? Which is the
> better?

On JFFS, I believe it'd be (slightly) more efficient to store it in the
same file. The residents of the JFFS list will know better than I.

--
dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
