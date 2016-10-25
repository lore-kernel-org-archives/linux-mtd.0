Received: from mail1.bemta8.messagelabs.com ([216.82.243.203])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byzwe-0003BN-Lr
 for linux-mtd@lists.infradead.org; Tue, 25 Oct 2016 11:31:05 +0000
Subject: Re: [PATCH v6 4/4] mtd: nand: tango: import driver for tango chips
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: linux-mtd <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>
References: <580E0318.5020004@sigmadesigns.com>
 <580E04B4.7040102@sigmadesigns.com> <20161024171026.710d0f6a@bbrezillon>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <580F425F.8090000@sigmadesigns.com>
Date: Tue, 25 Oct 2016 13:30:39 +0200
MIME-Version: 1.0
In-Reply-To: <20161024171026.710d0f6a@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Heya :-)

On 24/10/2016 17:10, Boris Brezillon wrote:

> Marc Gonzalez wrote:
> 
>> This driver supports the NAND Flash controller embedded in recent
>> Tango chips, such as SMP8758 and SMP8759.
> 
> A few comments below (most of them are about coding style).

20c25f430311 tweak chip->options
cd1f53e6d2b8 Move ECC init code around
b90efb09a921 Increment ecc_stats.failed on error
2236f67af8d6 move brace for checkpatch
83c1c0311c2a braces in for loop
13faec8fa36b proper braces for if-block
f879bf99d5c3 Move test before DMA write
a2d319b18702 no brackets for readl_poll_timeout
67acc45e26e1 Remove nice alignment
dd71ae037721 fix TIMING macro

Time to squash and send v7, along with the bindings doc.


>> +#define TIMING(t0, t1, t2, t3) (t0 << 24 | t1 << 16 | t2 << 8 | t3 << 0)
> 
> Wrap tX params with parenthesis to make sure the shift operation is
> applied to the correct value (for example, if t0 = a + b, then the
> resulting operation will be a + (b << 24) instead of (a + b) << 24 if
> you don't put those parenthesis).

Fixed.

For the record, addition has higher precedence than shift.
Thus a + b << n = (a + b) << n
But your point is valid for bit-wise operations, e.g.
a & b << n = a & (b << n)

>> +	writel_relaxed(page, nfc->reg_base + NFC_ADDR_PAGE);
>> +	writel_relaxed(   0, nfc->reg_base + NFC_ADDR_OFFSET);
>> +	writel_relaxed( cmd, nfc->reg_base + NFC_FLASH_CMD);
> 
> A vestige of you weird alignment policy ;). Please fix that.

Fixed. Even checkpatch complains...
(Sad puppy face)

Regards.
