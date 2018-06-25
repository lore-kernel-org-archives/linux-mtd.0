Date: Mon, 25 Jun 2018 14:38:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@bootlin.com,
 richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, liang.yang@amlogic.com, yixun.lan@amlogic.com,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 0/1] fix OOB size decoding on SK Hynix H27UCG8T2BTR
Message-ID: <20180625143811.26a0116a@xps13>
In-Reply-To: <20180624205355.20060-1-martin.blumenstingl@googlemail.com>
References: <20180624205355.20060-1-martin.blumenstingl@googlemail.com>
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

Hi Martin,

On Sun, 24 Jun 2018 22:53:54 +0200, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> The OOB size of the SK Hynix H27UCG8T2BTR is currently detected to be
> 640 bytes, while the datasheet states that it should be 1280 bytes.
>=20
> I only have one single device with a SK Hynix NAND flash, so I cannot
> say whether this fix may or may not break other chips. other datasheets
> I have checked:
> - H27UBG8T2B uses a page size of 8KiB -> not applicable
> - H27UBG8T2A also uses a page size of 8KiB -> not applicable either
>=20
> so I would appreciate if someone else could confirm (even if it's
> "just" by looking at a datasheet) that this patch should work for other
> SK Hynix NAND chips with 16KiB page size.
>=20
> I decided not to add a "Fixes" tag because it seems H27UCG8T2BTR was
> not supported properly at any point in the past (upstream at least).
>=20
>=20
> changes since v1 at [0]:
> - don't apply the fix for all Hynix chips with 16KiB page size as
>   suggested by Miquel Raynal
> - added an inline comment what the new logic is supposed to do
> - I asked Hynix for feedback on my initial patch, unfortunately it
>   seems that they cannot disclose any information from the datasheets
>   publicly
>=20
>=20
> [0] https://patchwork.ozlabs.org/cover/916836/
>=20
>=20
> Martin Blumenstingl (1):
>   mtd: rawnand: hynix: fix decoding the OOB size on H27UCG8T2BTR
>=20
>  drivers/mtd/nand/raw/nand_hynix.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20

Applied to nand/next.

Thanks,
Miqu=C3=A8l
