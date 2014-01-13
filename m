Received: from anubis.se.axis.com ([195.60.68.12])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2cVM-0007Hy-IL
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 08:04:18 +0000
Date: Mon, 13 Jan 2014 09:03:25 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFC/PATCH] mtd: mtd_read: Fix bitflips_threshold comparison to
 allow max bitflips
In-Reply-To: <20140111190639.GA1992@norris-Latitude-E6410>
Message-ID: <alpine.DEB.2.00.1401130857030.24884@lnxricardw.se.axis.com>
References: <1388407257-6557-1-git-send-email-sr@denx.de>
 <52CCFE5C.8060205@denx.de> <20140111190639.GA1992@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: Stefan Roese <sr@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sat, 11 Jan 2014, Brian Norris wrote:

>>> After a bit debugging I found that those messages are only printed when
>>> the OMAP NAND driver has detected 8 (corrected) bitflips / 512 bytes on
>>> a read. We're using HW BCH8 and the Toshiba chip supports 8 bit ECC for
>>> each 512Byte. I was wondering why 8 bitflips resulted in these UBI
>>> messages and e.g. 7 bitflips didn't. Hence I discovered the comparison
>>> "ret_code >= mtd->bitflip_threshold" in mtd_read().
>>>
>>> With this patch applied all tests (UBIFS) I've done so far didn't produce
>>> any of these "UBI: fixable bit-flip" messages any more.
>>>
>>> Note that I'm sending this patch as RFC for now. To get some feedback
>>> from other MTD / NAND developers on this issue. The main question is:
>>> Should mtd_read() return -EUCLEAN if the corrected bitflips are equal to
>>> the bitflip-threshold value? Or should it return 0 since the bitflips
>>> have been corrected?
>
> -EUCLEAN is a purposeful part of the MTD API. It means that mtd_read()
> encountered some high level of (correctable) bitflips, and MTD is
> intentionally informing the upper layer(s) that they may want to take
> corrective action on scrubbing the affected area, so that it doesn't
> accumulate more bitflips and corrupt your data. MTD is acting correctly.
>
> At a higher layer, I think UBI should be scrubbing the block (erasing
> and moving or rewriting data) at least once, to refresh the data. After
> that, wear leveling *should* prevent the block from being reused in the
> near future. If that isn't the case, then we may need to fix UBI.
>
>> Brian, do you have any comments? Is this patch good as is? Should I
>> resend it as non-RFC?
>
> No, this patch is not acceptable. It effectively ignores all bitflips
> until it's too late (i.e., there are more bitflips than we can correct).
> Also, if you really did want this effect, you could simply increase your
> threshold to 9 via sysfs. But I don't recommend that.

Besides, assuming you are using BCH-8, then you can never get more than 8 
fixable bitflips, after that you'll get an 'uncorrectable' error. So 
essentially either applying the patch or setting the bitflip_threshold to 
9 results in no potential corrective action being taken (e.g. UBI 
scrubbing the block when it sees -EUCLEAN) until it's too late.

If anything I'd suggest lowering the bitflip_threshold a few steps under 
what the ECC algorithm can correct, e.g. 6 in the case of BCH-8, the 
rationale being that one could imagine getting 6 bitflips one day and 8 
bitflips another, i.e. the number of bitflips may not necessarily increase 
in steps of one.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
