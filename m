Received: from mail-vc0-x231.google.com ([2607:f8b0:400c:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIlt0-0004zH-8C
 for linux-mtd@lists.infradead.org; Tue, 03 Feb 2015 22:23:58 +0000
Received: by mail-vc0-f177.google.com with SMTP id hy4so17670736vcb.8
 for <linux-mtd@lists.infradead.org>; Tue, 03 Feb 2015 14:23:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CADhT+weaYA1cSQCNP98Ta0ChgxymbBbwtRikdUdcbL2pQB-TXQ@mail.gmail.com>
References: <1421249930-21229-1-git-send-email-dinguyen@opensource.altera.com>
 <CADhT+weaYA1cSQCNP98Ta0ChgxymbBbwtRikdUdcbL2pQB-TXQ@mail.gmail.com>
Date: Tue, 3 Feb 2015 23:23:35 +0100
Message-ID: <CAFLxGvynJFPECTG5f_ZN_VpgkiZE01MUiJh4Yvj-Pf8MuOit7g@mail.gmail.com>
Subject: Re: [PATCH] mtd: denali: Disable sub-page writes in Denali NAND driver
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Dinh Nguyen <dinh.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Josh Triplett <josh@joshtriplett.org>,
 Linux List <linux-kernel@vger.kernel.org>, yamada.m@jp.panasonic.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 3, 2015 at 11:15 PM, Dinh Nguyen <dinh.linux@gmail.com> wrote:
> Hi Brian,
>
> On Wed, Jan 14, 2015 at 9:38 AM,  <dinguyen@opensource.altera.com> wrote:
>> From: Graham Moore <grmoore@opensource.altera.com>
>>
>> The Denali Controller IP does not support sub-page writes.
>>
>> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
>> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
>> ---
>>  drivers/mtd/nand/denali.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
>> index b3b7ca1..b16b040 100644
>> --- a/drivers/mtd/nand/denali.c
>> +++ b/drivers/mtd/nand/denali.c
>> @@ -1565,6 +1565,9 @@ int denali_init(struct denali_nand_info *denali)
>>         denali->nand.options |= NAND_SKIP_BBTSCAN;
>>         denali->nand.ecc.mode = NAND_ECC_HW_SYNDROME;
>>
>> +       /* no subpage writes on denali */
>> +       denali->nand.options |= NAND_NO_SUBPAGE_WRITE;
>> +
>>         /*
>>          * Denali Controller only support 15bit and 8bit ECC in MRST,
>>          * so just let controller do 15bit ECC for MLC and 8bit ECC for
>> --
>> 2.2.1
>>
>
> Was wondering if you got a chance to look at this patch?

So this driver never worked?
If it worked for some users we have to make sure that your change does not break
existing setups.
/me thinks of UBI.

-- 
Thanks,
//richard
