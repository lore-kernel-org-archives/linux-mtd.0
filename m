Received: from mail-sg2apc01on0052.outbound.protection.outlook.com
 ([104.47.125.52] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2Csg-0004Pa-Cc
 for linux-mtd@lists.infradead.org; Mon, 16 May 2016 07:23:59 +0000
Subject: Re: UBIFS automatic recovery
To: Richard Weinberger <richard.weinberger@gmail.com>, Johan Borkhuis
 <maillist@borkhuis.com>
References: <29b499402bf5243cadea2c294833cd36.squirrel@www.borkhuis.com>
 <CAFLxGvwDGBnf61eco1tQwRCC_BvUZTBF0Q4bLpB74JkRb3JP2g@mail.gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Iwo Mergler <iwo.mergler@netcommwireless.com>
Message-ID: <5739756B.4050305@netcommwireless.com>
Date: Mon, 16 May 2016 17:23:23 +1000
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwDGBnf61eco1tQwRCC_BvUZTBF0Q4bLpB74JkRb3JP2g@mail.gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/13/2016 07:11 PM, Richard Weinberger wrote:
> No. What you need is figuring out*why*  UBIFS breaks while doing
> power cuts. Both UBI and UBIFS are power cut aware by design.
> In most cases UBIFS suffers from MTD problems. May it a faulty driver
> or bad hardware...

Johan,


check if your NAND driver can handle erased pages
with bit errors (0-bits). The drivers from the
old TI Arago tree for the am3x processors didn't,
for instance.

The NAND is expected to contain all '1's after erasure.

Unfortunately, unlike the 1-bit (Hamming) ECC, most
multi-bit (BCH) ECC schemes use a code that flags an
uncorrectable error if both the page and the ECC area
are '1'.

It's annoying - at chip implementation time, a few
extra transistors would have avoided that.

In software, the NAND driver now gets an 'uncorrectable'
error and must check if the page is, in fact, erased. If
it is, it pretends success.

A popular way of checking for erasure is to compare
the ECC syndrome to the known value for an erased page.

Which works fine, as long as you don't have any '0' bits
in it. If you do, the workaround fails and UBI experiences
an "uncorrectable" page.

Most of the time UBIFS doesn't verify erased pages, so
you get away with it. But in times of stress - recovery
or in-the-gaps allocation, for instance - erased pages
are being verified and UBIFS tends to go read-only or
fail the mount on error.

So, make sure that your NAND driver checks the entire
data payload of an erased page for '1' bits, but allows
a small number of '0' bits. Then applies a memset(1)
to the buffer before handing it to MTD.


Best regards,

Iwo
