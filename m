Message-ID: <4FA33B7A.3040504@freescale.com>
Date: Fri, 4 May 2012 10:14:18 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v3] mtd: gpmi: add device tree support for mx6q and mx28
References: <1335939209-15625-1-git-send-email-b32955@freescale.com>	<20120502144008.GF2194@S2101-09.ap.freescale.net>	<1336042485.13013.41.camel@sauron.fi.intel.com>	<CAAQ0ZWSxNxtF6_1+5NDqR_ry++gKbbNLZHRSTXREG18P+kQL3w@mail.gmail.com>	<CAMiH66EBO-MHXBb1eB4NMAJo6nPN47_42jYNGUGc=GC7oejPWQ@mail.gmail.com>
 <CAAQ0ZWSqF9x7PSqS_14CscdU+RvcYg8pCFZUqLtDAq8uS_k=yw@mail.gmail.com>
In-Reply-To: <CAAQ0ZWSqF9x7PSqS_14CscdU+RvcYg8pCFZUqLtDAq8uS_k=yw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B405=E6=9C=8803=E6=97=A5 22:23, Shawn Guo =E5=86=99=E9=
=81=93:
> On 3 May 2012 22:14, Huang Shijie<shijie8@gmail.com>  wrote:
>> It's better that this patch is merged by l2-mtd, because this patch
>> depends on another patch which is
>> on the l2-mtd now.
>>
> But you patch has to be based on mxs-dma DT support to function.
The mxs-dma is another driver (just as the pinctrl driver). I think it's=20
better to do the job in parallel.

Best Regards
Huang Shijie


> Maybe we should wait for the next merge window?
>
> Regards,
> Shawn
>
