Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141Xy6-0007ic-00
	for mtd-list@infradead.org; Thu, 30 Nov 2000 17:58:02 +0000
From: "Levi Khatskevitch" <lkhatskevitch@hotmail.com>
To: dwmw2@infradead.org
Cc: linuxbios@lanl.gov, mtd@infradead.org
Subject: Re: init_doc2001 and init_doc2000 are hidden from init_mtd
Date: Thu, 30 Nov 2000 12:57:24 -0500
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <LAW-F59F8HGmCvoXM7e00005533@hotmail.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>Fixed. As is the increasingly negative use count.
>
>--
>dwmw2
>
>

David,

I've just tested the new code, the doc2001 use count still gets increasingly 
negative on each access to /dev/mtd0. Like:

dd if=/dev/mtd0 count=1 of=/dev/null

on all other instances (mount, etc...) it works fine now.
- Levi
_____________________________________________________________________________________
Get more from the Web.  FREE MSN Explorer download : http://explorer.msn.com



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
