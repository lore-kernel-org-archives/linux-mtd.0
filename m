Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcHWI-0008B9-7I
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 21:47:04 +0000
Date: Sun, 8 Jul 2018 23:46:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin King <colin.king@canonical.com>
Cc: Han Xu <han.xu@nxp.com>, Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: gpmi: remove redundant variable payload_virt
Message-ID: <20180708234647.28137d8c@xps13>
In-Reply-To: <20180703081214.32754-1-colin.king@canonical.com>
References: <20180703081214.32754-1-colin.king@canonical.com>
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

Hi Colin,

Colin King <colin.king@canonical.com> wrote on Tue,  3 Jul 2018
09:12:14 +0100:

> From: Colin Ian King <colin.king@canonical.com>
>=20
> Variable payload_virt is being assigned but is never used hence it is
> redundant and can be removed.
>=20
> Cleans up clang warning:
> warning: variable 'payload_virt' set but not used [-Wunused-but-set-varia=
ble]
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied to nand/next.

Thanks,
Miqu=C3=A8l
