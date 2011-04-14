Message-ID: <4DA696FA.90804@freescale.com>
Date: Thu, 14 Apr 2011 14:40:58 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Subject: Re: [PATCH v5 2/4] MTD : add the common code for GPMI controller
	driver
References: <1302675881-18862-1-git-send-email-b32955@freescale.com>	<1302675881-18862-3-git-send-email-b32955@freescale.com>	<19877.65411.687158.113390@ipc1.ka-ro>	<4DA659D0.9030504@freescale.com>
	<19878.38524.705271.384302@ipc1.ka-ro>
In-Reply-To: <19878.38524.705271.384302@ipc1.ka-ro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux@arm.linux.org.uk, David.Woodhouse@intel.com, dedekind1@gmail.com,
	linux-mtd@lists.infradead.org, ffainelli@freebox.fr,
	veli-pekka.peltola@bluegiga.com, shijie8@gmail.com,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi:
> Hi,
>
> Huang Shijie writes:
>>>> +	this->swap_block_mark =3D true;
>>>> +	if (GPMI_IS_MX23(this))
>>>> +		this->swap_block_mark =3D false;
>>>>
>>> if ... else ...?
>> else is "true" by default.
>>
> I meant it would be clearer to do:
> 	if (GPMI_IS_MX23(this))
> 		this->swap_block_mark =3D false;
> 	else
> 		this->swap_block_mark =3D true;
>
:)

thanks.

Huang Shijie
> Lothar Wa=C3=9Fmann
