Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14cLvx-00080W-00
	for mtd-list@infradead.org; Mon, 12 Mar 2001 06:35:57 +0000
From: Subodh Nijsure <subodh@best.com>
Message-Id: <200103120634.WAA04609@shell9.ba.best.com>
Subject: Re: JFFS on a powerpc platform.
In-Reply-To: <Pine.LNX.4.30.0103111044520.13560-100000@imladris.demon.co.uk> from David Woodhouse at "Mar 11, 1 10:45:16 am"
To: dwmw2@infradead.org (David Woodhouse)
Date: Sun, 11 Mar 2001 22:34:59 -0800 (PST)
Cc: schirmer@taytron.net, mtd@infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> On Sat, 10 Mar 2001, Florian Schirmer / TayTron wrote:
> 
> > Since we changed physmap.c you have to edit cfi_endian.h and enable
> > BIG_ENDIAN instead of the preselected LE. Did you do this? Thems like
> > your problem is located there.
> 
> I just made HOST_ENDIAN the default.

Indeed correcting the cfi_endian.h fixed all the problems.

Thanks a lot David and Florian Schirmer for your patience and help,
very much appreciate it!

/Subodh Nijsure


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
