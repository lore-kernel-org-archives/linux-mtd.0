Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13lGZK-0007L4-00
	for mtd-list@infradead.org; Mon, 16 Oct 2000 21:09:10 +0100
Received: from polaris.uk.insnet.net ([194.177.174.245])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13lGZI-0007Kx-00
	for mtd@infradead.org; Mon, 16 Oct 2000 21:09:09 +0100
Received: from xanadu.vipswitch.com ([205.250.170.220])
	by polaris.uk.insnet.net (8.9.3/8.9.3) with ESMTP id VAA27087
	for <mtd@infradead.org>; Mon, 16 Oct 2000 21:10:04 +0100 (BST)
Date: Mon, 16 Oct 2000 16:05:06 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Amy Fong <jitvrlcw@umail.furryterror.org>
cc: mtd@infradead.org
Subject: Re: typo in sbc_mediagx.c
In-Reply-To: <8sfl0a$bh0$1@mokona.furryterror.org>
Message-ID: <Pine.LNX.4.10.10010161604200.19953-100000@xanadu.vipswitch.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



Fixed.

On 16 Oct 2000, Amy Fong wrote:

> afong@ifurita:~/mtd/2.2.18-test/mtd/kernel$ diff -uNr sbc_mediagx.c.orig
> sbc_mediagx.c      
> --- sbc_mediagx.c.orig  Mon Oct 16 14:57:44 2000
> +++ sbc_mediagx.c       Mon Oct 16 14:52:52 2000
> @@ -67,7 +67,7 @@
>      { name: "SBC-MediaGX flash boot partition", 
>        offset: 0, 
>        size: 640*1024 },
> -    { mame: "SBC-MediaGX flash partition 1", 
> +    { name: "SBC-MediaGX flash partition 1", 
>        offset: 640*1024, 
>        size: 2*1024*1024-640*1024 },
>      { name: "SBC-MediaGX flash partition 2", 
> 
> 



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
