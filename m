Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13qfcv-0000mT-00
	for mtd-list@infradead.org; Tue, 31 Oct 2000 17:55:13 +0000
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13qfcu-0000mN-00
	for mtd@infradead.org; Tue, 31 Oct 2000 17:55:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <0FA1031B65A9D111960900805F9FA8E103B9F191@txexmta8.amd.com> 
References: <0FA1031B65A9D111960900805F9FA8E103B9F191@txexmta8.amd.com> 
To: mark.langsdorf@amd.com
Cc: mtd@infradead.org
Subject: Re: Problems with AMD CFI chips 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 31 Oct 2000 17:55:08 +0000
Message-ID: <1552.973014908@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mark.langsdorf@amd.com said:
>  The Flash bank is found correctly, and loads, and I can write to it.
> However, when I boot from it, I can't seem to get it to commit writes
> - either creating new files  or altering old ones.  Once I reboot the
> device, my changes are gone.

Please check using the /dev/mtd0 device directly to see whether your writes 
are 'taking'. 

What 'map' driver are you using? I found that it didn't work for me on the 
iPAQ because I wasn't enabling the Vpp voltage during write cycles. Is this 
necessary on your targer?

Other than that, poke the author and/or look at the code yourself to see 
what's happening. What interleave/buswidth are you using?

Note to self: Must produce a proper bug report for Nico for the current
cfi_cmdset_0001 code, does doesn't work for me on 1x16 devices.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
