Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bnOtl-00066w-1W
 for linux-mtd@lists.infradead.org; Fri, 23 Sep 2016 11:44:12 +0000
Date: Fri, 23 Sep 2016 13:43:44 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jan Glauber <jan.glauber@caviumnetworks.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: Question about nand_scan()
Message-ID: <20160923134344.715638a4@bbrezillon>
In-Reply-To: <20160923112944.GB4580@hardcore>
References: <20160923112944.GB4580@hardcore>
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

Hi Jan,

On Fri, 23 Sep 2016 13:29:44 +0200
Jan Glauber <jan.glauber@caviumnetworks.com> wrote:

> Hi all,
>=20
> I'm working on a driver for the NAND controller on Cavium's ThunderX.
>=20
> So far I implemented the low-level functions for using the controller
> to access a NAND chip. I can read the ONFI ID and parameter page
> with that.
>=20
> Now I wanted to use nand_scan() instead of manually reading the chip
> parameters, but it fails with "No NAND device found".
>=20
> The hardware I'm using has one NAND device wired as chip 1 (the NAND
> controller support chips 0..7).
>=20
> The reason for the failure seems to be that nand_get_flash_type()
> returns an error before all the chips are scanned. What I don't
> understand is in that function chip 0 is selected before the loop
> that would scan all chips:
>=20
>         /* Select the device */
>         chip->select_chip(mtd, 0);
>=20
> My select_chip() stores the chip number (in that case 0) and uses
> that for subsequent commands to the controller. Since there is no
> chip 0 the read returns nothing and nand_scan() fails.
>=20
> Probably I'm missing something, would be great if someone could
> help me...

Actually, the chip parameter passed to ->select_chip() is not the
CS-id from the NAND controller PoV, but the one from the NAND chip PoV.

You have to store an association table between chip=E2=81=BBCS and controll=
er-CS
somewhere in your NAND controller private struct (a struct inheriting
from nand_control_hw).

And remember that nand_scan_ident() is supposed to detect a single NAND
chip, not all the chips connected to your controller (the multi-CS
logic is here to handle multi-dies NANDs, not the case where you have
multiple NAND chips connected to the same controller).

You can have a look at the sunxi_nand [1] driver if you want an example.

Regards,

Boris

[1]http://lxr.free-electrons.com/source/drivers/mtd/nand/sunxi_nand.c#L219
