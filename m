Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ecRIn-0004xJ-Sf
 for linux-mtd@lists.infradead.org; Fri, 19 Jan 2018 07:41:31 +0000
Date: Fri, 19 Jan 2018 08:41:18 +0100
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Colin King <colin.king@canonical.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH][next] mtd: nand: remove redundant variable 'oob_len'
Message-ID: <20180119084118.3450d47f@xps13>
In-Reply-To: <20180116125748.26042-1-colin.king@canonical.com>
References: <20180116125748.26042-1-colin.king@canonical.com>
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

Hello,

On Tue, 16 Jan 2018 12:57:48 +0000
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>=20
> Variable oob_len is assigned and never read, hence it is redundant and
> can be removed.
>=20
> Cleans up clang warnings:
>=20
> drivers/mtd/nand/marvell_nand.c:1356:6: warning: Value stored to
> 'oob_len' during its initialization is never read
> drivers/mtd/nand/marvell_nand.c:1369:4: warning: Value stored to
> 'oob_len' is never read
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Same as before, can you change the prefix to:

mtd: nand: marvell:

Thank you,
Miqu=C3=A8l
