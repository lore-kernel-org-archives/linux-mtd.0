Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pcada-00070O-Fr
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2011 09:35:35 +0000
Received: by fxm19 with SMTP id 19so19135402fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 11 Jan 2011 01:35:32 -0800 (PST)
Subject: Re: What if the UBI flasher can't skip all-FF pages?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: J Barlow <jbarlow@ivl.com>
In-Reply-To: <loom.20110110T205414-506@post.gmane.org>
References: <loom.20110110T205414-506@post.gmane.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 11 Jan 2011 11:35:28 +0200
Message-ID: <1294738528.2266.12.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 2011-01-10 at 22:47 +0000, J Barlow wrote:
> Hi everyone,
> 
> I am developing an embedded system with a NAND flash.  We're intending to 
> program all of the NAND flashes in a factory programmer.  I've read "how the UBI 
> flash should work" and I suspect that the UBI flasher doesn't work that way.  
> Specifically, I'm pretty sure it doesn't know how to skip pages containing only 
> FFs.  Unfortunately, the flasher's software is proprietary, not to mention only 
> available in Chinese.  It might well work as expected, but testing this would 
> also be difficult and expensive since the flasher is in a factory in China.

First of all, is this a problem for your flash? If yes, why is it a
problem and why you cannot test this?

The original reason for writing this article was that some flashes have
write non-0xFF ECC to the OOB area when programmed with all 0xFFs. But
this case is easily testable.

> Is there any reasonable way to let UBIFS know all pages have been programmed 
> initially? For example, maybe I could deliberate replace all-FF pages with all-
> 00 pages in the flashed image.  Or will that just cause UBI/UBIFS to find 
> corrupt empty space and fail?  Or perhaps someone could direct me how to make a 
> patch that would help with UBIFS/UBI/ubinize with this specific situation.  It 
> does seem like other people have run into problems with poorly written flashers 
> problem, and in some cases like mine changing the flasher is not an option.

The easiest way is to introduce a bit to UBI EC headers which would mean
"I'm an LEB flashed in production, and empty pages were programmed with
0xFFs, do something". Then for each of such LEBs UBI would do full
re-write and would clean the flag. It is very easy to implement, but
would mean that the first boot basically needs full re-write of the
flashed data, which may be very slow.

With more work and thought it is also possible to invent better
solution, though. But I do not have time to think about this and
describe this right now (vacation) :-)

> Also, if I use a read-only UBIFS in a dynamic UBI volume, will UBIFS ever 
> attempt to double-program an all-FF page?

Depends. But yes, for some of them, not all.

>   I would imagine if I used a read-only 
> UBIFS in a static UBI volume I won't have trouble -- except that I also need to 
> update the firmware.

Yes, in case of R/O usage I do not see issues.

>   Is it possible to ubiupdatevol a static UBI volume, or do 
> I need something more aggressive to modify a static UBI volume?

You can use ubiupdatevol

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
