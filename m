Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14sRsm-0002PX-00
	for mtd-list@infradead.org; Wed, 25 Apr 2001 17:11:12 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14sRsl-0002PR-00
	for mtd@infradead.org; Wed, 25 Apr 2001 17:11:11 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NEBBLPFMELCDALFMOJILEEFGCFAA.mstempin@com1.fr> 
References: <NEBBLPFMELCDALFMOJILEEFGCFAA.mstempin@com1.fr> 
To: "Michel STEMPIN" <mstempin@com1.fr>
Cc: "mtd" <mtd@infradead.org>
Subject: Re: Booting from StrataFlash on SBC-104 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 25 Apr 2001 17:11:02 +0100
Message-ID: <27955.988215062@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mstempin@com1.fr said:
>  My goal is to be able to boot it from the built-in StrataFlash
> device, and thus, I have a few questions:
> 	- would you recommend using JFFS or JFFS2?

JFFS2.

> 	- I saw a "boot" directory under the CVS: what is its status?
> 	- under "boot" the Makefile is building 2 targets "flashloader.rom"
> and "sbc_mediagx.rom": what are they for? Which one should I get,
> since the sbc_mediagx and the sbc_104 are from the same manufacturer?

I'll let the people from Arcom answer those.

Have you tried the GPL'd driver for the DiskOnChip?


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
