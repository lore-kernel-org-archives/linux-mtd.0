Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SzedG-000180-0r
 for linux-mtd@lists.infradead.org; Fri, 10 Aug 2012 02:07:23 +0000
Message-ID: <50246D36.1050405@freescale.com>
Date: Fri, 10 Aug 2012 10:08:54 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: Kernel crashes when CONFIG_MTD_NAND_VERIFY_WRITE=y
References: <CAOMZO5DuG9m-SCPPxza=VFMmcWrGnp3Brry6nS8XHrCSzQqM7g@mail.gmail.com>	<201208100153.51140.marex@denx.de>	<CAOMZO5BCjV6iLUiQ74GskkOdgGpdqbo2ZB=7eu6VeY=mNwWf0Q@mail.gmail.com>	<201208100341.23167.marex@denx.de>
 <CAOMZO5DeXp65H2vgtp5qGhV+tXVMuR8sXESc1CzJcJZ2WcmW-A@mail.gmail.com>
In-Reply-To: <CAOMZO5DeXp65H2vgtp5qGhV+tXVMuR8sXESc1CzJcJZ2WcmW-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Marek Vasut <marex@denx.de>, Shawn Guo <shawn.guo@linaro.org>,
 Subodh Nijsure <snijsure@grid-net.com>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B408=E6=9C=8810=E6=97=A5 09:49, Fabio Estevam =E5=86=
=99=E9=81=93:
> On Thu, Aug 9, 2012 at 10:41 PM, Marek Vasut<marex@denx.de>  wrote:
>
>> NAK! This is only a workaround, proper implementation is needed. If it=
's not
>> implemented now, I'm pretty sure such workaround will be there forever=
.
> I know, please see below.
>
>>>   /*
>>>    * Handles block mark swapping.
>>>    * It can be called in swapping the block mark, or swapping it back=
,
>>> @@ -1568,6 +1577,7 @@ static int __devinit gpmi_nfc_init(struct
>>> gpmi_nand_data *this)
>>>          chip->ecc.size          =3D 1;
>>>          chip->ecc.strength      =3D 8;
>>>          chip->ecc.layout        =3D&gpmi_hw_ecclayout;
>>> +       chip->verify_buf        =3D gpmi_verify_buf;
>>>          if (of_get_nand_on_flash_bbt(this->dev->of_node))
>>>                  chip->bbt_options |=3D NAND_BBT_USE_FLASH | NAND_BBT=
_NO_OOB;
>>>
>>> Now we need to come up with a real  gpmi_verify_buf function ;-)
I does have a real gpmi_verify_buf function in our BSP code.

I will send it out as soon as possible.

thanks
Huang Shijie




> As I mentioned, I understand that a proper function needs to be created=
.
>
> Regards,
>
> Fabio Estevam
>
