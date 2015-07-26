Received: from mail-ig0-x22e.google.com ([2607:f8b0:4001:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJO8X-0007Aa-SK
 for linux-mtd@lists.infradead.org; Sun, 26 Jul 2015 15:46:50 +0000
Received: by igr7 with SMTP id 7so45941926igr.0
 for <linux-mtd@lists.infradead.org>; Sun, 26 Jul 2015 08:46:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55B4AC57.3070308@gmail.com>
References: <1437835063-58407-1-git-send-email-eastyjr@gmail.com>
 <1437835063-58407-3-git-send-email-eastyjr@gmail.com>
 <CACna6rxvk0pOSotaErMuhCU_-qd+e6PV+3osx9dOe-GgsiH4zQ@mail.gmail.com>
 <55B4AC57.3070308@gmail.com>
Date: Sun, 26 Jul 2015 17:46:28 +0200
Message-ID: <CACna6rx=vFtSUQy+crKhfHanVqcHNFX+_05C6Xw8RQ24R9otOw@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] mtd: bcm47xxpart.c: Adding Xaiomi board support
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Joseph East <eastyjr@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 26 July 2015 at 11:45, Joseph East <eastyjr@gmail.com> wrote:
> On 26/07/2015 4:35 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 25 July 2015 at 16:37, Joseph East <eastyjr@gmail.com> wrote:
>>> ---
>>
>> Oh and now you're sending my patch pretending its your. NACK!
>>
>
> The cover letter [PATCH 0/4] clearly states the origin of these patches.

And it doesn't go into git history at all.


> The sign-off indicates that I am compliant with http://developercertifica=
te.org/, in particular clause b)

There isn't any S-o-b for this patch. Check it yourself.


> I do not take credit for the creation for all of these patches, but I am =
pushing them.

So why did you drop "From" and Signed-of-by from original patch?


> I apologise if it appears anything was untoward, but I could not find any=
 trace of these patches being pushed elsewhere.

This could be for a good reason, e.g. patch not being tested or clean enoug=
h.

So 2 quite important rules:
1) Respect patch author, don't drop him from "From" and his S-o-b
2) Don't send patches you don't understand


>>>  drivers/mtd/bcm47xxpart.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
>>> index 55a1462..a27d185 100644
>>> --- a/drivers/mtd/bcm47xxpart.c
>>> +++ b/drivers/mtd/bcm47xxpart.c
>>> @@ -33,6 +33,7 @@
>>>  /* Magics */
>>>  #define BOARD_DATA_MAGIC               0x5246504D      /* MPFR */
>>>  #define BOARD_DATA_MAGIC2              0xBD0D0BBD
>>> +#define BOARD_DATA_XIAOMI_MAGIC        0x474D4442      /* GMDB */
>>>  #define CFE_MAGIC                      0x43464531      /* 1EFC */
>>>  #define FACTORY_MAGIC                  0x59544346      /* FCTY */
>>>  #define NVRAM_HEADER                   0x48534C46      /* FLSH */
>>> @@ -263,7 +264,8 @@ static int bcm47xxpart_parse(struct mtd_info *maste=
r,
>>>                 }
>>>
>>>                 /* Some devices (ex. WNDR3700v3) don't have a standard =
'MPFR' */
>>> -               if (buf[0x000 / 4] =3D=3D BOARD_DATA_MAGIC2) {
>>> +               if (buf[0x000 / 4] =3D=3D BOARD_DATA_MAGIC2 ||
>>> +                   le32_to_cpu(buf[0x000 / 4]) =3D=3D BOARD_DATA_XIAOM=
I_MAGIC) {
>>
>> le32_to_cpu won't work here obviously, so it seems you didn't even
>> test it on a proper device. Nack.
>
> This patch has been in OpenWrt for 6 months which you apparently signed o=
ff.
>
> https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.18/4=
31-mtd-bcm47xxpart-support-for-Xiaomi-specific-board_da.patch
>
> While true I have not tested this code path, why has this not been raised=
 earlier?
>
> At the very least it does not prevent compilation for other brcm47xx targ=
ets.
>
> That does not justify its inclusion however, and I have no issues with th=
is patch being dropped.

It's common that someone reports a problem to OpenWrt team, we try to
fix it and then wait for testing it for ever. That was the case. After
few months I can see problems with this patch but I guess it should
probably just get dropped since it has no interest at all.

--=20
Rafa=C5=82
