Received: from smtp.exceet.ch ([77.245.33.226])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1emMYS-0000tU-J3
 for linux-mtd@lists.infradead.org; Thu, 15 Feb 2018 16:38:42 +0000
From: Schrempf Frieder <frieder.schrempf@exceet.de>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Vignesh R <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>, "Brian
 Norris" <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, Peter Pan
 <peterpansjtu@gmail.com>, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 =?iso-8859-2?Q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>, Kamal Dasu
 <kdasu.kdev@gmail.com>
Subject: Re: [RFC PATCH 4/6] spi: ti-qspi: Implement the spi_mem interface
Date: Thu, 15 Feb 2018 16:38:19 +0000
Message-ID: <510aa7be-31d5-99d3-1830-0dc64e5086c5@exceet.de>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-5-boris.brezillon@bootlin.com>
 <6a9eaaaf-20a6-b332-03d0-9d16e24d0b3d@ti.com>
 <20180212133158.3032442f@bbrezillon>
 <67e61203-a2e9-853c-6cda-7226499611c2@ti.com>
 <20180212170809.3f0b5e20@bbrezillon>
 <0944fefa-6ef8-a93a-dad6-660044b8ec8e@ti.com>
 <20180214200952.6a8578dc@bbrezillon>
 <561c779b-28b1-ac8a-6b27-46b5ac59344b@exceet.de>
 <20180214220002.6f4f5ab6@bbrezillon>
