Received: from smtpauth02.csee.onr.siteprotect.com ([64.26.60.136])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MQUZT-0007hr-J3
	for linux-mtd@lists.infradead.org; Mon, 13 Jul 2009 23:04:49 +0000
Message-ID: <4A5BBD79.4020400@boundarydevices.com>
Date: Mon, 13 Jul 2009 16:04:25 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH V4 2/3] mtd: nand: Calculate better default ecc layout
References: <1246055086-7357-1-git-send-email-troy.kisky@boundarydevices.com>
	<1246055086-7357-2-git-send-email-troy.kisky@boundarydevices.com>
	<200907131456.19881.david-b@pacbell.net>
In-Reply-To: <200907131456.19881.david-b@pacbell.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Brownell wrote:
> On Friday 26 June 2009, Troy Kisky wrote:
>> Looking through the code, I can only see that
>> Davinci is effected this way when using 512 bytes
>> x 4 steps with hardware ecc.
> 
> You mean, with *single-bit* hardware ECC.

Yes. I do.

> 
> Currently each step needs just three bytes,
> but it's using the default ECC layout which
> allocates six bytes per step.
> 
> 
>> It has its ecc 
>> bytes moved from oob 40-63 to oob 52-63.
> 
> More correctly:  40-42, 46-48, 52-54, 58-60
> to 52-63.

No. More correctly,
40-42  -> 52-54
43-45  -> 55-57
46-48  -> 58-60
49-51  -> 61-63
52-63  -> free space 40-51

> 
> 
>> So a Davinci authority will need to ack this,
>> or request a change.
> 
> Actually I'd just stick with the standard policy
> and not make such an incompatible change in the
> first place.  You can't guarantee that the change
> won't cause regressions...
> 
> It would have been nice if the MTD layer were
> doing this ECC layout before, but in this specific
> case I can't say I think an extra 12 bytes of OOB
> data will matter to anyone.

That was only a side benefit, not the main reason for the patch.

> 
> - Dave


I am perfectly willing to add platform data to the current
evm's to maintain current behavior. As for regressions, could
the next tree help find these?? I have looked fairly closely,
but I definitely could have missed something.


I thank you very much for taking the time to comment upon this.
I'd much rather have a nak than silence.


If anyone ever wants me to post an updated version of the patch
give me a shout. Otherwise, I won't waste anymore of the lists time.


Thanks
Troy
