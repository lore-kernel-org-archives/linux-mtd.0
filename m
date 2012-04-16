Received: from mail-qa0-f49.google.com ([209.85.216.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SJdvs-0001Sp-Dz
 for linux-mtd@lists.infradead.org; Mon, 16 Apr 2012 04:52:56 +0000
Received: by qafi29 with SMTP id i29so3300724qaf.15
 for <linux-mtd@lists.infradead.org>; Sun, 15 Apr 2012 21:52:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACPZLaXx3gHRZKxd=kD8rGUe5S4=Dc=NZhgbO1ND62w5FeaeqQ@mail.gmail.com>
References: <CACPZLaXx3gHRZKxd=kD8rGUe5S4=Dc=NZhgbO1ND62w5FeaeqQ@mail.gmail.com>
Date: Sun, 15 Apr 2012 21:52:52 -0700
Message-ID: <CAJiQ=7BkkV9voMTcTz5CACV8WwgWdbMPU1H2NZ+5BaJoWvqOKw@mail.gmail.com>
Subject: Re: QSPI support in MTD
From: Kevin Cernekee <cernekee@gmail.com>
To: John Williams <john.williams@petalogix.com>
Content-Type: text/plain; charset=UTF-8
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

On Sun, Apr 15, 2012 at 8:44 PM, John Williams
<john.williams@petalogix.com> wrote:
> We are looking into adding support for QSPI flash devices in MTD.

I like this idea.  SPI flash throughput has been growing by leaps and
bounds in recent years, and it would be great to have a clean way to
support the new modes in the m25p80 driver.

>  4. hope that the PCB is actually connected for QSPI

[snip]

> Point (4) probably must remain at the 'hope' level - if there's a
> QSPI-capable controller connected to a QSPI-capable flash device, then
> short a destructive test where we speculatively write then read back a
> page using quad mode, I'm not sure how we can ever hope to know with
> any certainty that the board is actually wired for QSPI operations.

It might suffice to just add "number of data lines" into the
spi_board_info struct.  After all, you already have to manually
specify a bunch of other board/device parameters: the driver, chip
selects, SPI_MODE_{0,3}, max speeds, ...

> =C2=A01. query the device's support for QSPI (vendor/device specific)

I was hoping that JEDEC SFDP would simplify this stuff, but it seems
like innovation is outpacing standardization.

You'll probably also want to have a way to figure out the highest
supported clock rate on both the controller and the flash device.

> =C2=A05. if (1),(3) and (4) are all true, use QPAGE read/write commands f=
or
> data transfer (vendor/device specific - maybe).
>
> There's an awful lot of vendor and device specificity there

Not only are the QSPI commands different; there are also variations in
the command/address phases.  e.g. some flash chips want the address
bytes to be sent in 1-bit mode; others want (or at least allow) them
to be sent in 4-bit mode.

> =C2=A0* add some property on the SPI controllers themselves regarding QSP=
I
> support, and have this be queried by the flash driver

This would also require extending the SPI master APIs.

Couple possible wrinkles here:

Some QSPI controllers (especially on an ASIC) might not support all
the latest and greatest features.  e.g. they might not support 4-bit
mode for the address/command phases; they might be limited to 2-bit
mode; they might only be able to handle 3-byte addresses; or they
might support read-only operation, but require reversion to slow 1-bit
mode for programming.  Ideally m25p80 would be able to degrade
gracefully when appropriate.

The QSPI controller won't necessarily be able to handle
sending/receiving arbitrary data over SPI in quad mode.  Which means
that the SPI layer might have to become aware of higher level
operations like "read N bytes from the serial flash at address X,"
rather than dealing with raw SPI data.

The QSPI controller may have different max_speed_hz values for 1-bit vs. 4-=
bit.


Are you guys designing a new QSPI IP core from scratch, or using an
existing one?
