Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1G75-0004Oo-5p
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 15:02:08 +0000
Date: Wed, 17 Dec 2014 16:01:42 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH RFC] Alphascale ASM9260 NAND controller driver
Message-ID: <20141217160142.652da57f@bbrezillon>
In-Reply-To: <54919501.3020100@rempel-privat.de>
References: <1418816718-29764-1-git-send-email-linux@rempel-privat.de>
 <20141217142455.5970987e@bbrezillon>
 <54919501.3020100@rempel-privat.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 17 Dec 2014 15:36:49 +0100
Oleksij Rempel <linux@rempel-privat.de> wrote:

> Am 17.12.2014 um 14:24 schrieb Boris Brezillon:
> > Hi Oleksij,
> >=20
> > On Wed, 17 Dec 2014 12:45:17 +0100
> > Oleksij Rempel <linux@rempel-privat.de> wrote:
> >=20
> >> I collected some questions with this driver. It will be great if you
> >> can help me:
> >> * Do HW_ECC driver should provideo option for SW_ECC?
> >=20
> > This is not mandatory. I did it in the sunxi driver for testing
> > purpose, but it should work fine without it.
> >=20
> >> * My HW do ECC correction for n-bits per 512B, it mean it will
> >> split block in 512B parts. If one of part has uncorrectable error, com=
plete block will be
> >> reported as failed. Are there any way for partial recovery?
> >=20
> > I think what you're calling block here is actually a page.
> > Regarding your question, there is no way to recover part of a page, but
> > each ECC block should be tested and max_bitflip should be returned
> > (even if some ECC blocks contains too many errors to be corrected).
> > Take a look at [1] for an example.
>=20
> From Flash point of view block or part which i mean !=3D page. In my case
> it is TOSHIBA TC58NVG0S3ETA00, organized as (2048 + 64) bytes =C3=97 64 p=
ages
> =C3=97 1024blocks. The NFC will split each each 2048B page to 512B
> blocks/???/parts/sub_page/ecc_step/better_name.

Okay, so let's call it ECC step or ECC block, not just block, cause a
NAND block is containing several NAND pages.

>=20
> HW_ECC provide bit_flip counter for each sub_page. If all sub_pages are
> recovered, there is no problem. Beside the question, how many bit should
> be counted. Right now max_bitflips =3D sum(all_sub_pages).


Then you should change it to return
max(nbitflips_on_chunk1, nbitflips_on_chunk2, ...)

>=20
> Second problem which i have is that, there is only one ecc_error flag
> for all sub_pages. If one sub_page filed, i don't know which one. Ecc
> erroc counter register can't help here. Only way is to reread complete
> page with SW_ECC.

Then I don't have any solution right now (I'll think about it)...

>=20
> >> * This HW reports count of ECC bitflips for each part. Do i need to re=
turn count of errors on
> >> all parts for one block?
> >=20
> > Again: block =3D=3D page, and no, you should only return the maximum
> > corrected bitflips (same example [1]).
> >=20
> >=20
> >> * If HW_ECC different stranges, how it should be configured? With DT o=
r automatically
> >> calculated?
> >=20
> > I don't get that one...
> > Are you talking about ECC requirements (ECC strength and steps) ?
>=20
> Yes. Well, i can't choice ECC step(it is 512B on this HW), only strange.

You mean strength :-), then you should either use the values returned
by ONFI or the one defined in the strength_ds and step_ds fields.
DT porperties should override those definitions (for example to force
ECC strength based on a specific bootloader config).


--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
