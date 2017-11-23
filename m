Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eHnqb-0003yA-OE
 for linux-mtd@lists.infradead.org; Thu, 23 Nov 2017 09:31:07 +0000
Date: Thu, 23 Nov 2017 10:30:34 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Belisko Marek <marek.belisko@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Richard
 Weinberger <richard.weinberger@gmail.com>, Boris Brezillon
 <Boris.Brezillon@free-electrons.com>
Subject: Re: macronix ONFI nand flash OTP support
Message-ID: <20171123103034.11f26063@xps13>
In-Reply-To: <CAAfyv35tTTFobGsA1Qr5KB_KyR94YLAiGGezu1eik=8TZfnxqg@mail.gmail.com>
References: <CAAfyv37B2yRc7gybNi3hNs=ap52bgqTCrsx4tZe_5LNb7LfzVQ@mail.gmail.com>
 <20171123095735.538118e0@xps13>
 <CAAfyv35tTTFobGsA1Qr5KB_KyR94YLAiGGezu1eik=8TZfnxqg@mail.gmail.com>
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

Hi Marek,

> >>
> >> I did check nand_do_read_ops function but it's not sending e.g.
> >> 0x30 which should be at the end of command. I'm using 4.1 kernel
> >> but checked also 4.14 and no such functionality is added even
> >> there. Nobody is using OTP area in nand flashes ;) ? Thanks for
> >> any pointers. =20
> >
> > I suppose you added some tweaks to enable OTP and use
> > nand_do_read_ops, because there is currently no implementation for
> > that in the NAND framework (I think there is something in MTD layer
> > though). But must importantly, nand_do_read_ops basically calls
> > chip->ecc.read*() which is handled by the controller driver, so
> > what driver are you using ?
> >
> > How (where) did you trace the commands sent to the NAND chip ? For
> > instance, if you just looked at the arguments of ->cmdfunc(), it is
> > normal not to see any READSTART (0x30) command as it should be added
> > automatically later in the function. If the driver implements =20
> > ->cmd_ctrl(), you may see there what exactly is sent to the
> > device. =20
> Yes I checked ->cmdfunc() output. I think my changes would be
> beneficial for other so I'll cook some patches and post for review
> here.

Can you just tell us what controller driver are you using ?

You may want to have a look at [1], which hare the MTD hooks that I
guess you could fill with you OTP related read/writes. I think you
will also need some tweaks in nanddump (or a nandotpdump thing) to
ease the validation of the implementation.

[1]
http://elixir.free-electrons.com/linux/latest/source/include/linux/mtd/mtd.=
h#L314

Thank you,
Miqu=C3=A8l
