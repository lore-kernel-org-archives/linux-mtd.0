Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP3Lr-0006ZM-8M
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 10:33:52 +0000
Date: Tue, 20 Nov 2018 11:33:26 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof =?UTF-8?B?S296xYJvd3NraQ==?= <k.kozlowski.k@gmail.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Janusz Krzysztofik
 <jmkrzyszt@gmail.com>, Stefan Agner <stefan@agner.ch>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG BISECT] Missing MTD NAND partitions - mtd: rawnand: Move
 the ->exec_op() method to nand_controller_ops
Message-ID: <20181120113326.0d4f061e@xps13>
In-Reply-To: <CAJKOXPdPnha1-1dCRFaPZ-CGzS1OzNcFrxuOJmWstHJcRAMZwg@mail.gmail.com>
References: <CAJKOXPdPnha1-1dCRFaPZ-CGzS1OzNcFrxuOJmWstHJcRAMZwg@mail.gmail.com>
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

Hi Krzysztof,

Krzysztof Koz=C5=82owski <k.kozlowski.k@gmail.com> wrote on Tue, 20 Nov 2018
10:46:33 +0100:

> Hi all,
>=20
> Since few days linux-next has problem on Freescale VF500 - MTD seems
> to be broken.
>=20
> Bisect pointed me to commit 7c27338c728e39ef47c83d101959aa332506969d
> ("mtd: rawnand: Move the ->exec_op() method to nand_controller_ops")
> as reason of failure to find MTD partitions.
>=20
> Toradex Colibri VF50 on Iris board (ARMv7, UP, Cortext-A5, NXP VF500,
> 128 MB RAM, 128 MB NAND, Systemd: v232) booted from NFS root (NFSv4)
> trying to mount UBIFS from NAND/MTD. Board uses VF610 NAND driver.
>=20
> The MTD partitions are missing entirely (nothing under /dev/mtd).
> In the logs you can also see:
> [    1.232161] UBI error: cannot open mtd ubi2, error -2
>=20
> Attached - dmesg.log
>=20
> Let me know if you need defconfig or any other information.

Thank you very much for testing and reporting the bug!

Could you please test with this diff applied [1] please? We discussed
with Boris and we think it should fix your setup (and all others also
impacted).

[1] http://code.bulix.org/r1m99i-509201


Thanks,
Miqu=C3=A8l
