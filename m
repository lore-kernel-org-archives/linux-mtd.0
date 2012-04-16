Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SJeKI-0001iA-84
 for linux-mtd@lists.infradead.org; Mon, 16 Apr 2012 05:18:10 +0000
Received: by ghbf11 with SMTP id f11so2522113ghb.36
 for <linux-mtd@lists.infradead.org>; Sun, 15 Apr 2012 22:18:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJiQ=7BkkV9voMTcTz5CACV8WwgWdbMPU1H2NZ+5BaJoWvqOKw@mail.gmail.com>
References: <CACPZLaXx3gHRZKxd=kD8rGUe5S4=Dc=NZhgbO1ND62w5FeaeqQ@mail.gmail.com>
 <CAJiQ=7BkkV9voMTcTz5CACV8WwgWdbMPU1H2NZ+5BaJoWvqOKw@mail.gmail.com>
From: John Williams <john.williams@petalogix.com>
Date: Mon, 16 Apr 2012 15:17:48 +1000
Message-ID: <CACPZLaVGCyMZNDk3mKhb=O4GMEO8+HBZpd1tm2enimYAL7BjMA@mail.gmail.com>
Subject: Re: QSPI support in MTD
To: Kevin Cernekee <cernekee@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Michal Simek <michal.simek@petalogix.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Wendy Liang <wendy.liang@petalogix.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Kevin,

Thanks for the quick reply.

On Mon, Apr 16, 2012 at 2:52 PM, Kevin Cernekee <cernekee@gmail.com> wrote:
> On Sun, Apr 15, 2012 at 8:44 PM, John Williams
> <john.williams@petalogix.com> wrote:
>> We are looking into adding support for QSPI flash devices in MTD.
>
> I like this idea. =A0SPI flash throughput has been growing by leaps and
> bounds in recent years, and it would be great to have a clean way to
> support the new modes in the m25p80 driver.

Agreed.  'clean' is looking like the difficult bit because at first
glance QSPI seems to break the abstraction between the controller, the
bus and the device.

>> =A04. hope that the PCB is actually connected for QSPI
>
> [snip]
>
>> Point (4) probably must remain at the 'hope' level - if there's a
>> QSPI-capable controller connected to a QSPI-capable flash device, then
>> short a destructive test where we speculatively write then read back a
>> page using quad mode, I'm not sure how we can ever hope to know with
>> any certainty that the board is actually wired for QSPI operations.
>
> It might suffice to just add "number of data lines" into the
> spi_board_info struct. =A0After all, you already have to manually
> specify a bunch of other board/device parameters: the driver, chip
> selects, SPI_MODE_{0,3}, max speeds, ...

Seems reasonable, will have to run it past the SPI layer folks to get
some opinions.

>> =A01. query the device's support for QSPI (vendor/device specific)
>
> I was hoping that JEDEC SFDP would simplify this stuff, but it seems
> like innovation is outpacing standardization.

Indeed.  For N=3D2 devices, we've seen M=3D2 different implementations.
It's not a good start.

> You'll probably also want to have a way to figure out the highest
> supported clock rate on both the controller and the flash device.
>
>> =A05. if (1),(3) and (4) are all true, use QPAGE read/write commands for
>> data transfer (vendor/device specific - maybe).
>>
>> There's an awful lot of vendor and device specificity there
>
> Not only are the QSPI commands different; there are also variations in
> the command/address phases. =A0e.g. some flash chips want the address
> bytes to be sent in 1-bit mode; others want (or at least allow) them
> to be sent in 4-bit mode.
>
>> =A0* add some property on the SPI controllers themselves regarding QSPI
>> support, and have this be queried by the flash driver
>
> This would also require extending the SPI master APIs.
>
> Couple possible wrinkles here:
>
> Some QSPI controllers (especially on an ASIC) might not support all
> the latest and greatest features. =A0e.g. they might not support 4-bit
> mode for the address/command phases; they might be limited to 2-bit
> mode; they might only be able to handle 3-byte addresses; or they
> might support read-only operation, but require reversion to slow 1-bit
> mode for programming. =A0Ideally m25p80 would be able to degrade
> gracefully when appropriate.
>
> The QSPI controller won't necessarily be able to handle
> sending/receiving arbitrary data over SPI in quad mode. =A0Which means
> that the SPI layer might have to become aware of higher level
> operations like "read N bytes from the serial flash at address X,"
> rather than dealing with raw SPI data.

Right.  In fact it seems like QSPI totally breaks the SPI abstraction.
 I'd like to be wrong about this but it looks like a hardware hack
that has stuck because it was useful.

If you look for example at the driver for the Xilinx Zynq QSPI
controller, it's cracking open the SPI commands looking for
storage-related commands, and dynamically translating/rewriting them.

http://git.xilinx.com/?p=3Dlinux-2.6-xlnx.git;a=3Dblob;f=3Ddrivers/spi/xili=
nx_qspips.c;h=3D838c0f8d35aaeff94845648f090b275efeb5ca06;hb=3DHEAD

around line 594


> The QSPI controller may have different max_speed_hz values for 1-bit vs. =
4-bit.
>
>
> Are you guys designing a new QSPI IP core from scratch, or using an
> existing one?

Our first target is the Xilinx SPI controller - originally 1-bit but
recently extended to add QSPI support, while remaining register
compatible with the original.

http://www.xilinx.com/support/documentation/ip_documentation/axi_quad_spi/v=
1_00_a/ds843_axi_quad_spi.pdf

There's also the QSPI-capable controller in the latest Xilinx Zynq
familes - no publicly available datasheet yet, but see link to driver
posted above.

Regards,

John



--=20
John Williams, PhD, B. Eng, B. IT
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com=A0=A0p: +61-7-30090663=A0 f: +61-7-30090663
