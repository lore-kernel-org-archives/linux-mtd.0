Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9D4T-0008Az-Ij
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2012 10:42:58 +0000
Received: by pbbrq8 with SMTP id rq8so727758pbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2012 03:42:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346753195.12610.43.camel@sauron.fi.intel.com>
References: <1346677206-13621-1-git-send-email-akinobu.mita@gmail.com>
 <1346677206-13621-8-git-send-email-akinobu.mita@gmail.com>
 <1346753195.12610.43.camel@sauron.fi.intel.com>
Date: Wed, 5 Sep 2012 19:42:55 +0900
Message-ID: <CAC5umyjdg6B8ps20L+HeTfai-Ea8xqR0hsYBMCRkcHp6G9-0Hg@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] mtd: mtd_nandecctest: generalize injecting bit
 errors function for ecc code
From: Akinobu Mita <akinobu.mita@gmail.com>
To: artem.bityutskiy@linux.intel.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/9/4 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>:
> On Mon, 2012-09-03 at 22:00 +0900, Akinobu Mita wrote:
>> In order to inject deliberate bit errors into the ecc code which only
>> has 3 bytes, this adjusts the bitops usage in inject_single_bit_error()
>> which is currently only used for injecting into the 256 or 512 bytes
>> data block.
>>
>> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
>> Cc: David Woodhouse <dwmw2@infradead.org>
>> Cc: linux-mtd@lists.infradead.org
>> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>
> I do not understand the commit message and the patch.
>> ---
>>  drivers/mtd/tests/mtd_nandecctest.c | 13 +++++++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
>> index d3e8873..0274f73 100644
>> --- a/drivers/mtd/tests/mtd_nandecctest.c
>> +++ b/drivers/mtd/tests/mtd_nandecctest.c
>> @@ -7,13 +7,22 @@
>>  #include <linux/slab.h>
>>  #include <linux/mtd/nand_ecc.h>
>>
>> +#include <asm/byteorder.h>
>
> I think you do not need to include this.

OK, I'll remove this.

>> +
>>  #if defined(CONFIG_MTD_NAND) || defined(CONFIG_MTD_NAND_MODULE)
>>
>> +#ifdef __LITTLE_ENDIAN
>> +#define __change_bit_le(nr, addr) __change_bit(nr, addr)
>> +#else
>> +#define __change_bit_le(nr, addr) \
>> +             __change_bit((nr) ^ ((BITS_PER_LONG - 1) & ~0x7), addr)
>> +#endif
>
> Why is this "#ifdef" needed? Can you please add a comment explaining
> this? Which problem do you solve by adding '__change_bit_le()' ?

Sorry for that imcomplete commit message.  I'll update with this:

mtd: mtd_nandecctest: support injecting bit error for ecc code

Currently inject_single_bit_error() is used to inject single bit error
into randomly selected bit position of the 256 or 512 bytes data block.

Later change will add tests which inject bit errors into the ecc code.
Unfortunately, inject_single_bit_error() doesn't work for the ecc code
which is not a multiple of sizeof(unsigned long).

Because bit fliping at random position is done by __change_bit().
For example, flipping bit position 0 by __change_bit(0, addr) modifies
3rd byte (32bit) or 7th byte (64bit) on big-endian systems.

Using little-endian version of bitops can fix this issue.  But
little-endian version of __change_bit is not yet available.
So this defines __change_bit_le() locally in a similar fashion to
asm-generic/bitops/le.h and use it.

...

Also I'll add this comment:

/*
 * The reason for this __change_bit_le() instead of __change_bit()
 * is to inject bit error properly within the region which is not a
 * multiple of sizeof(unsigned long) on big-endian systems
 */
