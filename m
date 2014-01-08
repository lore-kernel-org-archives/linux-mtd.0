Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::4])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0naV-00051N-Hd
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2014 07:30:04 +0000
Message-ID: <52CCFE5C.8060205@denx.de>
Date: Wed, 08 Jan 2014 08:29:32 +0100
From: Stefan Roese <sr@denx.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [RFC/PATCH] mtd: mtd_read: Fix bitflips_threshold comparison
 to allow max bitflips
References: <1388407257-6557-1-git-send-email-sr@denx.de>
In-Reply-To: <1388407257-6557-1-git-send-email-sr@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 30.12.2013 13:40, Stefan Roese wrote:
> On a custom AM335x based platform with a Toshiba NAND device
> (TC58NVG1S3H) we are currently seeing quite a few of these UBI messages:
> 
> [   18.044967] UBI: fixable bit-flip detected at PEB 50
> [   18.050252] UBI: schedule PEB 50 for scrubbing
> ...
> 
> After a bit debugging I found that those messages are only printed when
> the OMAP NAND driver has detected 8 (corrected) bitflips / 512 bytes on
> a read. We're using HW BCH8 and the Toshiba chip supports 8 bit ECC for
> each 512Byte. I was wondering why 8 bitflips resulted in these UBI
> messages and e.g. 7 bitflips didn't. Hence I discovered the comparison
> "ret_code >= mtd->bitflip_threshold" in mtd_read().
> 
> With this patch applied all tests (UBIFS) I've done so far didn't produce
> any of these "UBI: fixable bit-flip" messages any more.
> 
> Note that I'm sending this patch as RFC for now. To get some feedback
> from other MTD / NAND developers on this issue. The main question is:
> Should mtd_read() return -EUCLEAN if the corrected bitflips are equal to
> the bitflip-threshold value? Or should it return 0 since the bitflips
> have been corrected?

Brian, do you have any comments? Is this patch good as is? Should I
resend it as non-RFC?

Thanks,
Stefan
