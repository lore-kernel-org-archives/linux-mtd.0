Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11ztzC-0006Ey-00
	for mtd-list@infradead.org; Mon, 20 Dec 1999 03:59:50 +0000
Received: from cr355197-a.poco1.bc.wave.home.com ([24.112.113.88] helo=nero.fireplug.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11ztzA-0006Es-00
	for mtd@infradead.org; Mon, 20 Dec 1999 03:59:48 +0000
Received: from news by nero.fireplug.net with local (Exim 2.04 #4)
	id 11zu2O-000226-00
	for mtd@infradead.org; Sun, 19 Dec 1999 20:03:08 -0800
To: mtd@infradead.org
From: sl@gateway.fireplug.net (Stuart Lynne)
Subject: Re: [Fwd: power down]
Date: 20 Dec 1999 04:03:08 GMT
Message-ID: <83k9ps$7k9$1@nero.fireplug.net>
References: <384D2C2D.6A6F4CE6@go2fax.com>
Reply-To: sl@fireplug.net
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

In article <384D2C2D.6A6F4CE6@go2fax.com>, Bob Canup <rcanup@go2fax.com> wrote:
>Vipin Malik wrote:
>
>> Bob Canup wrote:
>> >
>
>I don't think that you understand what we're trying to tell you. There is a
>difference in philosophy.
>
>If you are running a flash as a normal read - write imitation of a disk there
>are severe time limitations as to how long the flash is going to work because
>of the limit on write cycles which flash technology has. As has been pointed
>out in an earlier post - one write a second will ruin a flash chip in a few
>weeks - which is not a very long for an embedded system to work.

Assuming load levelling across a 4mb flash drive, if you average 4kb per
write and write once per second continously you will write each sector a 
about 40 times per day. 

AMD specs a minimum program/erase cycles of 100,000 per sector (flash
sector) and 1,000,000 per device. To reach 100,000 writes at 50 per day
would take over 5 years.

>Because of this limitation most of the people in this group who do design
>with flash use it in a Write Rarely Read Mostly manner. The only time the
>flash is written to is when there is a firmware upgrade. This is also the
>manner in which flash chips are used on conventional PC motherboards - if you
>lose power during a firmware upgrade - you are in trouble - nor do I see any
>practical method of handling that problem.

Well if you have control over your design simply ensure that you have two
banks and can boot from either of them. Upgrading involves booting from
one to upgrade the other and then selecting the new bank as the default
boot.


-- 
Stuart Lynne <sl@fireplug.net>                __O 
<http://www.thinlinux.org>                  _-\<,_               604-461-7532
PGP Fingerprint: 28 E2 A0 15 99 62 9A 00   (_)/ (_)   88 EC A3 EE 2D 1C 15 68


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
