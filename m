Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13FfCY-0004P0-00
	for mtd-list@infradead.org; Fri, 21 Jul 2000 16:59:02 +0100
Received: from dawnmail.dawning.com ([24.93.23.251])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13FfCX-0004Ou-00
	for mtd@infradead.org; Fri, 21 Jul 2000 16:59:01 +0100
Received: from [192.168.0.142] by dawnmail.dawning.com (NTMail 4.30.0010/NY3896.00.832c5e1f) with ESMTP id xzeeaaaa for <mtd@infradead.org>; Fri, 21 Jul 2000 11:59:02 -0400
Message-ID: <005001bff32c$b59a92a0$8e00a8c0@gpc>
From: "Gregory Schallert" <gschallert@dawning.com>
To: <mtd@infradead.org>
References: <Pine.LNX.4.21.0007211646360.22633-100000@alpha1.cygnus.co.uk>
Subject: ELANSC400
Date: Fri, 21 Jul 2000 11:59:54 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Well,  Here's a new guy to the crowd.

I've Just started playing with the MTD drivers for linux and I have a couple
of questions.
I am currently working on a project that (will) store the linux kernel/os on
flash.  We are useing the ElanSC400 chip and a board that has 3 pairs of
AM29F016EC Flash Chips arranged such that the high byte of the data goes to
one chip and the low byte goes to the other.  I was wondering if the MTD
supports this?  These chips are JEDEC compatiable.

Also I wrote a test program that run in user space and I tried using mmap()
to read the device and it seems to work OK as long as I map /dev/mem as
MAP_PRIVATE.  I would like to be able to write to Memory < 1M directly.  If
I change the flage to MAP_SHARED, mmap() falied with "Permision denied"  Any
ideas?

Greg Schallert
Dawning Technoligies Inc



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
