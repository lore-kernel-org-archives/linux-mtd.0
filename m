Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SL0c-0003TU-00
	for mtd-list@infradead.org; Mon, 12 Feb 2001 15:35:22 +0000
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14SL0b-0003TK-00
	for mtd@infradead.org; Mon, 12 Feb 2001 15:35:21 +0000
Message-ID: <3A8808D7.427B34CB@danielind.com>
Date: Mon, 12 Feb 2001 10:01:28 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: Der Herr Hofrat <der.herr@hofr.at>
CC: mtd@infradead.org
Subject: Re: inter_module borken in 2.2.18 ?
References: <200102111803.f1BI3t616320@kanga.hofr.at>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I had the same problems with the 2.2 series of kernels. Modules DO NOT WORK (at
least did not for me).
I also could not find a intermodule patch for the 2.2.18 kernel.

I just moved on to 2.4.1 where things seems to compile ok (as modules- which is
what I wanted to do while
I was testing stuff).

There was one other issue:
in nftl.c (ver 1.66) line 624, there seems to be a typo. The define
MTD_DEBUG_LEVEL_1 should really be MTD_DEBUG_LEVEL1

When I made the change in my local copy of the file, it compiled ok (and seems
to work).

There were some other issues that I encountered while testing (with DOC2000),
that I'll detail in a later e-mail.

***
David Woodhouse,

I'm working with Both CFI raw flash (with jffs) and DOC2000 (w/ ext2 and if
possible jffs). Is someone writing
a HOWTO? I am willing to start one (with a FAQ) (and maintain it for a while)
if you guys will put it on the site (and/or CVS).

Vipin Malik

Sr. Design Engr.
Daniel Industries
Houston, TX.




Der Herr Hofrat wrote:

> Hi !
>
>  looks to me like inter_module is borken in 2.2.18 in include/linux/list.h .
>  anybody have it working with 2.2.18 ?
>
> hofrat
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
