Received: from mail-ve0-x230.google.com ([2607:f8b0:400c:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRQsT-0002LR-Ph
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 18:10:26 +0000
Received: by mail-ve0-f176.google.com with SMTP id jx11so876150veb.35
 for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2013 11:10:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <l2grtn$svg$1@ger.gmane.org>
References: <CAHqTa-0d=U+W2nju8WeCJ=gL+ja8DVuK0BUquajOL6qXV5C0+g@mail.gmail.com>
 <l2grtn$svg$1@ger.gmane.org>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Wed, 2 Oct 2013 11:09:44 -0700
Message-ID: <CAHqTa-3HxoQJ=wEZ_w8Vcp9VXS12=xNbiJ2v8fSsJbMb9BT_4w@mail.gmail.com>
Subject: Re: Page corruption when writing non-sequential pages in an MLC NAND
 eraseblock
To: Romain Izard <romain.izard.pro@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 2, 2013 at 3:18 AM, Romain Izard <romain.izard.pro@gmail.com> wrote:
> On 2013-10-01, Avery Pennarun <apenwarr@gmail.com> wrote:
>> Steps:
>> - Disable ECC to avoid any confusion (ECC turns out to not affect the
>> test results, but I wanted to make sure)
>> - Erase any eraseblock
>> - Write all-zeroes to page 0x18 of that eraseblock; read it back -> ok
>> - Write all-zeroes to page 0x12 of that eraseblock; read it back ->
>> FAIL, all 0xff instead
>> - Read page 0x18 -> completely random data (about 12% of bits are flipped)
>
> For me you're violating one key MLC assumption: the pages within a block
> must be written in a strictly increasing order. It should be written
> somewhere in the component's datasheet.

Hmm.  I haven't heard of this constraint, but it certainly seems to be
happening in this case (although in fact random-access writes *mostly*
work other than this pairing effect, so it seems like they intended it
to work properly).

This makes /dev/mtdblock completely unusable as it reorders writes.
Is /dev/mtdblock known to not work with MLC chips?

Thanks,

Avery
