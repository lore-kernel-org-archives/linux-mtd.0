Received: from esteem.com ([198.65.249.253])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17hDKQ-0006WA-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 19:02:06 +0100
Message-ID: <3D628428.312055B5@esteem.com>
Date: Tue, 20 Aug 2002 11:02:16 -0700
From: Conn Clark <clark@esteem.com>
MIME-Version: 1.0
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: Re: How does one mount an existing jffs2 partition so it is  
 writeable?
References: <007201c247e0$1022fcd0$a15f040f@SNAGGLE> <3D627BC7.DD6B6823@esteem.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Conn Clark wrote:
> 
> Christopher Hoover wrote:
> >
> > Do you need to unlock your flash before you can write to it?  That's not
> > done automatically by mtd or jffs2.  There's a diff in the ARM patch
> > system by me that might be applicable.
> >
> > -ch
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> This is what I needed to know and is probably the culprit. However my unlock
> utility is broken. I can tell this because it doesn't even try to move through
> the sectors in the partition like the lock command does.
> 
> I think I have it under control now.
> 
> Thanks.
> 
>         Conn
 I meant to say move through the sectors like the erase command, however I
can see that the lock command works very similar to the unlock command. This
makes me suspect that I have something wrong in the kernel code.

here is what I have.

I am running on a MPC850 PowerPC processor.
I am using a single intel TE28F320C3BA110 flash chip mapped as a 16 bit device. 
I am using kernel 2.4.19 from kernel.org with the shared zlib patch.

I had to change 2 lines in cfi_cmdset_0001.c from

        extp->FeatureSupport = cfi32_to_cpu(extp->FeatureSupport);
        extp->BlkStatusRegMask = cfi32_to_cpu(extp->BlkStatusRegMask);

to

        extp->FeatureSupport = le32_to_cpu(extp->FeatureSupport);
        extp->BlkStatusRegMask = le16_to_cpu(extp->BlkStatusRegMask);

in order to fix an endian issue.

I had to create a custom map driver as well.

Any ideas on what else I have to change to get the lock/unlock commands to work?

Thanks in advance,
        Conn
-- 

*****************************************************************
  If you live at home long enough, your parents will move out.
 (Warning they may try to sell their house out from under you.)
*****************************************************************

Conn Clark
Engineering Stooge				clark@esteem.com
Electronic Systems Technology Inc.		www.esteem.com

Stock Ticker Symbol				ELST

"clark@esteem.com" Copyright 2000 By Electronic Systems Technology
 This email address may be used to communicate to Conn Clark
 provided it is not being used for advertisement purposes, unless
 prior written consent is given. This email address may not be 
 sold under any circumstances. All other rights reserved.
