Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Jvc-000057-Kl
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2018 12:37:41 +0000
Date: Tue, 2 Oct 2018 14:37:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org, richard@nod.at
Subject: Re: [PATCH mtd-www] Remove references to the "unstable bits" issue
Message-ID: <20181002143717.5e9a4735@xps13>
In-Reply-To: <20181002122523.12422-1-david.oberhollenzer@sigma-star.at>
References: <20181002122523.12422-1-david.oberhollenzer@sigma-star.at>
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

Hi David,

David Oberhollenzer <david.oberhollenzer@sigma-star.at> wrote on Tue,
2 Oct 2018 14:25:23 +0200:

> In 2011, several sections about an issue with SLC and MLC NAND flashes of
> that time were added. The problem was referred to as "unstable bits" issue
> throughout the documentation and the FAQ.
>=20
> As of writing, the issue could not be reproduced with modern NADN flashes

                                                                 ^ NAND

> for several years and the section on the web site actually caused some
> confusion, with some users of MTD/UBI/UBIFS attributing actual bugs to the
> unstable bits issue instead of reporting on the mailing list.
>=20
> To avoid future confusion, this patch removes the section about the issue
> and all references to it.
>=20
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks!
Miqu=C3=A8l
