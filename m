Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141sYC-0003OI-00
	for mtd-list@infradead.org; Fri, 01 Dec 2000 15:56:40 +0000
From: "Levi Khatskevitch" <lkhatskevitch@hotmail.com>
To: dwmw2@infradead.org
Cc: linuxbios@lanl.gov, mtd@infradead.org
Subject: Re: blk_dev[93].request_fn == NULL bug is still there
Date: Fri, 01 Dec 2000 10:56:05 -0500
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <LAW-F50uA8M6XQQez1e00006398@hotmail.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 1 Dec 2000, David Woodhouse wrote:
>I thought we'd found that this was because we were initialising the MTD
>code before device_setup(). So I moved init_mtd() down a couple of lines
>in init/main.c.
>
>I'll try to reproduce this myself as soon as I get into the office.
>
>--
>dwmw2
>
>

BTW Initializing MTD before device_setup was different (actially worse), it 
caused blk_dev[xxx].plug_tq.routine == NULL, that contition is not checked 
by run_task_queue() and was causing kernel to crash.

- Levi
_____________________________________________________________________________________
Get more from the Web.  FREE MSN Explorer download : http://explorer.msn.com



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
