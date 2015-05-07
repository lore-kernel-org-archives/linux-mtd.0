Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqJ6Q-00060P-46
 for linux-mtd@lists.infradead.org; Thu, 07 May 2015 10:32:28 +0000
Received: by oign205 with SMTP id n205so29738932oig.2
 for <linux-mtd@lists.infradead.org>; Thu, 07 May 2015 03:32:03 -0700 (PDT)
MIME-Version: 1.0
Sender: christian.riesch@gmail.com
In-Reply-To: <20150507070256.GF6055@norris-Latitude-E6410>
References: <1427837363-2782-1-git-send-email-christian.riesch@omicron.at>
 <20150507070256.GF6055@norris-Latitude-E6410>
Date: Thu, 7 May 2015 12:32:03 +0200
Message-ID: <CABkLObrEFNF9xwyxvJzy5tp+NaTZg_Ngws-Zryvv3bXS24VVNg@mail.gmail.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Initialize datum before calling
 map_word_load_partial
From: Christian Riesch <christian.riesch@omicron.at>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 7, 2015 at 9:02 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Tue, Mar 31, 2015 at 11:29:22PM +0200, Christian Riesch wrote:
>> In do_otp_write we must initialize the variable datum before calling
>> map_word_load_partial. Otherwise the upper bits of datum may be undefined,
>> which later causes problems in chip_good called by do_write_oneword.
>
> Hmm, are you sure this is actually the problem? It looks to me like the
> logic for the "partial write of a word, load old contents" block means
> that we *will* initialize datum with old contents, if we're not aligned.

That's right. But if we are aligned, datum will not be initialized, at
least not in every case.

> So your initialization actually looks redundant.
>
> Or please help explain, if I'm wrong.

This is from do_otp_write():

        map_word datum;

        if (n != map_bankwidth(map)) {

If we are not aligned

            /* partial write of a word, load old contents */
            otp_enter(map, chip, bus_ofs, map_bankwidth(map));
            datum = map_read(map, bus_ofs);

initialize datum with the old content. The flash memory that I am
using has a 16 bit wide data bus, Therefore the lower 16 bits of datum
will contain the old content, while the upper 16 bits will be
initialized to 0.

            otp_exit(map, chip, bus_ofs, map_bankwidth(map));
        }

But if we are aligned, only map_word_load_partial will be done.
map_word_load_partial will only modify the lower 16 bits of datum,
while keeping the content of the upper 16 bits. These upper 16 bits
are uninitialized if we are word-aligned.

        datum = map_word_load_partial(map, datum, buf, gap, n);
        ret = do_write_oneword(map, chip, bus_ofs, datum, FL_OTP_WRITE);

do_write_oneword compares the memory content after writing with datum
(in chip_good()). However, it compares the entire content of datum, in
my case the full 32 bits of it. This comparison fails if the upper 16
bits have not been initialized to zero. This is why I must initialize
datum with map_word_ff(map).

Without initialization, unaligned writes work fine, whereas aligned writes fail.

Christian

>
> Brian
>
>> Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
>> ---
>>  drivers/mtd/chips/cfi_cmdset_0002.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
>> index c50d8cf..c3624eb 100644
>> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
>> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
>> @@ -1295,7 +1295,7 @@ static int do_otp_write(struct map_info *map, struct flchip *chip, loff_t adr,
>>               unsigned long bus_ofs = adr & ~(map_bankwidth(map)-1);
>>               int gap = adr - bus_ofs;
>>               int n = min_t(int, len, map_bankwidth(map) - gap);
>> -             map_word datum;
>> +             map_word datum = map_word_ff(map);
>>
>>               if (n != map_bankwidth(map)) {
>>                       /* partial write of a word, load old contents */
>> --
>> 1.7.9.5
>>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
