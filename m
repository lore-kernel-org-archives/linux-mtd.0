Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13mHfV-00073k-00
	for mtd-list@infradead.org; Thu, 19 Oct 2000 16:31:45 +0100
Received: from tele2-gw.tao-group.com
	([212.19.67.123] helo=gate.tao-group.com ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13mHdF-00073E-00
	for mtd@infradead.org; Thu, 19 Oct 2000 16:31:44 +0100
Received: from pearl.tao.co.uk (pearl.tao.co.uk [172.16.100.66])
	by gate.tao-group.com (8.9.3/8.9.3) with ESMTP id QAA28556
	for <mtd@infradead.org>; Thu, 19 Oct 2000 16:28:06 +0100
To: mtd@infradead.org
From: "David Given" <dg@tao-group.com>
Subject: Re: cfi_cmdset_0001 unaligned write problems.
In-reply-to: Your message of "Thu, 19 Oct 2000 10:30:04 EDT."
             <Pine.LNX.4.10.10010191023540.29348-100000@xanadu.vipswitch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 19 Oct 2000 16:26:45 +0100
Message-Id: <E13mHag-0001N5-00@pearl.tao.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

[...]
>However I suspect that there might be an issue with __u16 promoted to
>__u32 then back to __u16 on big endian CPUs.  What is the expected
>behavior?
>
>On LE, 0x1234 becomes 0x00001234 the back to 0x1234 which is fine...

Ditto on BE. Endianness only matters when you are reading and writing non-quad 
values to memory. The internal representations are identical.


-- 
David Given
dg@tao-group.com




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
