MIME-Version: 1.0
In-Reply-To: <20110824110826.GD23757@pulham.picochip.com>
References: <1314183181-4197-1-git-send-email-jason.hui@linaro.org>
	<20110824110826.GD23757@pulham.picochip.com>
Date: Wed, 24 Aug 2011 19:12:05 +0800
Message-ID: <CAB4PhKdjOpSsEKD6RyajEYajaApB2ifKPMLXwBxGb5WxQGJSfg@mail.gmail.com>
Subject: Re: [PATCH] mtd: check parts pointer before using it
From: Jason Liu <liu.h.jason@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David.Woodhouse@intel.com, patches@linaro.org, dedekind1@gmail.com,
	Jason Liu <jason.hui@linaro.org>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2011/8/24 Jamie Iles <jamie@jamieiles.com>:
> Hi Jason,
>
> On Wed, Aug 24, 2011 at 06:53:01PM +0800, Jason Liu wrote:
>> The code has the check for parts but it called after kmemdup,
>> kmemdup(parts, sizeof(*parts) * nr_parts,...)
>> if (!parts)
>> =A0 =A0 =A0 return -ENOMEM
>>
>> In fact, we need check parts before safely using it.
>>
>> Signed-off-by: Jason Liu <jason.hui@linaro.org>
>> Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>> Cc: Artem Bityutskiy <artem.bityutskiy@intel.com>
>>
>> ---
>> This patch is based on git://git.infradead.org/users/dedekind/l2-mtd-2.6=
.git
>> ---
>> =A0drivers/mtd/mtdcore.c | =A0 =A04 +---
>> =A01 files changed, 1 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index 09bdbac..ce59ff5 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -465,12 +465,10 @@ int mtd_device_parse_register(struct mtd_info *mtd=
, const char **types,
>> =A0 =A0 =A0 struct mtd_partition *real_parts;
>>
>> =A0 =A0 =A0 err =3D parse_mtd_partitions(mtd, types, &real_parts, parser=
_data);
>> - =A0 =A0 if (err <=3D 0 && nr_parts) {
>> + =A0 =A0 if (err <=3D 0 && nr_parts && !parts) {
>
> I don't think this is right. =A0Don't we want to check that parts is !=3D
> NULL? =A0So
>
> =A0 =A0 =A0 =A0if (err <=3D 0 && nr_parts && parts)
>
> instead? =A0We don't want to kmemdup() NULL.

My bad,  I type it error. Thanks for it.

>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 real_parts =3D kmemdup(parts, sizeof(*parts)=
 * nr_parts,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0G=
FP_KERNEL);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D nr_parts;
>> - =A0 =A0 =A0 =A0 =A0 =A0 if (!parts)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D -ENOMEM;
>
> I think this hunk should be changed to:
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!real_parts)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D -ENOMEM;
>
> and keep the check so that we're checking kmemdup()'s allocation is
> successful.

Yes, correct. Thanks,

>
> Jamie
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>
