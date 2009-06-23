Received: from yw-out-1718.google.com ([74.125.46.157])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJB0m-0006ld-KL
	for linux-mtd@lists.infradead.org; Tue, 23 Jun 2009 18:46:35 +0000
Received: by yw-out-1718.google.com with SMTP id 5so122188ywr.72
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Jun 2009 11:46:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A4121DA.6050802@harris.com>
References: <4A3FEE98.60700@harris.com>
	<8bd0f97a0906221404x7536c6e0m822436dfb61714dc@mail.gmail.com>
	<4A4121DA.6050802@harris.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 23 Jun 2009 14:46:07 -0400
Message-ID: <8bd0f97a0906231146y7e050d01l3c24c9606b4b4bcd@mail.gmail.com>
Subject: Re: [Question] m25p80 driver versus spi clock rate
To: "Steven A. Falco" <sfalco@harris.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Brownell <david-b@pacbell.net>, Stefan Roese <sr@denx.de>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 23, 2009 at 14:41, Steven A. Falco wrote:
> Mike Frysinger wrote:
>> On Mon, Jun 22, 2009 at 16:50, Steven A. Falco wrote:
>>> I am trying to figure out how the mtd/devices/m25p80.c driver is suppos=
ed
>>> to set the spi clock speed. =C2=A0(Perhaps I'm making a bad assuption e=
ven to
>>> think that it _should_ set the clock speed. =C2=A0If so, please say so.=
)
>>
>> it shouldnt. =C2=A0this is done in the board resources via the speed_hz
>> field of the spi_board_info struct on a per-spi device setting.
>
> Thank you for the hint. =C2=A0spi_board_info has a max_speed_hz field - i=
t does
> not have a speed_hz field. =C2=A0The various platforms all seem to set
> max_speed_hz, so perhaps that is what you meant to say.
>
> In my case, max_speed_hz is being correctly set, but that doesn't seem to=
 be
> enough. =C2=A0I have traced through the calling hierarchy, and this is wh=
at I got:
>
> 1) m25p80_read builds a spi_message, and calls spi_sync to do the transfe=
r.
>
> 2) spi_sync calls spi_async. =C2=A0I added some printk, and saw speed_hz=
=3D0 and
> =C2=A0 max_speed_hz=3D50000000. =C2=A0This is consistent with my platform=
 setup (set via
> =C2=A0 a dts file).
>
> 3) spi_async calls through pointer "transfer" to spi_bitbang_transfer (be=
cause
> =C2=A0 the PPC4xx driver doesn't set its own transfer handler).
>
> 4) spi_bitbang_transfer calls spi_master_get_devdata, then enqueues the w=
ork
>
> 5) bitbang_work iterates through the queued transfers, and if speed_hz is
> =C2=A0 non-zero, bitbang_work calls through setup_transfer to spi_ppc4xx_=
setupxfer
> =C2=A0 which would set the divisor. =C2=A0But, as noted in step 2, speed_=
hz=3D0, so the
> =C2=A0 spi bus speed is not set. =C2=A0Rather, it remains at whatever spe=
ed some other
> =C2=A0 device chose.
>
> Note that bitbang_work looks at speed_hz, not max_speed_hz. =C2=A0So, I c=
ome back to
> the same problem. =C2=A0Somehow speed_hz must be set in order to make bit=
bang_work
> call setup_transfer, yet the only place that seems to happen is in spidev=
.

sounds like the bitbang SPI bus driver is broken.  if speed_hz is 0,
then the bus driver should fall back to the max_speed_hz from the spi
resources.
-mike
