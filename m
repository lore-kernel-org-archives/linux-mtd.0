Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12YQkM-0007Df-00
	for mtd-list@infradead.org; Fri, 24 Mar 2000 09:51:14 +0000
Received: from colo.asti-usa.com ([205.252.89.99] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12YQkH-0007DZ-00
	for mtd@infradead.org; Fri, 24 Mar 2000 09:51:09 +0000
Received: from zentropix.com ([195.166.67.91])
	by colo.asti-usa.com (8.9.3/8.9.3) with ESMTP id EAA26976
	for <mtd@infradead.org>; Fri, 24 Mar 2000 04:57:09 -0500
Message-ID: <38DB3B0E.FCA11C16@zentropix.com>
Date: Fri, 24 Mar 2000 09:53:18 +0000
From: Trevor Woolven <trevw@zentropix.com>
MIME-Version: 1.0
To: MTD <mtd@infradead.org>
Subject: [Fwd: MTD with 2.2.14 kernel]
Content-Type: multipart/mixed; boundary="------------A17C25327113AD969D284C74"
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.
--------------A17C25327113AD969D284C74
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Sorry, forgot to CC....
-- 
Trevor Woolven - Director of Customer Applications Engineering
Zentropix Inc - a Lineo company

Tel: +44 (0)1273 234 647	 Fax: +44 (0)1273 704 482

Visit http://www.zentropix.com/ for Real Time Linux Tools
Visit http://www.realtimelinux.org/ for Real Time Linux Information
--------------A17C25327113AD969D284C74
Content-Type: message/rfc822
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Message-ID: <38DB3AB3.1B4DD810@zentropix.com>
Date: Fri, 24 Mar 2000 09:51:47 +0000
From: Trevor Woolven <trevw@zentropix.com>
Organization: Zentropix
X-Mailer: Mozilla 4.07 [en] (X11; I; Linux 2.2.13 i586)
MIME-Version: 1.0
To: Dvir Oren <dviro@lucidvon.com>
Subject: Re: MTD with 2.2.14 kernel
References: <200003232029.PAA22771@colo.asti-usa.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Dvir Oren wrote:
> 
> > I don't need to use nftl_format in order to be able to write to the
> > flash using the MTD drivers. I have managed to write successfully to a
> > DOC having formated it using the M-Systems utilities, dformat and
> 
> I tried your patches for the kernel and they worked!  Thank you.  I
> don't understand, though, why didn't my patches work.  They are
> very similar.  Perhaps I initialized MTD too late, or something like
> that.  Maybe I'll look into it.
> 
> However, whenever I try to write to the flash without nftl_formating it
> first, I get errors.  And I still wasn't able to boot from the flash.
> LILO starts loading, but gets stuck either at LI or LIL-.  Oh well.  I
> don't understand why it works for you, but doesn't for me.  I also
> keep getting file system corruption.
> 
> Thanks for the help.
> 
> ---------
> Dvir Oren <dviro@lucidvon.com>
> Lucid VON Ltd.     <http://www.lucidvon.com>
> 9 Saloniki St.,        Tel-Aviv       Israel
> Tel:  +972 3 644 3038  Fax:  +972 3 644 3039
Glad to be of assistance. I owe you for your patched lilo, especially as
I was able to reproduce a working LILO executable from source using the
patch, something M-Systems have gone very quiet on!

I tried initialising the MTD drivers via blk_dev_init() (ll_rw_blk.c) by
taking code out of init/main.c and putting it verbatim at the end of the
function, blk_dev_init(). This seemed most logical to me as the driver
initialisation was then controlled in the same way as (I thought) all
other devices - from device_setup(). However, although I could see the
functions being called, the driver no longer worked! I want to find out
why but I have a customer to satisfy who's not bothered about the
details. Once I've finished this work, I'll be working on proper kernel
patches for the MTD stuff for Dave so I'll try to figure it out then.

I can't understand why your patched LILO doesn't work either, it works
fine for me! As you're also getting file system corruption, why don't
you try using a new device, if you have one. I've found that once a DOC
goes bad, you just can't trust it at all but good ones are good all the
time.

My dev system has a hard drive and a DOC and I usually migrate from
fully hdd to fully DOC in stages. Can you use your patched LILO to boot
a kernel from the HDD, mounting an HDD partition as your root fs? If you
can, can you use the same lilo and kernel but mount a DOC partition as
root?
Did you do an 'rdev' before running lilo to set-up the DOC for booting?

Just a few immediate thoughts, you never know one of them might spark a
flash of inspiration (forgive the pun!).

Cheers

Trevor.
-- 
Trevor Woolven - Director of Customer Applications Engineering
Zentropix Inc - a Lineo company

Tel: +44 (0)1273 234 647	 Fax: +44 (0)1273 704 482

Visit http://www.zentropix.com/ for Real Time Linux Tools
Visit http://www.realtimelinux.org/ for Real Time Linux Information

--------------A17C25327113AD969D284C74--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
