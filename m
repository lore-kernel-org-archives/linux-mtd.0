Received: from tim.rpsys.net ([194.106.48.114])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CSkJR-0004Bm-Pb
	for linux-mtd@lists.infradead.org; Fri, 12 Nov 2004 17:54:39 -0500
Message-ID: <027101c4c90a$94b592c0$0f01a8c0@max>
From: "Richard Purdie" <rpurdie@rpsys.net>
To: <linux-mtd@lists.infradead.org>
References: <010b01c4c8de$82cc2b90$0f01a8c0@max> <1100297828l.6627l.0l@hydra>
Date: Fri, 12 Nov 2004 22:54:29 -0000
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=response
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: Sharp SL Series NAND Driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

John Lenz:
> In the suspend and resume functions, you still have some prinks... those 
> should be removed.  And does there need to be any code in resume?

They're leftovers from the sharp driver. Knowing Sharp, they probably wake 
up the screen or something but I'll remove them.

> This patch is very similar to the patch in my tree, except you also 
> provide the scan_bbt function.

This sorts out the POSTBADBLOCK problem by adding an extra badblock marker
in oob position 4 as the sharp driver does.

> I just got poodle to boot up correctly with my patch.  The problem all
> along was that I was passing the wrong root= option to the kernel! Passing 
> the correct root device, and poodle boots up fine.  I can log in and run a 
> few commands.  Note, this is with my patch but it should work
> with yours as well since they are so similar.  Secondly, I have it working 
> without any of the other patches you posted...

We've both got their via different routes. Mine's caught some things, yours 
others but I guess the main thing is we've got there! :). I just continued 
on with mine as I hadn't heard anything from you...

>> http://www.rpsys.net/openzaurus/mtd/rp-mtd-sharpsl-map.patch - maps a ROM 
>> on
>> the device (I think its used to access configuration information?).
>
> Do we actually need this patch?  Perhaps we should hold off including it 
> until we have a program that needs to access this stuff.

I'm not sure if we need it or not. My view was it kept the device numbers
consistent and as its rather simple, I didn't see a problem with including
it. I can be persuaded otherwise...

>>  http://www.rpsys.net/openzaurus/mtd/rp-mtd-sharpsl-extra.patch - This is
>
> I notice in this patch you have CONFIG_MACH_HUSKY used... do we need to 
> add  CONFIG_MACH_POODLE?  Is this something that poodle would have as 
> well?  It  seems to be working here without this change... although I 
> haven't tested  it a lot yet.

There is a problem and I suspect its HUSKY and maybe tosa specific (as they
have the large 128MB flash chips). The rootfs is large so it causes the
eraseblock size to become too large and malloc can't cope. The kernel's
solution - increase the eraseblock size by combing blocks. Sharp decided to
use a different memory allocator which could cope with the increased size 
instead. The two methods are incompatible. The machines that will need this 
are ones which have filesystems that force a change in eraseblock size and 
are too big for malloc. In the sharp driver this ifdef was for all the SL 
series so we could probably change it to an ifdef MTD_NAND_SHARPSL safely. 
Using dma may give a slight performance increase? I'm open to discussing 
ways forward but if necessary we'll just have to keep that patch separate.

I've just realised I left in the line that kills the RTIME compressor. I 
think Sharp's performance calculations must have suggested it was beneficial 
to do so but I'm not expecting that to go into the mtd-cvs!

-- 
RP
