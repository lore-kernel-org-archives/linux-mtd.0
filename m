Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 148JBG-0000Km-00
	for mtd-list@infradead.org; Tue, 19 Dec 2000 09:35:34 +0000
From: Shane Nay <shane@agendacomputing.com>
Reply-To: shane@agendacomputing.com
To: David Woodhouse <dwmw2@infradead.org>, shane@agendacomputing.com
Subject: Re: MTD, generic physmap memory, MTD_BLOCK
Date: Mon, 18 Dec 2000 22:35:40 +0000
Content-Type: text/plain;
  charset="us-ascii"
Cc: Nicolas Pitre <nico@cam.org>, mstumpf@pobox.com, mtd@infradead.org
References: <0012182131432A.11759@www.easysolutions.net> <Pine.LNX.4.30.0012172223230.15911-100000@imladris.demon.co.uk> <29168.977217858@redhat.com>
In-Reply-To: <29168.977217858@redhat.com>
MIME-Version: 1.0
Message-Id: <0012182235402K.11759@www.easysolutions.net>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


> I was looking at doing it in romfs. You can't have compression anyway, for
> obvious reasons, and it looked a little easier. But I suppose that wouldn't
> allow you to mix XIP-able and compressed files in the same fs.

We *should* have it done this week in romfs.  That's our testbed for the 
first implementation.  I'm going on vacation on Wednesday, but if it's done 
before that I'll point folks to patches on this list.  If not I should have 
them for the next Thursday..., bug me if I don't send it out by then.

Thanks,
Shane.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
