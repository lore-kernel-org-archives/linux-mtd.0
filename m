Received: from mail-ig0-x234.google.com ([2607:f8b0:4001:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6xZq-0004Bh-DY
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 09:31:55 +0000
Received: by igbxm8 with SMTP id xm8so11433802igb.1
 for <linux-mtd@lists.infradead.org>; Thu, 10 Dec 2015 01:31:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151209235823.GD144338@google.com>
References: <1397034804-27161-1-git-send-email-helmut.schaa@googlemail.com>
 <20151209235823.GD144338@google.com>
Date: Thu, 10 Dec 2015 10:31:32 +0100
Message-ID: <CAGXE3d_v9hKCqNeTWfjpad_Uj=sKo1fn0B=Wz2s_t76JKUZhzQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Disable subpage writes for drivers without
 ecc->hwctl
From: Helmut Schaa <helmut.schaa@googlemail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Pekon Gupta <pekon.gupta@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 10, 2015 at 12:58 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Hi,
>
> I have my archaeology hat on, in the deep corners of my mailbox...
>
> On Wed, Apr 09, 2014 at 11:13:24AM +0200, Helmut Schaa wrote:
>> nand_write_subpage_hwecc causes a crash if the driver did not register
>> ecc->hwctl or ecc->calculate. Fix this by disabling subpage writes if
>> ecc->hwctl or ecc->calculate is not provided by the driver.
>>
>> This behavior was introduced in commit 837a6ba4f3b6d23026674e6af6b6849a4634fff9
>> "mtd: nand: subpage write support for hardware based ECC schemes".
>>
>> This fixes a crash with fsl_elbc_nand and maybe others:
>>
> [...]
>>
>> Cc: Gupta, Pekon <pekon@ti.com>
>> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>> Cc: David Woodhouse <David.Woodhouse@intel.com>
>> Signed-off-by: Helmut Schaa <helmut.schaa@googlemail.com>
>> ---
>> I noticed this bug on openwrt with kernel 3.10 but it looks as if this can
>> still happen in more recent kernels.
>>
>>  drivers/mtd/nand/nand_base.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index 9715a7b..2298289 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -3768,7 +3768,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>>                       ecc->write_oob = nand_write_oob_std;
>>               if (!ecc->read_subpage)
>>                       ecc->read_subpage = nand_read_subpage;
>> -             if (!ecc->write_subpage)
>> +             if (!ecc->write_subpage && ecc->hwctl && ecc->calculate)
>>                       ecc->write_subpage = nand_write_subpage_hwecc;
>>
>>       case NAND_ECC_HW_SYNDROME:
>
> I realize we've merged a fix for fsl_elbc_nand long ago (commit
> f034d87def51 "mtd: eLBC NAND: fix subpage write support"), but this
> change still looks sane, applies, and could possibly fix some other
> drivers that are lurking somewhere. Any reason I shouldn't apply it?

I'm not carrying this patch in my tree anymore and did not see any more
crashes with the flash configuration I'm using. So, I think the original patch
is kind of superfluous.

Regards,
Helmut
