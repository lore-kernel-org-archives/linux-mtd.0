Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14c3Mh-0003S7-00
	for mtd-list@infradead.org; Sun, 11 Mar 2001 10:46:19 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14c3MY-0003S1-00
	for mtd@infradead.org; Sun, 11 Mar 2001 10:46:18 +0000
Date: Sun, 11 Mar 2001 10:45:16 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Florian Schirmer / TayTron <schirmer@taytron.net>
cc: <mtd@infradead.org>,  <subodh@best.com>
Subject: Re: JFFS on a powerpc platform.
In-Reply-To: <MWMail.tjkmoqfd@host.none>
Message-ID: <Pine.LNX.4.30.0103111044520.13560-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sat, 10 Mar 2001, Florian Schirmer / TayTron wrote:

> Since we changed physmap.c you have to edit cfi_endian.h and enable
> BIG_ENDIAN instead of the preselected LE. Did you do this? Thems like
> your problem is located there.

I just made HOST_ENDIAN the default.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
