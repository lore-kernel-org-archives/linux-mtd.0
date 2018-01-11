Date: Thu, 11 Jan 2018 23:24:17 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@free-electrons.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Eric Miao <eric.y.miao@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ezequiel
 Garcia <ezequiel.garcia@free-electrons.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>,
 Ofer Heifetz <oferh@marvell.com>, Hanna Hawa <hannah@marvell.com>, Neta Zur
 Hershkovits <neta@marvell.com>, Willy Tarreau <w@1wt.eu>, Sean Nyekjaer
 <sean.nyekjaer@prevas.dk>
Subject: Re: [PATCH v3 0/7] Marvell NAND controller rework with ->exec_op()
Message-ID: <20180111232417.4aa86075@xps13>
In-Reply-To: <87efmwb8bj.fsf@belgarion.home>
References: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
 <20180111122751.4bd74366@bbrezillon>
 <87efmwb8bj.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Robert,

On Thu, 11 Jan 2018 18:42:56 +0100
Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> Boris Brezillon <boris.brezillon@free-electrons.com> writes:
>=20
> Hi Boris and Miquel,
>=20
> > So, here is the plan: since the driver has been tested on various
> > mvebu platforms and is known to work fine on these platforms, I'd
> > like to queue the driver and the patch modifying mvebu defconfigs
> > (patches 1 to 4) for 4.16.
> That's all right.
>=20
> > I'll leave other patches for 4.17, which means I'd like remaining
> > bugs to be fixed during the 4.16 release cycle so that we can
> > eventually get rid of the old driver. That's really important to me
> > that we don't keep both drivers around for too long, because my
> > previous experience showed that, when you have 2 drivers for the
> > same HW, people don't switch to the new one until they're forced to
> > do it.
> >
> > Robert, are you fine with this approach? What about the tests you
> > were doing? Did you make any progress? Did you find other issues?
> So far, with the latest branch from Miquel of tip commit 12b9e62c851c
> ("ARM64: dts: marvell: use reworked NAND controller driver on Armada
> 8K"), the bad blocks issue is still there, ie :
>  - the old pxa3xx driver doesn't see any bad block and mounts the
> ext2/ubifs correctly
>  - barebox doesn't see any bad block
>  - marvell_nand sees all (or most all) blocks as bad with
> "flash_bbt=3D0" in platform data, which is very surprising
>=20
> I'm really surprised that in your tests on the cm_x300, in a
> platform_data setup (ie. not device-tree setup), you're not seeing
> these errors ...

I have no problems with the cm_x300 board (using platform data) but
there is one big difference: the bootloader. You are using Barebox
while I am using U-Boot.

Please pull this branch which is for testing purpose [1].

There are two "HACK"s:
1/ Dump the timing registers: this is to see how Barebox does
initialize these registers. I will put these values back into my setup
and see how the board reacts.
2/ Dump the OOB area while reading. This is to see why the driver
declares all blocks as bad.

Can you please run this branch first?

Then, can you please:
- boot the old driver
- dump both NDTR[0|1] registers that should be well initialized
- boot the new driver with the values previously retrieved (you can
  assign these values where exactly HACK 1/ adds the printk's).


Thank you,
Miqu=C3=A8l

[1]
https://github.com/miquelraynal/linux/commits/marvell/nand-next/nfc-pxa-bug
