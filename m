Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP4wD-0004cM-Gl
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 12:15:31 +0000
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA11F20989
 for <linux-mtd@lists.infradead.org>; Tue, 20 Nov 2018 12:15:17 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id l15-v6so1424400lja.9
 for <linux-mtd@lists.infradead.org>; Tue, 20 Nov 2018 04:15:17 -0800 (PST)
MIME-Version: 1.0
References: <CAJKOXPdPnha1-1dCRFaPZ-CGzS1OzNcFrxuOJmWstHJcRAMZwg@mail.gmail.com>
 <20181120113326.0d4f061e@xps13>
 <CAJKOXPcrVXdCXqmxffJca7HfEV3G3agkzjWu1rfsNDDbMzc_XQ@mail.gmail.com>
 <20181120130859.78d53da3@bbrezillon>
In-Reply-To: <20181120130859.78d53da3@bbrezillon>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 20 Nov 2018 13:15:04 +0100
Message-ID: <CAJKOXPfgyw9tFTC=eZFVHz8us1+6RxEcnmLUi-umO2+N9vRzDg@mail.gmail.com>
Subject: Re: [BUG BISECT] Missing MTD NAND partitions - mtd: rawnand: Move the
 ->exec_op() method to nand_controller_ops
To: boris.brezillon@bootlin.com
Cc: miquel.raynal@bootlin.com, jmkrzyszt@gmail.com,
 Stefan Agner <stefan@agner.ch>, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 Nov 2018 at 13:09, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> On Tue, 20 Nov 2018 12:48:46 +0100
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> > On Tue, 20 Nov 2018 at 11:33, Miquel Raynal <miquel.raynal@bootlin.com>=
 wrote:
> > >
> > > Hi Krzysztof,
> > >
> > > Krzysztof Koz=C5=82owski <k.kozlowski.k@gmail.com> wrote on Tue, 20 N=
ov 2018
> > > 10:46:33 +0100:
> > >
> > > > Hi all,
> > > >
> > > > Since few days linux-next has problem on Freescale VF500 - MTD seem=
s
> > > > to be broken.
> > > >
> > > > Bisect pointed me to commit 7c27338c728e39ef47c83d101959aa332506969=
d
> > > > ("mtd: rawnand: Move the ->exec_op() method to nand_controller_ops"=
)
> > > > as reason of failure to find MTD partitions.
> > > >
> > > > Toradex Colibri VF50 on Iris board (ARMv7, UP, Cortext-A5, NXP VF50=
0,
> > > > 128 MB RAM, 128 MB NAND, Systemd: v232) booted from NFS root (NFSv4=
)
> > > > trying to mount UBIFS from NAND/MTD. Board uses VF610 NAND driver.
> > > >
> > > > The MTD partitions are missing entirely (nothing under /dev/mtd).
> > > > In the logs you can also see:
> > > > [    1.232161] UBI error: cannot open mtd ubi2, error -2
> > > >
> > > > Attached - dmesg.log
> > > >
> > > > Let me know if you need defconfig or any other information.
> > >
> > > Thank you very much for testing and reporting the bug!
> > >
> > > Could you please test with this diff applied [1] please? We discussed
> > > with Boris and we think it should fix your setup (and all others also
> > > impacted).
> > >
> > > [1] http://code.bulix.org/r1m99i-509201
> >
> > error: patch failed: drivers/mtd/nand/raw/nand_base.c:4399
> > error: drivers/mtd/nand/raw/nand_base.c: patch does not apply
> >
> > Maybe you have a git tree with this somewhere?
>
> Yep: https://github.com/bbrezillon/linux/tree/nand/next-fix

Works fine now, thanks!
Tested-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
