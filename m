Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 125mQE-0004oh-00
	for mtd-list@infradead.org; Wed, 05 Jan 2000 09:08:02 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 125mQD-0004oZ-00
	for mtd@infradead.org; Wed, 05 Jan 2000 09:08:01 +0000
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 3.03 #1)
	id 125mWY-0007VJ-00
	for mtd@infradead.org; Wed, 05 Jan 2000 09:14:34 +0000
Received: from dwmw2 by devel2.axiom.internal with local (Exim 1.90 #1)
	for mtd@infradead.org
	id 125mWX-0001Gh-00; Wed, 5 Jan 2000 09:14:33 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <38726ECE.D3E3AAEE@ctam.com.au> 
References: <38726ECE.D3E3AAEE@ctam.com.au>  <38719CC6.93FB5729@ctam.com.au> <E125Qft-0007VY-00@devel2.axiom.internal> 
To: Brendan.Simon@ctam.com.au
Subject: Re: DiskOnChip for PowerPC embedded system. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 05 Jan 2000 09:09:35 +0000
Message-Id: <E125mWX-0001Gh-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


Brendan.Simon@ctam.com.au said:
> I can currently run a linux kernel out of a linear flash SIMM.  If
> this kernel has the DOC drivers compiled in then I should be able to
> use the DOC without having to touch the firmware.  Is this correct ?

Correct.

> I would have to write the low-end driver for the DOC I assume.

If it's not memory-mapped you'd have to write some code. If it's memory
-mapped, my existing code should work fine.


Brendan.Simon@ctam.com.au said:
> I thought they were working ? 

M-Systems released code for Intel systems which is working. They may recompile 
it for PPC if you ask nicely. They may also let you have their code to 
recompile it yourself, if you sign a strict NDA. 

My code is working, but it's not 100% reliable yet - it doesn't deal with bad 
blocks on the flash, and there are other reports of strange behaviour where it 
leaves the media in a state which the 'official' driver can't recognise.

I haven't been able to reproduce any of these problems recently, which is why 
it's not been fixed yet.

> Is it useable for a production system ?

If you use M-Systems' code in a production system (i.e. something you 
distribute) you mustn't compile it into your kernel - that would violate the 
GPL.

My code isn't ready for production use. It's fine in read-only mode, but still 
sometimes gets confused when it's allowed to write to the device.

> What else needs to be done ? 

Mostly bugfixes and cleaning up. I'm going to be snowed under till around 
March now, but after that I'll have lots of time to finish this off. But if 
you're willing to sign an NDA, I can provide you with some specs for the 
DiskOnChip and NFTL, so that you can help out with the development.

> I'm using kernel 2.2.5 at the moment.  Is this OK ?

That's fine. I started developing on 2.2, then ported to 2.3. Currently, it 
should compile with either. I'm intending to backport to 2.0 as soon as it's 
ready, too.


Brendan.Simon@ctam.com.au said:
> I guess I could write some simple boot code that could read ext2
> filesystem and load the kernel into memory from the DOC, then boot the
> kernel.  I'm not sure how much work is involved in that though.

Grub is fairly much like that. I don't know how much is written in i386 asm, 
or how easy it'd be to port it. It reads ext2 and sets up the kernel for boot. 
It should be fairly easy to add DiskOnChip and NFTL read-only support.

> M-Systems have on OS Adaption Kit which has ANSI source for the
> TrueFFS, FAT FS, etc.  This may be worth considering but I imagine it
> might be expensive, but I guess there is no harm in enquiring.

Under a very strict NDA. For a bootloader that's not as much of a problem as 
it is for the kernel driver, but it would still be useful to be able to 
release the bootloader code. If you base it on the OSAK, you can't.


> When you say the "firmware is _only_ required for booting the kernel",
> I take it you mean only required when boot a kernel that is actually
> stored on the DOC itself. 

Sorry, yes - only required if you need to boot a kernel from the device.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
