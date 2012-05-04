Message-ID: <4FA3AEDF.8010009@freescale.com>
Date: Fri, 4 May 2012 18:26:39 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] mtd: gpmi: add device tree support to gpmi-nand
References: <1336101182-5200-1-git-send-email-b32955@freescale.com>
 <1336124510.4275.7.camel@sauron.fi.intel.com>
In-Reply-To: <1336124510.4275.7.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: shawn.guo@linaro.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B405=E6=9C=8804=E6=97=A5 17:41, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Fri, 2012-05-04 at 11:13 +0800, Huang Shijie wrote:
>> This patch just adds the DT support to gpmi-nand.
>>
>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>> ---
>> Please select the CONFIG_USE_OF before you do the compiler-test.
>> thanks.
> It should compile without CONFIG_USE_OF also just fine. Currently it
> does not.
>
why not select CONFIG_USE_OF as the gpmi-nand is converted to a DT driver=
.

If you insist that it should compile without CONFIG_USE_OF, i have to=20
add back the header file ,
such as of_irq.h.

BR
Huang Shijie
