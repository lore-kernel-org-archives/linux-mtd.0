Received: from mail-pb0-x22d.google.com ([2607:f8b0:400e:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrPYU-0001kr-Ja
 for linux-mtd@lists.infradead.org; Fri, 13 Dec 2013 10:01:11 +0000
Received: by mail-pb0-f45.google.com with SMTP id rp16so2309914pbb.4
 for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2013 02:00:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20131213084938.GA7695@shlinux2.ap.freescale.net>
References: <1386619091-23992-1-git-send-email-eliedebrauwer@gmail.com>
 <20131211132455.GA1284@gmail.com>
 <20131213084938.GA7695@shlinux2.ap.freescale.net>
Date: Fri, 13 Dec 2013 11:00:45 +0100
Message-ID: <CAGWqfiiHiz64O+_EF1FQD_Xnit9STT2h_bQ0Weu0Ci+ZtNDLvw@mail.gmail.com>
Subject: Re: [PATCH v1] mtd: gpmi: Bitflip support in erased regions
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, Huang Shijie <shijie8@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 13, 2013 at 9:49 AM, Huang Shijie <b32955@freescale.com> wrote:
> On Wed, Dec 11, 2013 at 09:24:58PM +0800, Huang Shijie wrote:
>> On Mon, Dec 09, 2013 at 08:58:10PM +0100, Elie De Brauwer wrote:
>> > programmed to 0 (meaning that the entire page should consist of bytes of
>> > 0xFF. For MLC NAND devices, bit errors may occur on reads (even on blank
>> > pages), so this threshold can be used to tune the erased page checking
>> > algorithm."
>> >
>> > So as my solution I'm setting this erase threshold to the ecc_strength
>> > derived from the geometry, meaning that I will tolerate the same number of
>> > bitflips the BCH block would consider correctable.
>> > The side effect is that whever I'm reading a page (gpmi_ecc_read_page() )
> A solution is to check the HW_BCH_STATUS0:ALLONES.
>
> If it is all ones, we do not check it by software.

Ah, the HW_BCH_STATUS0 register does indeed contain some interesting bits:
- ALLONES  1 = All data bits of this transaction are ONE
(source: imx datasheet page 1292)

Hence I will change gpmi_err_read_page() from my original patch
gpmi_ecc_read_page(). Going from something like:

if (*status == STATUS_ERASED)
    /* Erased block, check/correct bitflips manually. */
    flips = erased_sector_bitflips(payload_virt, i, nfc_geo);
else
   /* BCH block corrected some errors for us. */
   flips = *status;

Into something more

if (*status == STATUS_ERASED)
    if (readl(HW_BCH_STATUS0 & BM_BCH_STATUS0_ALLONES))
        flips = 0;
    else
        /* Erased block, check/correct bitflips manually. */
        flips = erased_sector_bitflips(payload_virt, i, nfc_geo);
else
   /* BCH block corrected some errors for us. */
   flips = *status;


(Hiding the readl() in a function in gpmi-lib.c since all register
peek-n-poke is occuring there). And this way only doing the
soft-bitflip-check where absolutely necessary (where necessary is
defined on a page granularity).

I will provide a v2 of my patch incorporating these changes after I've
had a chance to test them on hardware. (Somewhere this
evening/tomorrow).

>
>
>> > which the BCH block marked as "erased" I need to take a software approach.
>> > The software approach is inspired on what is currently
>> > done in the omap2 driver (but not free from discussion). At that point I
>> > now that the page can contain up to ecc_strenght bitflips, so I need to
>>
>> The ecc_strength can be 40 sometimes.
>
> The only problem is what is the proper value for ERASE_THRESHOLD.
>
> still need more investigate.

Okay, I'm awaiting input on this.

The reason why I set this to ecc_strength was because I assumed that
the BCH could correct up to ecc_strength biterrors, hence I could fix
this amount of bitflips myself. But I agree it can be rough estimate.
In my specific case hardcoding it to 1 would have already fixed it.


Thanks for your feedback !



-- 
Elie De Brauwer
