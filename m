Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13GrwB-0006PD-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 00:47:07 +0100
Received: from cr355197-a.poco1.bc.wave.home.com ([24.112.113.88] helo=whiskey.fireplug.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13GrwA-0006P7-00
	for mtd@infradead.org; Tue, 25 Jul 2000 00:47:06 +0100
Received: from sl by whiskey.fireplug.net with local (Exim 3.13 #2)
	id 13Grw7-0003U4-00
	for mtd@infradead.org; Mon, 24 Jul 2000 16:47:03 -0700
To: mtd@infradead.org
From: sl@whiskey.fireplug.net (Stuart Lynne)
Subject: Re: ELANSC400
Date: 24 Jul 2000 16:47:03 -0700
Message-ID: <8likhn$d2h$1@whiskey.fireplug.net>
References: <005001bff32c$b59a92a0$8e00a8c0@gpc>
Reply-To: sl@fireplug.net
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

In article <005001bff32c$b59a92a0$8e00a8c0@gpc>,
Gregory Schallert <gschallert@dawning.com> wrote:
>Well,  Here's a new guy to the crowd.
>
>I've Just started playing with the MTD drivers for linux and I have a couple
>of questions.
>I am currently working on a project that (will) store the linux kernel/os on
>flash.  We are useing the ElanSC400 chip and a board that has 3 pairs of
>AM29F016EC Flash Chips arranged such that the high byte of the data goes to
>one chip and the low byte goes to the other.  I was wondering if the MTD
>supports this?  These chips are JEDEC compatiable.
>
>Also I wrote a test program that run in user space and I tried using mmap()
>to read the device and it seems to work OK as long as I map /dev/mem as
>MAP_PRIVATE.  I would like to be able to write to Memory < 1M directly.  If
>I change the flage to MAP_SHARED, mmap() falied with "Permision denied"  Any
>ideas?

The flash parts on the SC400 are mapped through the SC400 MMU. There are 
several models, but the easiest is to map them 8kb at a time into a memory
window in low memory (0xc8000 if I remember correctly).

Once there you can access them as normal flash memory. 

-- 
                                            __O 
Fireplug - a Lineo company                _-\<,_ 
PGP Fingerprint: 28 E2 A0 15 99 62 9A 00 (_)/ (_) 88 EC A3 EE 2D 1C 15 68
Stuart Lynne <sl@fireplug.net>       www.fireplug.net        604-461-7532


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
