From: "Gupta, Pekon" <pekon@ti.com>
To: Huang Shijie <b32955@freescale.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>
Subject: RE: [PATCH] mtd: nand: use a local variable to simplify the
 nand_scan_tail
Date: Fri, 18 Oct 2013 14:11:19 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA2866E@DBDE04.ent.ti.com>
References: <1382077253-21709-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1382077253-21709-1-git-send-email-b32955@freescale.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: Huang Shijie
> There are too many "chip->ecc" in the nand_scan_tail() which makes the
> eyes
> sore.
>=20
> This patch uses a local variable "ecc" to replace the "chip->ecc" to
> make the code more graceful.
>=20
> Do the code change with "s/chip->ecc\./ecc->/g" in the nand_scan_tail,
> and also change some lines by hand.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>
>=20
Personally I won't prefer such stand-alone cleanup  _unless_ there is
major driver re-write of the code, because this breaks the traceability
via 'git blame'. And even in that case, this change should be applied first=
,
and the other functional updates later.

On same lines, I was trying to clean-up omap2.c driver with
s/info->nand\./nand_chip->/
But withheld it till the point when I had to almost re-write complete probe=
.
So, I first did this change, and then on top-of-it re-wrote the omap_nand_p=
robe().


with regards, pekon
