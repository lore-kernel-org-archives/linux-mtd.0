Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OlHAw-0006Ai-8z
	for linux-mtd@lists.infradead.org; Tue, 17 Aug 2010 08:05:40 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: linux-mtd@lists.infradead.org
Subject: Re: NAND ECC on a per-partition basis
Date: Tue, 17 Aug 2010 10:04:27 +0200
References: <1281969511.13433.207.camel@thunk> <4C6A3AD1.3070203@parrot.com>
In-Reply-To: <4C6A3AD1.3070203@parrot.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201008171004.28280.ffainelli@freebox.fr>
Cc: "peter.barada@gmail.com" <peter.barada@gmail.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 17 August 2010 09:31:29 Matthieu CASTET wrote:
> Peter Barada a =E9crit :
> > I'm working with a Micron POP part for an omap3530, and I need to write
> > pages in the boot block using the builtin Hamming ECC(as the bootrom
> > expects it), but the rest of the blocks I want to use the NAND's builtin
> > 4-bit ECC engine.
> >=20
> > Is there any way to specify the ECC method on a per-partition basis?
>=20
> No, but you can write in raw mode and compute the ecc in userspace.

Yes, this is a good solution. However, Linux is very likely to report bad=20
blocks in your bootloader partition, due to the ECC algorithm being differe=
nt.

At some point we might want to be able to be able to define the ECC layout =
on a=20
per-partition basis anyway. I do not say this is easy, especially as we mig=
ht=20
be switching between software/hardware ECC layouts from one block to anothe=
r.
=2D-
=46lorian
