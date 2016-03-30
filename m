Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alGdk-00052F-9s
 for linux-mtd@lists.infradead.org; Wed, 30 Mar 2016 13:58:32 +0000
Date: Wed, 30 Mar 2016 15:58:10 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Kamal Dasu
 <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely
 <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH V2 0/4] mtd: nand: add enum nand_ecc_algo
Message-ID: <20160330155810.328f2a1e@bbrezillon>
In-Reply-To: <1458728343-1234-1-git-send-email-zajec5@gmail.com>
References: <1458728343-1234-1-git-send-email-zajec5@gmail.com>
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

Hi Rafal,

On Wed, 23 Mar 2016 11:18:59 +0100
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> Some time ago I started working on a new "nand-ecc-algo" property to allow
> specifying ECC algorithm for hardware ECC mode as well.
> Boris pointed out it's becoming a bit messy that way as we already have v=
alue
> NAND_ECC_SOFT_BCH.
> I suggested deprecating "soft_bch" value from nand-ecc-mode property and =
got
> Boris agreed and no objections from others. So there is how I want to imp=
lement
> this.
> If you agree on this way & apply my patches, I'll start modifying NAND dr=
ivers
> (similarly to the nandsim) and then will try to drop NAND_ECC_SOFT_BCH ex=
cept
> for handling backward compatibility.
> Then finally we should be able to add "nand-ecc-algo" property support pr=
operly.
>=20
> V2: Add of_get_nand_ecc_algo helper (in 2/4) instead of this slightly hac=
ky code
>     in nand_dt_init that would be replaced anyway.

Whole series applied to nand/next [1]. I just added a comment for the
ecc->algo field in patch 1.
You can continue your rework (patch existing NAND_ECC_SOFT_BCH and
NAND_ECC_SOFT users to use ecc->algo).

Thanks,

Boris

[1]https://github.com/linux-nand/linux/tree/nand/next

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
