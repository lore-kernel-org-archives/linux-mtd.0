Received: from mail-vc0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3gR9-0002Gu-65
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 04:51:31 +0000
Received: by vcbfl13 with SMTP id fl13so6085774vcb.36
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 21:51:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345374680.1832.5.camel@kyv>
References: <1342434747-27622-1-git-send-email-sachin.kamat@linaro.org>
 <1342434747-27622-6-git-send-email-sachin.kamat@linaro.org>
 <1345374680.1832.5.camel@kyv>
Date: Tue, 21 Aug 2012 10:21:27 +0530
Message-ID: <CAK9yfHyNcCLD+--qk9j0p4DcnwACevwR8YBeTx8GWcJDXEmHcg@mail.gmail.com>
Subject: Re: [PATCH 6/6] mtd: s3c2410: Fix line over 80 characters warning
From: Sachin Kamat <sachin.kamat@linaro.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 David.Woodhouse@intel.com, ben-linux@fluff.org, patches@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Thanks for your review.

On 19 August 2012 16:41, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Mon, 2012-07-16 at 16:02 +0530, Sachin Kamat wrote:
>> @@ -540,7 +540,8 @@ static void s3c2412_nand_enable_hwecc(struct mtd_info *mtd, int mode)
>>       unsigned long ctrl;
>>
>>       ctrl = readl(info->regs + S3C2440_NFCONT);
>> -     writel(ctrl | S3C2412_NFCONT_INIT_MAIN_ECC, info->regs + S3C2440_NFCONT);
>> +     writel(ctrl | S3C2412_NFCONT_INIT_MAIN_ECC,
>> +                                     info->regs + S3C2440_NFCONT);
>
> This patch makes the code look uglier and less readable. Please, align
> the part which you move to thenext line with the opening bracket ("(").
> The current code uses this style as well.

Yes, you are right.
I will send the updated patch.

>
> I did not take this patch.
>
> --
> Best Regards,
> Artem Bityutskiy



-- 
With warm regards,
Sachin
