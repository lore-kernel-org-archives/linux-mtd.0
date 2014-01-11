Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W23ty-0008VH-3Q
 for linux-mtd@lists.infradead.org; Sat, 11 Jan 2014 19:07:23 +0000
Received: by mail-pd0-f171.google.com with SMTP id x10so1167933pdj.30
 for <linux-mtd@lists.infradead.org>; Sat, 11 Jan 2014 11:06:57 -0800 (PST)
Date: Sat, 11 Jan 2014 11:06:39 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Stefan Roese <sr@denx.de>
Subject: Re: [RFC/PATCH] mtd: mtd_read: Fix bitflips_threshold comparison to
 allow max bitflips
Message-ID: <20140111190639.GA1992@norris-Latitude-E6410>
References: <1388407257-6557-1-git-send-email-sr@denx.de>
 <52CCFE5C.8060205@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52CCFE5C.8060205@denx.de>
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 08, 2014 at 08:29:32AM +0100, Stefan Roese wrote:
> On 30.12.2013 13:40, Stefan Roese wrote:
> > On a custom AM335x based platform with a Toshiba NAND device
> > (TC58NVG1S3H) we are currently seeing quite a few of these UBI messages:
> > 
> > [   18.044967] UBI: fixable bit-flip detected at PEB 50
> > [   18.050252] UBI: schedule PEB 50 for scrubbing
> > ...
> > 
> > After a bit debugging I found that those messages are only printed when
> > the OMAP NAND driver has detected 8 (corrected) bitflips / 512 bytes on
> > a read. We're using HW BCH8 and the Toshiba chip supports 8 bit ECC for
> > each 512Byte. I was wondering why 8 bitflips resulted in these UBI
> > messages and e.g. 7 bitflips didn't. Hence I discovered the comparison
> > "ret_code >= mtd->bitflip_threshold" in mtd_read().
> > 
> > With this patch applied all tests (UBIFS) I've done so far didn't produce
> > any of these "UBI: fixable bit-flip" messages any more.
> > 
> > Note that I'm sending this patch as RFC for now. To get some feedback
> > from other MTD / NAND developers on this issue. The main question is:
> > Should mtd_read() return -EUCLEAN if the corrected bitflips are equal to
> > the bitflip-threshold value? Or should it return 0 since the bitflips
> > have been corrected?

-EUCLEAN is a purposeful part of the MTD API. It means that mtd_read()
encountered some high level of (correctable) bitflips, and MTD is
intentionally informing the upper layer(s) that they may want to take
corrective action on scrubbing the affected area, so that it doesn't
accumulate more bitflips and corrupt your data. MTD is acting correctly.

At a higher layer, I think UBI should be scrubbing the block (erasing
and moving or rewriting data) at least once, to refresh the data. After
that, wear leveling *should* prevent the block from being reused in the
near future. If that isn't the case, then we may need to fix UBI.

> Brian, do you have any comments? Is this patch good as is? Should I
> resend it as non-RFC?

No, this patch is not acceptable. It effectively ignores all bitflips
until it's too late (i.e., there are more bitflips than we can correct).
Also, if you really did want this effect, you could simply increase your
threshold to 9 via sysfs. But I don't recommend that.

Brian
