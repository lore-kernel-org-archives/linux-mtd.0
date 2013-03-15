Received: from mail-oa0-f54.google.com ([209.85.219.54])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UGXis-0004UM-3N
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2013 16:43:15 +0000
Received: by mail-oa0-f54.google.com with SMTP id n12so3642924oag.13
 for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2013 09:43:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <51434BAC.4080003@hauke-m.de>
References: <1363343486-3084-1-git-send-email-zajec5@gmail.com>
 <51434BAC.4080003@hauke-m.de>
Date: Fri, 15 Mar 2013 17:43:11 +0100
Message-ID: <CACna6rxL5zV8xbJS3nwVi_w_4KXoR2uYKMCfNNEA8u6k1m22Dg@mail.gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxsflash: implement chip polling
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/3/15 Hauke Mehrtens <hauke@hauke-m.de>:
> On 03/15/2013 11:31 AM, Rafa=C5=82 Mi=C5=82ecki wrote:
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>> ---
>>  drivers/mtd/devices/bcm47xxsflash.c |   56 ++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 56 insertions(+)
>>
>> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/b=
cm47xxsflash.c
>> index 2f9e629..75f3cf0 100644
>> --- a/drivers/mtd/devices/bcm47xxsflash.c
>> +++ b/drivers/mtd/devices/bcm47xxsflash.c
>> @@ -1,6 +1,7 @@
>>  #include <linux/kernel.h>
>>  #include <linux/module.h>
>>  #include <linux/slab.h>
>> +#include <linux/delay.h>
>>  #include <linux/mtd/mtd.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/bcma/bcma.h>
>> @@ -12,6 +13,58 @@ MODULE_DESCRIPTION("Serial flash driver for BCMA bus"=
);
>>
>>  static const char * const probes[] =3D { "bcm47xxpart", NULL };
>>
>> +/**************************************************
>> + * Various helpers
>> + **************************************************/
>> +
>> +static void bcm47xxsflash_cmd(struct bcm47xxsflash *b47s, u32 opcode)
>> +{
>> +     int i;
>> +
>> +     bcma_cc_write32(b47s->bcma_cc, BCMA_CC_FLASHCTL,
>> +                     BCMA_CC_FLASHCTL_START | opcode);
>
> Why do you access the bcma write function directly? When you are adding
> support for serial flash on ssb you have to double this and probably all
> the other functions. I would suggest you using some bus abstraction like
> it you did it in b43.

To be honest, I had bus abstraction in my code. I removed it because
of Artem's comments in last patchset. He said he doesn't have a proof
I'll ever add SSB support and told me to remove code that prepared
bcm47xxsflash for abstracting bus type.

Of course when adding support for SSB, I'll have to rewrite the code
I've just proposed. I also don't like this idea, but made it that way
to get it mainline. If we want to make it "the wise" way, with
designing code for bus abstraction at this point, we have to discuss
that with Artem.

@Artem: what do you think about this? Personally I'd prefer to start
designing bcm47xxsflash with keeping bus abstraction in mind.

--=20
Rafa=C5=82
