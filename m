Received: from mail-ob0-f169.google.com ([209.85.214.169])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WV0p2-0005Fw-FL
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 15:41:56 +0000
Received: by mail-ob0-f169.google.com with SMTP id va2so11292002obc.28
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 08:41:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140401072401.GB6400@brian-ubuntu>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-3-git-send-email-davidm@egauge.net>
 <20140401072401.GB6400@brian-ubuntu>
Date: Tue, 1 Apr 2014 09:41:34 -0600
Message-ID: <CALnQHM1ybVjSdXGTNaQxFLYs+WgY8OGSace8=Oa6CmsRzp5ypw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] mtd: nand: Add NAND_ECC_HW_ON_DIE ECC-mode.
From: David Mosberger <davidm@egauge.net>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Gerhard Sittig <gsi@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

On Tue, Apr 1, 2014 at 1:24 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Mon, Mar 31, 2014 at 05:28:54PM -0600, David Mosberger wrote:
>> Some Micron chips such as the MT29F4G16ABADAWP have an internal
>> (on-die) ECC-controller that is useful when the host-platform doesn't
>> have hardware-support for multi-bit ECC.  This patch adds
>> NAND_ECC_HW_ON_DIE to support such chips when the driver detects that
>> the on-die ECC controller is enabled.
>>
>> Signed-off-by: David Mosberger <davidm@egauge.net>
>> ---
>>  drivers/mtd/nand/nand_base.c |  133 ++++++++++++++++++++++++++++++++++++++++++
>>  drivers/of/of_mtd.c          |    1 +
>>  include/linux/mtd/nand.h     |    2 +
>>  3 files changed, 136 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index f145f00..7047e9f5 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -78,6 +78,20 @@ static struct nand_ecclayout nand_oob_64 = {
>>                .length = 38} }
>>  };
>>
>> +static struct nand_ecclayout nand_oob_64_on_die = {
>
> This is not the only possible layout for on-die ECC. It's probably not
> even the only one used by Micron, is it? What about larger page sizes,
> for instance?

I don't know.  I never claimed my patch is perfect, but it's better than
what's in the standard kernel now.

If somebody knows how to improve this, I'm happy to test any patches
to make sure it keeps working with the NAND we happened to use.

>> +     case NAND_ECC_HW_ON_DIE:
>> +             /* nand_bbt attempts to put Bbt marker at offset 8 in
>
> s/Bbt/BBT/

Check nand_bbt.c.  bbt_patern is actually Bbt, not BBT.

> Also, please see Documentation/CodingStyle regarding the proper
> multiline comment style.

Again, not something flagged by chkpatch, but sure, I updated my code, thanks.

>> +                oob, which is used for ECC by Micron
>
> s/oob/OOB/

OK.

>> +                MT29F4G16ABADAWP, for example.  Fixed by not using
>> +                OOB for BBT marker.  */
>> +             chip->bbt_options |= NAND_BBT_NO_OOB;
>> +             chip->ecc.layout = &nand_oob_64_on_die;
>> +             chip->ecc.read_page = nand_read_page_on_die;
>> +             chip->ecc.read_subpage = nand_read_subpage_on_die;
>> +             chip->ecc.write_page = nand_write_page_raw;
>> +             chip->ecc.read_oob = nand_read_oob_std;
>> +             chip->ecc.read_page_raw = nand_read_page_raw;
>> +             chip->ecc.write_page_raw = nand_write_page_raw;
>> +             chip->ecc.write_oob = nand_write_oob_std;
>> +             chip->ecc.size = 512;
>> +             chip->ecc.bytes = 8;
>> +             chip->ecc.strength = 4;
>
> This is all way too specific to the particular Micron flash you're
> looking at. There are other vendors that use on-die ECC, and any support
> here should be written to accommodate future additions (by Micron or
> other vendors).
>
> Particularly: the ECC strength/size should be determined per
> vendor/flash, not here. Can you get this from ONFI or the ID? At least
> the ecc.{strength,bytes,size} should probably be assigned from the
> flash-vendor-specific callback.

Perhaps, I just don't know how to do that.  If somebody sends me a patch,
I'll be happy to test.

>> @@ -112,6 +112,7 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
>>  /* Status bits */
>>  #define NAND_STATUS_FAIL     0x01
>>  #define NAND_STATUS_FAIL_N1  0x02
>> +#define NAND_STATUS_REWRITE  0x08
>
> How "standard" is this? Is this a Micron-specific status bit? If so, we
> should note that in a comment.

I don't know.

  --david
-- 
eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768
