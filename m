Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14hsiT-0000o1-00
	for mtd-list@infradead.org; Tue, 27 Mar 2001 13:36:53 +0100
From: "Alex Lennon" <ajlennon@arcom.co.uk>
To: <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: RE: SBC-MediaGX map driver implementation (was 'CFI Devices in x8 mode')
Date: Tue, 27 Mar 2001 13:36:02 +0100
Message-ID: <NEBBKJHOALKOLCFPGELEAEGMCIAA.ajlennon@arcom.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <NEBBKJHOALKOLCFPGELEAEGGCIAA.ajlennon@arcom.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


>>The issue now is that as soon as I access an MTD device (say 'cat
>>/dev/mtd0') my system locks. I have an access LED on the flash
>>which isn't pulsing so I don't think I'm getting as far as actually
talking
>>to the flash over the ISA bus.

>>At the moment I can see I'm OK up to MTD_READ - cfi_intelext_read() ?
>>- and I'll continue tracing through.

I've been using a standard 2.4.2 kernel from ftp.kernel.org.
I made miminal changes - experimental code, processor type to 586,
ran MTD patch script and setup MTD/JFFS as per HOW-TO

This meant the initial kernel was SMP enabled. I traced through to
cfi_cmdset_0001::do_read_onechip() and the kernel is locking at
the first call to spin_lock_bh(chip->mutex).

This call seems a little strange as chip->mutex is implemented
as a pointer to the _spinlock mutex (flashchip.h)

Also there seem to be two wrapper functions, cfi_spin_lock() and
cfi_spin_unlock() which *do* take a pointer to a spinlock_t. (?)

Anyway - I recompiled the kernel without SMP and read access to
/dev/mtd0 works just fine.

I can't imagine an embedded environment requiring SMP (!) but I
mention it just in case there is any concern over the spin locks.

Alex





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
