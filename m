Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141kCf-0001zP-00
	for mtd-list@infradead.org; Fri, 01 Dec 2000 07:01:53 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 141kCd-0001zJ-00
	for mtd@infradead.org; Fri, 01 Dec 2000 07:01:51 +0000
Date: Fri, 1 Dec 2000 07:01:26 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Levi Khatskevitch <lkhatskevitch@hotmail.com>
cc: <linuxbios@lanl.gov>,  <mtd@infradead.org>
Subject: Re: blk_dev[93].request_fn == NULL bug is still there
In-Reply-To: <LAW-F91NtDEJmGzrLCC00005522@hotmail.com>
Message-ID: <Pine.LNX.4.30.0012010659220.20779-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 30 Nov 2000, Levi Khatskevitch wrote:

> Ok, I was wrong I used the old vmlinux file :-). Module use count is correct
> now.

Hehe. I did _exactly_ the same thing :)

> Now I've just reproduced the blk_dev[93].request_fn == NULL bug in the
> latest code. Here is how:

I thought we'd found that this was because we were initialising the MTD
code before device_setup(). So I moved init_mtd() down a couple of lines
in init/main.c.

I'll try to reproduce this myself as soon as I get into the office.


-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
