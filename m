Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVAVn-0001Ik-F8
 for linux-mtd@lists.infradead.org; Tue, 19 Jun 2018 06:53:09 +0000
Date: Tue, 19 Jun 2018 08:52:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek
 Vasut <marek.vasut@gmail.com>
Subject: Re: [RFC PATCH v2 5/6] mtd: rawnand: micron: add
 ONFI_FEATURE_ON_DIE_ECC to supported features
Message-ID: <20180619085244.77790406@xps13>
In-Reply-To: <20180619074056.420d5560@bbrezillon>
References: <20180619053125.16792-1-chris.packham@alliedtelesis.co.nz>
 <20180619053125.16792-6-chris.packham@alliedtelesis.co.nz>
 <20180619074056.420d5560@bbrezillon>
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

Hi Boris, Chris,

On Tue, 19 Jun 2018 07:40:56 +0200, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> On Tue, 19 Jun 2018 17:31:24 +1200
> Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:
>=20
> > Add ONFI_FEATURE_ON_DIE_ECC to the set/get features list for Micron
> > NAND flash.
> > =20
>=20
> Fixes: 789157e41a06 ("mtd: rawnand: allow vendors to declare (un)supporte=
d features")

Sorry for breaking it in my previous series.

> Cc: <stable@vger.kernel.org>
>=20
> No need to send a new version, I'll add that when queuing the patch.
>=20
> Miquel, if you're okay, I'm gonna take this patch in the mtd/fixes branch
> and let you deal with other patches in this series.

Yes please, take this one.

* Chris, I'll take patches 1, 2, 3 with Boris comments.
* Patch 4 I think I'll just drop it as nobody can test it (and it's a
  oneliner). I prefer people requesting a feature than complaining
  about a bug :)
* Boris will take patch 5 in the mtd/fixes branch.
* I'll let you write a v3 for patch 6 only.

Thanks,
Miqu=C3=A8l
