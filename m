Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13OFng-0000Ke-00
	for mtd-list@infradead.org; Mon, 14 Aug 2000 09:40:52 +0100
Received: from polaris.uk.insnet.net ([194.177.174.245])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13OFnb-0000KY-00
	for mtd@infradead.org; Mon, 14 Aug 2000 09:40:51 +0100
Received: from whiskey.fireplug.net (cr355197-a.poco1.bc.wave.home.com [24.112.113.88])
	by polaris.uk.insnet.net (8.9.3/8.9.3) with ESMTP id JAA03112
	for <mtd@infradead.org>; Mon, 14 Aug 2000 09:01:22 +0100 (BST)
Received: from sl by whiskey.fireplug.net with local (Exim 3.13 #2)
	id 13OFCM-0000Gk-00
	for mtd@infradead.org; Mon, 14 Aug 2000 01:02:18 -0700
To: mtd@infradead.org
From: sl@whiskey.fireplug.net (Stuart Lynne)
Subject: Re: Re[2]: Has MTD production quality support for DOC2000?
Date: 14 Aug 2000 01:02:18 -0700
Message-ID: <8n892a$10c$1@whiskey.fireplug.net>
References: <200008102356.QAA02347@devel.ftel.com>
Reply-To: sl@fireplug.net
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

In article <200008102356.QAA02347@devel.ftel.com>,
Mike Kilburn <mkilburn@ftel.net> wrote:
>David Woodhouse <dwmw2@redhat.com> wrote:
>> 
>> Linking the M-Systems drivers into your kernel will place _you_ in violation
>> of the GPL and you may be sued, so why not help out with the MTD drivers?
>> 
>
>Also, last I checked, the M-Systems driver disables interrupts for quite
>a long time while writing to the device. This makes it unusable in
>a real-time embedded system. Switch to a SanDisk if you can.

The new driver addresses this issue. It is not actually the driver that 
disables interrupts, the block layer does it before calling the device
request function. And in some cases the driver can take some time writing
due to erasing. The new driver will do a schedule_timeout() instead of
busy waiting.

-- 
                                            __O 
Fireplug - a Lineo company                _-\<,_ 
PGP Fingerprint: 28 E2 A0 15 99 62 9A 00 (_)/ (_) 88 EC A3 EE 2D 1C 15 68
Stuart Lynne <sl@fireplug.net>       www.fireplug.net        604-461-7532


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
