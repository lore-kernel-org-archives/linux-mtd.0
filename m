Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14bjvO-0006l3-00
	for mtd-list@infradead.org; Sat, 10 Mar 2001 14:00:50 +0000
Received: from [212.87.56.100] (helo=mail.taytron.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14bjvN-0006kx-00
	for mtd@infradead.org; Sat, 10 Mar 2001 14:00:49 +0000
From: Florian Schirmer / TayTron <schirmer@taytron.net>
Subject: Re: JFFS on a powerpc platform.
To: mtd@infradead.org,subodh@best.com
Date: Sat, 10 Mar 2001 14:00:10 GMT
Message-ID: <MWMail.tjkmoqfd@host.none>
Reply-To: schirmer@taytron.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi!

>I still have that problem now its slightly different problem. 
>It looks like problem with 'interleaving' 

Since we changed physmap.c you have to edit cfi_endian.h and enable BIG_ENDIAN instead of the preselected LE. Did you do this? Thems like your problem is located there.

Hope that help,
    Florian Schirmer



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
