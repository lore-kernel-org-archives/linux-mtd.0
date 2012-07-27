Message-ID: <50126BC4.2010709@freescale.com>
Date: Fri, 27 Jul 2012 18:21:56 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v2 3/3] ARM: imx_v6_v7_defconfig: Select MXS_DMA
References: <1343215100-24005-1-git-send-email-festevam@gmail.com>
 <1343215100-24005-3-git-send-email-festevam@gmail.com>
 <CAMiH66EA4O0s8hfXkr_SJ56+q7eZ8w0=3C1r_C+m2Os1RxprmA@mail.gmail.com>
 <CAOMZO5BfT+_7x4F96Kvqtq5STXxw2Y9CxbCCAc_UnZ-3wy0qxg@mail.gmail.com>
 <CAMiH66FUxiw0B8iD5rYi=nUX0VYZBzOKifXKfTqd1RmSHhC80g@mail.gmail.com>
 <CAOMZO5DUN5d_aN=j8bfj6n3of=r2A-mu+jqNXCR-4HVTA7kS6Q@mail.gmail.com>
 <CAMiH66HCih0=zWqhwAGj+rVTW7-9vNO8y-6tC+p8R7yg=+sojw@mail.gmail.com>
 <CAOMZO5BziYJVUzniUoZmdFejso+6dBOc6QtTuzbbMyVOXuOFDQ@mail.gmail.com>
 <CAMiH66E9gJJ7f=wKJ8Ondegj=+WUYYuDA0iB8mhNoWBRNWXKsQ@mail.gmail.com>
 <50125FC3.4040603@de.bosch.com>
In-Reply-To: <50125FC3.4040603@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Fabio Estevam <festevam@gmail.com>, Richard Zhao <richard.zhao@freescale.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "Artem.Bityutskiy@linux.intel.com" <Artem.Bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 Huang Shijie <shijie8@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B407=E6=9C=8827=E6=97=A5 17:30, Dirk Behme =E5=86=99=
=E9=81=93:
> On 26.07.2012 13:32, Huang Shijie wrote:
>> On Thu, Jul 26, 2012 at 7:08 AM, Fabio Estevam <festevam@gmail.com>=20
>> wrote:
>>> On Thu, Jul 26, 2012 at 7:56 AM, Huang Shijie <shijie8@gmail.com>=20
>>> wrote:
>>>> On Thu, Jul 26, 2012 at 6:53 AM, Fabio Estevam <festevam@gmail.com>=20
>>>> wrote:
>>>>> On Wed, Jul 25, 2012 at 11:24 PM, Huang Shijie <shijie8@gmail.com>=20
>>>>> wrote:
>>>>>
>>>>>> But you have added "depend on MXS_DMA". So If you do not select th=
e
>>>>>> mxs-dma, you can not see the
>>>>>> gpmi-nand.
>>>>>> that's why i think this patch is not needed.
>>>>> So how CONFIG_MXS_DMA would be selected if not via defconfig?
>>>> Use the make menuconfig ARCH=3Darm:
>>>>
>>>> "device drivers"-->"DMA engine support" -->"mxs dma support"
>>> I prefer to have selected in the defconfig by default instead.
>>>
>>> It is not obvious for the end user that they need to manually select
>>> this option.
>>>
>>> mxs_defconfig also selects CONFIG_MXS_DMA.
>> In mx23/mx28, the mxs-dma has many users, so it's proper to make it=20
>> default.
>>
>>> Can't we do the same here and let imx_v6_v7_defconfig be built again?
>> Shawn, do you have any opinion about this?
>
> First, I think Shawn is on holiday at the moment.
>
> Second, recent kernel mainline from today building imx_v6_v7_defconfig=20
> is broken due to this.
Sascha did not CC to me when he submitted the patch 3def84ed9 "ARM:=20
imx_v6_v7_defconfig: ..".

I would check this patch if he CCed to me.

BR
Huang Shijie


>
> So to make it build again, we have to enable CONFIG_MXS_DMA anyhow. As=20
> it seems that GPMI_NAND needs it to build, I would vote for the
>
> depends on MXS_DMA
>
> fix proposed by Richard
>
> http://www.spinics.net/lists/arm-kernel/msg186111.html
>
> Anyhow, any chance to get the kernel mainline fixed asap?
>
> Many thanks and best regards
>
> Dirk
>
>
