Received: from mail-ob0-x22d.google.com ([2607:f8b0:4003:c01::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1jOA-000313-4f
 for linux-mtd@lists.infradead.org; Thu, 18 Dec 2014 22:17:42 +0000
Received: by mail-ob0-f173.google.com with SMTP id uy5so6401478obc.4
 for <linux-mtd@lists.infradead.org>; Thu, 18 Dec 2014 14:17:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5492B9C0.2060904@vanguardiasur.com.ar>
References: <CAAK6Zt2dbK1EayqrvNWsZQxiCJ97YidHYGLs-DC8pv3Ggitz1w@mail.gmail.com>
 <5492B9C0.2060904@vanguardiasur.com.ar>
Date: Thu, 18 Dec 2014 14:17:20 -0800
Message-ID: <CAAK6Zt1h0Xy5DOR9tqtEUE7SXiNfLYSQfpaY8mW=FRf3-jEEBA@mail.gmail.com>
Subject: Re: [PATCH] UBI: block: Continue creating ubiblocks after an
 initialization error
From: Daniel Ehrenberg <dehrenberg@google.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=UTF-8
Cc: grundler@chromium.org, Richard Weinberger <richard@nod.at>,
 Gwendal Grignou <gwendal@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 18, 2014 at 3:25 AM, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> On 12/17/2014 08:16 PM, Daniel Ehrenberg wrote:
>> If one ubi volume is corrupted but another is not, it should be
>> possible to initialize that ubiblock from a kernel commandline which
>> includes both of them. This patch changes the error handling behavior
>> in initializing ubiblock to ensure that all parameters are attempted
>> even if one fails. If there is a failure, it returns one of the
>> error status codes. It also makes error messages more descriptive
>> by including the name of the UBI volume that failed.
>>
>> Tested: Formatted ubi volume /dev/ubi5_0 in a corrupt way and
>> dev/ubi3_0 properly and included "ubi.block=5,0 ubi.block=3,0" on
>> the kernel command line. At boot, I see the following in the console:
>> [   21.082420] UBI error: ubiblock_create_from_param: block: can't
>> open volume on ubi5_0, err=-19
>> [   21.084268] UBI: ubiblock3_0 created from ubi3:0(rootfs)
>>
>> Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
>> ---
>>  drivers/mtd/ubi/block.c | 14 ++++++++------
>>  1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
>> index 8876c7d..32eeeee 100644
>> --- a/drivers/mtd/ubi/block.c
>> +++ b/drivers/mtd/ubi/block.c
>> @@ -596,10 +596,11 @@ static int __init ubiblock_create_from_param(void)
>>
>
> Do you think we can add a comment here to explain how errors are treated?

Sent a v2 with that comment and another change.
>
>>                 desc = open_volume_desc(p->name, p->ubi_num, p->vol_id);
>>                 if (IS_ERR(desc)) {
>> -                       ubi_err("block: can't open volume, err=%ld\n",
>> -                               PTR_ERR(desc));
>> +                       ubi_err(
>> +                               "block: can't open volume on ubi%d_%d, err=%ld",
>> +                               p->ubi_num, p->vol_id, PTR_ERR(desc));
>
> Is it me, or this line break is unneeded here?

checkpatch.pl mandates that (a) strings must not be broken onto
multiple lines, even if that makes the line longer than 80 characters
(b) if a string exceeds 80 characters, it has to be the first thing
besides whitespace on that line.
>
> Also, it seems something is wrong with the patch format. Patchwork shows
> some oddities:
>
> http://patchwork.ozlabs.org/patch/422408/

What oddity do you see there? Looks like it wraps my long string
around, but it's not wrapped in my email (is it?).
>
> --
> Ezequiel Garcia, VanguardiaSur
> www.vanguardiasur.com.ar
