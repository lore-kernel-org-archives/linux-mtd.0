Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13GrrA-0006O9-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 00:41:56 +0100
Received: from cr355197-a.poco1.bc.wave.home.com ([24.112.113.88] helo=whiskey.fireplug.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13Grr9-0006O3-00
	for mtd@infradead.org; Tue, 25 Jul 2000 00:41:55 +0100
Received: from sl by whiskey.fireplug.net with local (Exim 3.13 #2)
	id 13Grr6-0003RX-00
	for mtd@infradead.org; Mon, 24 Jul 2000 16:41:52 -0700
To: mtd@infradead.org
From: sl@whiskey.fireplug.net (Stuart Lynne)
Subject: Re: building M-Sys DOC driver as a module
Date: 24 Jul 2000 16:41:52 -0700
Message-ID: <8lik80$ctk$1@whiskey.fireplug.net>
References: <39781EAE.58A56DA3@zentropix.com>
Reply-To: sl@fireplug.net
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

In article <39781EAE.58A56DA3@zentropix.com>,
Trevor Woolven <trevw@zentropix.com> wrote:
>This is a multi-part message in MIME format.
>--------------37FCF4E0556161DE8012872E
>Content-Type: text/plain; charset=us-ascii
>Content-Transfer-Encoding: 7bit
>
>David Woodhouse wrote:
>
>> On Thu, 20 Jul 2000, Adi Linden wrote:
>>
>> > I'd be quite interested in the modular DOC driver as well. So far I've
>> > seen it talked about quite a bit but never seen it.
>> >
>> > I produces a 2.2.14 kernel patch for the M-Systems DOC driver but that's
>> > in violation of GPL for a production environment...
>>
>> Modular drivers and initrd are a horrible waste of space in an embedded
>> system, IMO. Far better to cut out module support completely, and even
>> also block device support, putting JFFS on the DiskOnChip instead of NFTL.
>
>Ok, IMHO using an initrd doesn't actually cost you too much, the bulk of it
>is used to store the kernel which has to go somewhere, right? I haven't done

The kernel is separate from the initrd file.

The overhead per module for loading it as a module instead of compiling it
in to the kernel is roughly about 2kb.

The initrd file must contain enough to load the module. In theory this means
a statically linked shell, statically linked insmod, a short script and your
modules. Gzipped this ends up around a coupld hundred kb.

It may be possible to used a stripped down busy box that knows enough 
to do this. 

>a comparison on the relative sizes of a kernel with the driver compiled in vs
>
>one without to measure what the difference is but that would be quite a
>simple
>thing to do - especially if space was getting tight. I agree that there's a
>bit of
>a waste having a DOS partition on the DOC to boot syslinux from but neither
>LILO nor GRUB are perfect either.
>
>I agree that getting JFFS on DOC is a good thing but when will it happen?
>I don't see the M-Systems driver being the driver of choice in the long run,
>most people would much rather use a GPL one and that's where MTD wins big
>time!

You also have to support booting from it..... If/when grub can be coaxed into
doing that reliably then it starts to sound interesting.

-- 
                                            __O 
Fireplug - a Lineo company                _-\<,_ 
PGP Fingerprint: 28 E2 A0 15 99 62 9A 00 (_)/ (_) 88 EC A3 EE 2D 1C 15 68
Stuart Lynne <sl@fireplug.net>       www.fireplug.net        604-461-7532


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