In-Reply-To: <20180214220002.6f4f5ab6@bbrezillon>
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-2"
Content-ID: <2806FC392CF08A47A2B244CDACDBC39A@exceet.ch>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 14.02.2018 22:00, Boris Brezillon wrote:
> On Wed, 14 Feb 2018 20:44:20 +0000
> Schrempf Frieder <frieder.schrempf@exceet.de> wrote:
>=20
>> Hi Boris, hi Vignesh,
>>
>> On 14.02.2018 20:09, Boris Brezillon wrote:
>>> On Wed, 14 Feb 2018 21:55:10 +0530
>>> Vignesh R <vigneshr@ti.com> wrote:
>>>   =20
>>>> On 12-Feb-18 9:38 PM, Boris Brezillon wrote:
>>>>> On Mon, 12 Feb 2018 21:30:09 +0530
>>>>> Vignesh R <vigneshr@ti.com> wrote:
>>>>>      =20
>>>>>> On 12-Feb-18 6:01 PM, Boris Brezillon wrote:
>>>>>>> On Mon, 12 Feb 2018 17:13:55 +0530
>>>>>>> Vignesh R <vigneshr@ti.com> wrote:
>>>>>>>        =20
>>>>>>>> On Tuesday 06 February 2018 04:51 AM, Boris Brezillon wrote:
>>>>>>>>> From: Boris Brezillon <boris.brezillon@free-electrons.com>
>>>>>>>>>
>>>>>>>>> The spi_mem interface is meant to replace the spi_flash_read() on=
e.
>>>>>>>>> Implement the ->exec_op() method so that we can smoothly get rid =
of the
>>>>>>>>> old interface.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.co=
m>
>>>>>>>>> ---
>>>>>>>>>   =A0 drivers/spi/spi-ti-qspi.c | 85 ++++++++++++++++++++++++++++=
+++++++++++--------
>>>>>>>>>   =A0 1 file changed, 72 insertions(+), 13 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.=
c
>>>>>>>>> index c24d9b45a27c..40cac3ef6cc9 100644
>>>>>>>>> --- a/drivers/spi/spi-ti-qspi.c
>>>>>>>>> +++ b/drivers/spi/spi-ti-qspi.c
>>>>>>>>
>>>>>>>> [...]
>>>>>>>>        =20
>>>>>>>>> +static const struct spi_controller_mem_ops ti_qspi_mem_ops =3D {
>>>>>>>>> +=A0=A0 .exec_op =3D ti_qspi_exec_mem_op,
>>>>>>>>
>>>>>>>>   =A0=A0=A0=A0=A0=A0=A0 .supports_op =3D ti_qspi_supports_mem_op,
>>>>>>>>
>>>>>>>> Its required as per spi_controller_check_ops() in Patch 1/6
>>>>>>>        =20
>>>>>>> ->supports_op() is optional, and if it's missing, the core will do =
the
>>>>>>> regular QuadSPI/DualSPI/SingleSPI check (see spi_mem_supports_op()
>>>>>>> implementation).
>>>>>>
>>>>>> You might have overlooked spi_controller_check_ops() from Patch 1/6:
>>>>>> +static int spi_controller_check_ops(struct spi_controller *ctlr)
>>>>>> +{
>>>>>> +	/*
>>>>>> +	 * The controller can implement only the high-level SPI-memory
>>>>>> +	 * operations if it does not support regular SPI transfers.
>>>>>> +	 */
>>>>>> +	if (ctlr->mem_ops) {
>>>>>> +		if (!ctlr->mem_ops->supports_op ||
>>>>>> +		    !ctlr->mem_ops->exec_op)
>>>>>> +			return -EINVAL;
>>>>>> +	} else if (!ctlr->transfer && !ctlr->transfer_one &&
>>>>>> +		   !ctlr->transfer_one_message) {
>>>>>> +		return -EINVAL;
>>>>>> +	}
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>>
>>>>>> So if ->supports_op() is not populated by SPI controller driver, the=
n
>>>>>> driver probe fails with -EINVAL. This is what I observed on my TI
>>>>>> hardware when testing this patch series.
>>>>>
>>>>> Correct. Then I should fix spi_controller_check_ops() to allow empty
>>>>> ctlr->mem_ops->supports_op.
>>>>>      =20
>>>>>>     =20
>>>>>>> This being said, if you think a custom ->supports_op()
>>>>>>> implementation is needed for this controller I can add one.
>>>>>>>        =20
>>>>>>
>>>>>> spi_mem_supports_op() should suffice for now if above issue is fixed=
.
>>>>>
>>>>> Cool. IIUC, you tested the series on a TI SoC. Does it work as
>>>>> expected? Do you see any perf regressions?
>>>>>      =20
>>>>
>>>> I am planning to collect throughput numbers with this series for TI
>>>> QSPI. I don't think there would be noticeable degradation.
>>>
>>> Ok.
>>>   =20
>>>> But, it would be interesting to test for a driver thats now under
>>>> drivers/mtd/spi-nor moved to drivers/spi and see if added overhead of
>>>> m25p80 layer + spi core has any impact.
>>>
>>> I'm working with Frieder on the fsl-qspi rework, so we should have
>>> numbers soon.
>>
>> I made a speed comparison between fsl-quadspi.c and Boris'
>> spi-fsl-qspi.c using a Micron MT25QL512 64MB NOR: [1]
>>
>> It seems like the spi-mem-based driver is slower up to about 40%.
>=20
> Ouch, not good! Are you sure the clk is running at the same freq (you
> can check /sys/kernel/debug/clk/clk_summary)?
>=20
> I guess the read path is optimized by some kind of pre-fetching (that's
> particularly true for the 'read eraseblock' test where we see a 50%
> gain with the old driver) which can't be done with the new driver (at
> least in its current state). What I'm more surprised about is the
> difference in the write speed.

So as Boris and I found out, moving the clk_prep_enable/disable() calls=20
out of exec_op() improves performance a lot.

The write performance for single eraseblocks is still slower (~12%).
But apart from that the other values are almost equal or even faster.

As Boris tried out with his SPI NAND implementation, an other measure to=20
improve performance is to use polling while waiting for the completion=20
of a flash operation, as the current implementation with interrupt=20
causes "long" scheduling latency delays.

>=20
>>
>> I had to remove USE_FSR, as FSR read/write doesn't work with both driver=
s:
>>
>> -       { "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K |
>> USE_FSR | SPI_NOR_QUAD_READ) },
>> +       { "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K |
>> SPI_NOR_QUAD_READ) },
>>
>> For the spi-mem driver I set spi-tx-bus-width =3D <1> to match with
>> fsl-quadspi.c (does not use quad write).
>> My dts looks like this for both cases:
>>
>> &qspi {
>>       pinctrl-names =3D "default";
>>       pinctrl-0 =3D <&pinctrl_qspi>;
>>       status =3D "okay";
>>
>>       flash0: n25q512ax3@0 {
>>           #address-cells =3D <1>;
>>           #size-cells =3D <1>;
>>           compatible =3D "micron,n25q512ax3", "jedec,spi-nor";
>>           spi-max-frequency =3D <108000000>;
>>           spi-rx-bus-width =3D <4>;
>>           spi-tx-bus-width =3D <1>;
>>           reg =3D <0>;
>>       };
>> };
>>
>> Regards,
>>
>> Frieder
>>
>> [1]: https://paste.ee/p/dc9KM

Regards,

Frieder
