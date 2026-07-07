Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EB3C43458
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2026 09:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1cQBXHDG8OfSqdufNjPMHjqcGMZcIF6xYexogzm7OI=; b=ghJRNcxsc9q3gevQopqIagIJrL
	E/2vLRaKHwrb9Rpa0AsunhB2Yd6bUJTJUMeUDZM3Q0DvWATeF30tA+cJCz3FMXgJZXBU2G+gBv1tP
	2phe6+XILaF04KETewzj7t8OPMar1nVeCDsZiKobeqynwFm7ELOM3jMFcyGQgE5OoYJm0RKTnaPEb
	hINj900wE/FaqHATKjn4Se6R43mJcR1EeIHji18AMbKqKW19D71SBk8YmgKCCuZIytUxio9J0jYnW
	eVR9rvM6VKywUIO3LDAV1Y0jDjKQUjCZG30NRY/EYfjz9+jpDr0lYaGWJv5CtwA65uCZhFVBdhgDn
	EL10Mgug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2LF-0000000EefZ-35NB;
	Tue, 07 Jul 2026 09:43:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2LE-0000000EefA-3tXK;
	Tue, 07 Jul 2026 09:43:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 6645F424AD;
	Tue,  7 Jul 2026 09:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 63F071F00A3D;
	Tue,  7 Jul 2026 09:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783417428;
	bh=pzGfsIvGeXqXqyVEgXdR3wg9pzeiAvj8vEHeViyCDKQ=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=N8u8t8QA1ytGznNWW2WZKHofiv0QeMqk1sJrUb+fUY6A5G1i9rkcEJdPuBJ6H3gfE
	 r5ojuBXB0QZIs4d3ZI3SpNrDveKkw98wlzBoya9U1+6KFq0HZGjEwGGZUYifOYxeLs
	 TSWJHo2EsMmcyVdpzPxRUbKVPGWZZsjwhfdZ1qIkg/Oko0VpLJNwJY72Yu+bTrr0xg
	 wo8eMVBwudeyjuN3bU354r6kbK+PFsrSeo4oAK0UplqMYP2utbYxbRdw9pU9pgpewr
	 KOfWF56/N+kzp1mnfrMXIsoTETgXpn3PkpuxQzIfY4wmoAEfjwAiHwuOqalZeZHD6d
	 tknMfA5ZfAsSA==
Mime-Version: 1.0
Date: Tue, 07 Jul 2026 11:43:44 +0200
Message-Id: <DJS8PQ5HZZG5.2YT956NCDX8MG@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH 1/5] mtd: spi-nor: Refactor Read Status/Write Status
 support
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260529-winbond-v7-1-spi-nor-rv-addition-v1-0-f3ae18502d5a@bootlin.com> <20260529-winbond-v7-1-spi-nor-rv-addition-v1-1-f3ae18502d5a@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-rv-addition-v1-1-f3ae18502d5a@bootlin.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8668739728521531230=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8668739728521531230==
Content-Type: multipart/signed;
 boundary=0610f1ebae319002edd6101cb49e58853663e0733d7e3b3d77139c0f443e;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--0610f1ebae319002edd6101cb49e58853663e0733d7e3b3d77139c0f443e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Miquel,

thanks for doing this (somewhat thankless) task. I briefly skimmed
over this patch.. [Ok coming back here, it's quite a bigger
feedback. And I'm sorry if it's sometime confusing, I was jumping
back and forth].

On Fri May 29, 2026 at 6:05 PM CEST, Miquel Raynal wrote:
> SPI NOR has a lot of history. Additions over additions, the subtleties
> of the JESD216 specification, their implementations by the manufacturers
> and the hardware mistakes have generated a gigantic maze, let's try to
> understand what is really needed.
>
> The specification explains the QE (Quad Enable) bitfield as describing
> where the bit to enable the Quad capability is, but also how to set
> it.

I think the standard just wrote down what all the different vendors
were doing. So it didn't really start as "one" standard but just
collected all the different variants from all the vendors. Also, it
seems that the standard is only interested in how to enable the
quad IO mode. Everything else is guesswork. But iff a given vendor
stick to its implementation, chances are that the QER will
correspond to how to read and write status registers. So for our
guesswork, we can use a QER-to-"sr access" mapping as a baseline.
We should map the QER enumeration to vendors to get a better
understanding now and in the future.
Also, I haven't found a vendor which is using the 3Eh/3Fh opcodes?!

> Unfortunately, the specification is not precise about what opcodes
> are supported exactly in all the cases. There is an introduction that
> basically states:
> - Opcode 0x05 reads SR1, and then SR2 if another byte is read

Where is that? It only states that 05 reads sr1, no?

> - Opcode 0x35 allows to read SR2
> - Opcode 0x01 writes SR1, and then SR2 if another byte is written

Ack.

But reading the individual QER methods below, I'm not sure, if that
is really the baseline here. I mean 101b corresponds to exactly
that, no?

> Then the bitfield, among indicating the location of the QE bit, may
> indicate:
> - Reading SR1 and SR2 in one operation is not possible (loops over the
>   content of SR1)
> - Reading SR2 directly is possible
> - Writing SR1 smashes SR2

You mean writing just one byte with 01h, will set sr2 to zero. IOW,
you'll have to always write two bytes if using 01h.

What we also don't know is how many status registers there actually
are.

> One problem with the current implementation, is that it only focuses on
> the QE bit. A quad_enable function was created for each case, even
> though in practice, the logic was always the same: read, modify, write,
> read back and verify. One problem comes when other features need to play
> with the status registers, like software block protection or OTP: you
> never know how to properly handle the QE bit, nor where it is, nor how
> to read/write the Status registers. This lead to
> approximations/guessing (in swp.c, otp.c and obviously in legacy
> controller drivers like atmel.c) but also to the implementation of a
> gazillon of helpers for reading/writing/checking the status registers.

Mh? why do we have to know the QE bit in other parts? We shall just
read-modify-write the status registers, no?

> In addition, I believe some design decisions had a negative impact over
> the years.
>
> - All possible situations had to be flagged by the core. This is likely
>   wrong, because we no longer know why we need specific quirks. It was
>   ineherent to the state of the SPI NOR core before the great cleanup
>   that had happened the past few years. I believe this creates confusion
>   in the core today, and we should push this to vendor fixups
>   instead. As an example, in 2023 Hsin-Yi was facing an issue because
>   his chip was setting the wrong QER value, leading to RDCR being
>   prevented, thus falling into a condition blindly setting a random QE
>   bit (I strongy believe it is done like that for wrong reasons). His
>   chip actually had RDCR support! The correct fix should have been to
>   mark the capability in a device fixup instead of handling this in the
>   core.
>
>   Link: https://lore.kernel.org/lkml/CAJMQK-hR0eaO0b4Vd0U8_KAndLyZapqdHjV=
LAoe42rWi9rdLkA@mail.gmail.com/

You mean the "always set the QER bit"?

I agree, this should be pushed into the vendor fixups. But what I
really want to avoid is that we have to have a never ending list of
IDs for these fixups. So there shall be a generic vendor fixup.

As a side node, I really don't like how the fixups are handled at
the moment.  I've proposed that way back but it would be awesome to
be able to just register a fixup with

register_spi_nor_fixup(SNOR_ID(0xef, 0x40, 0x16), winbond_w25q32_fixup);
register_spi_nor_fixup(SNOR_ID(0xef), winbond_default_properties);

Maybe you have some thoughts on that. I'm not sure we really need
the distinction between manufacturer fixups and per device fixups.

Now obviously, with our id reuse problem, that above isn't enough.
I've proposed to have a match function back that - by default - only
matches the id - but can be overwritten to match anything else. I
have also thought about just doing a checksum over the SFDP and
match that.

Any thoughts on that?

But I digress..

> - SFDP parsing is over cautious. I believe
>   BFPT_DWORD15_QER_SR2_BIT1_NO_RD is abusive (nothing states that RDCR is
>   not supported), and BFPT_DWORD15_QER_SR2_BIT1 is also out of
>   specification when forcing 16-bit Status writes.

Also, I don't think BFPT_DWORD15_QER_SR2_BIT1_BUGGY is a good name
:)

> - SNOR_F_HAS_16BIT_SR is only imposing 16bit Status writes, whereas
>   reads can still be 8-bit wides and even sometimes can only be 8-bit
>   wide.
>
> - The usage of helpers verifying the writes was also spread for IMHO no
>   really good reason. Why shouldn't we trust spi operations when it
>   comes to Status Registers? We do not read back our page reads, so why
>   status registers should be treated with so much care, if it's not
>   because we are unsure of what is being done? My proposal includes a
>   check when it comes to the QE bit (done once) but we don't need these
>   checks otherwise. If the QE bit was written properly, there are high
>   chances that the other register accesses will just be fine, no?

One thing that comes to mind is hardware write protection. If
there's nothing before that code which checks it, the verify might
fail if the hardware write protection is enabled. So we should
somehow check for that and drop the verify here.

> Asde from my main quest, I also observed no good reason to ask the
> read/write status register callers to use nor->bouncebuf while the
> low-level helpers could do it themselves (we are talking about one or
> two bytes being copied).

Totally agree!

> So after these observations, my proposal is the following:
> - Create private low level helpers that just read or write a status
>   register. They are flexible, we can give the opcode (which varies
>   based on the SFDP QER field) and the length (1 or 2).
> - Create public generic accessors which will be used to read/write sr1
>   and/or sr2. This is where all the cleverness shall be. The helpers use
>   the available opcodes for a given chip in order to fullfill the
>   request.
> - Provide a single generic ->quad_enable() hook which generically does
>   all the steps mentioned above (read, modify, write, read back and
>   verify).
> - Create a list of opcodes for all 6 possible situations:
>   {read, write} {sr1, sr2, sr1 and sr2}. These opcodes are
>   filled/cleared based on the QER field. An opcode set to 0 indicates
>   the absence of support (there is no 0x00 opcode in SPI NOR).

How would we fill these fields for flashes without SFDP? I guess
by vendor in the vendor modules.

> I tried my best to analyze the current behavior and to mimic it as much
> as possible, but this is a risky cleanup. However, if we go for this, it
> will be *much* easier in the future to handle all kind of chip
> variations. We won't be limited to a couple of flags anymore, but rather
> we'll be able to just disable a read or write capability using a single
> line.

I'd op for taking this early in the cycle for at least two cycles.
I.e. just let it sit in next and don't include it in the next PR,
but one after that.

> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> This is a really hard to review patch, it is big, full of changes
> everywhere, but I cannot really split it further. The commit log is
> really important, it tries to explain the steps I went through when
> trying to refactor the whole QE/SR handling for which I received
> feedback from Michael, Tudor and Sashiko.
>
> Ideally we could expect test coverage of each case:
> - BFPT_DWORD15_QER_NONE: Probably not needed
> - BFPT_DWORD15_QER_SR2_BIT1_BUGGY: Expected from Hsin-Yi
> - BFPT_DWORD15_QER_SR2_BIT1_NO_RD: Tested with a chip re-enabling RDCR
>   in a fixup
> - BFPT_DWORD15_QER_SR1_BIT6: TBD
> - BFPT_DWORD15_QER_SR2_BIT7: TBD
> - BFPT_DWORD15_QER_SR2_BIT1: TBD
> - BFPT_DWORD15_QER_SR2_BIT1_1B: Done.
> There will probably be breakages on older chips. These cannot be
> guessed because they are not properly listed in manufacturer
> fixups (yet). If we want a cleanup/simplification, we will have to cope
> with this risk.
>
> I hope the diff stats will motivate people to have a look and report
> their testing.
>
> I will also eagerly monitor Sashiko's output which will probably be
> very useful to catch niche weird cases where these changes might break.
> ---
>  drivers/mtd/spi-nor/atmel.c      |  50 +--
>  drivers/mtd/spi-nor/core.c       | 702 +++++++++++----------------------=
------
>  drivers/mtd/spi-nor/core.h       |  54 ++-
>  drivers/mtd/spi-nor/debugfs.c    |   1 -
>  drivers/mtd/spi-nor/gigadevice.c |   6 +-
>  drivers/mtd/spi-nor/issi.c       |   3 +-
>  drivers/mtd/spi-nor/macronix.c   |  12 +-
>  drivers/mtd/spi-nor/otp.c        |  16 +-
>  drivers/mtd/spi-nor/sfdp.c       |  37 ++-
>  drivers/mtd/spi-nor/spansion.c   |  16 +-
>  drivers/mtd/spi-nor/sst.c        |   5 +-
>  drivers/mtd/spi-nor/swp.c        |  58 +---
>  drivers/mtd/spi-nor/winbond.c    |   4 +-
>  include/linux/mtd/spi-nor.h      |   4 -
>  14 files changed, 326 insertions(+), 642 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 82c592f0a1e1..124ceb795f56 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -23,18 +23,28 @@ static int at25fs_nor_lock(struct spi_nor *nor, loff_=
t ofs, u64 len)
> =20
>  static int at25fs_nor_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
>  {
> +	/* Write 0x00 to the status register to disable write protection */
> +	u8 sr =3D 0;
>  	int ret;
> =20
>  	/* We only support unlocking the whole flash array */
>  	if (ofs || len !=3D nor->params->size)
>  		return -EINVAL;
> =20
> -	/* Write 0x00 to the status register to disable write protection */
> -	ret =3D spi_nor_write_sr_and_check(nor, 0);
> +	ret =3D spi_nor_write_srs(nor, &sr, NULL);
>  	if (ret)
> -		dev_dbg(nor->dev, "unable to clear BP bits, WP# asserted?\n");
> +		return ret;
> =20
> -	return ret;
> +	ret =3D spi_nor_read_srs(nor, &sr, NULL);
> +	if (ret)
> +		return ret;
> +
> +	if (sr) {
> +		dev_dbg(nor->dev, "unable to clear BP bits, WP# asserted?\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
>  }
> =20
>  static int at25fs_nor_is_locked(struct spi_nor *nor, loff_t ofs, u64 len=
)
> @@ -69,6 +79,7 @@ static const struct spi_nor_fixups at25fs_nor_fixups =
=3D {
>   * Return: 0 on success, -error otherwise.
>   */
>  static int atmel_nor_set_global_protection(struct spi_nor *nor, loff_t o=
fs,
> +
>  					   u64 len, bool is_protect)
>  {
>  	int ret;
> @@ -78,19 +89,24 @@ static int atmel_nor_set_global_protection(struct spi=
_nor *nor, loff_t ofs,
>  	if (ofs || len !=3D nor->params->size)
>  		return -EINVAL;
> =20
> -	ret =3D spi_nor_read_sr(nor, nor->bouncebuf);
> +	ret =3D spi_nor_read_srs(nor, &sr, NULL);
>  	if (ret)
>  		return ret;
> =20
> -	sr =3D nor->bouncebuf[0];
> -
>  	/* SRWD bit needs to be cleared, otherwise the protection doesn't chang=
e */
>  	if (sr & SR_SRWD) {
>  		sr &=3D ~SR_SRWD;
> -		ret =3D spi_nor_write_sr_and_check(nor, sr);
> -		if (ret) {
> -			dev_dbg(nor->dev, "unable to clear SRWD bit, WP# asserted?\n");
> +		ret =3D spi_nor_write_srs(nor, &sr, NULL);
> +		if (ret)
>  			return ret;
> +
> +		ret =3D spi_nor_read_srs(nor, &sr, NULL);
> +		if (ret)
> +			return ret;
> +
> +		if (sr & SR_SRWD) {
> +			dev_dbg(nor->dev, "unable to clear SRWD bit, WP# asserted?\n");
> +			return -EIO;
>  		}
>  	}
> =20
> @@ -108,14 +124,7 @@ static int atmel_nor_set_global_protection(struct sp=
i_nor *nor, loff_t ofs,
>  		sr &=3D ~ATMEL_SR_GLOBAL_PROTECT_MASK;
>  	}
> =20
> -	nor->bouncebuf[0] =3D sr;
> -
> -	/*
> -	 * We cannot use the spi_nor_write_sr_and_check() because this command
> -	 * isn't really setting any bits, instead it is an pseudo command for
> -	 * "Global Unprotect" or "Global Protect"
> -	 */
> -	return spi_nor_write_sr(nor, nor->bouncebuf, 1);
> +	return spi_nor_write_srs(nor, &sr, NULL);
>  }
> =20
>  static int atmel_nor_global_protect(struct spi_nor *nor, loff_t ofs, u64=
 len)
> @@ -131,16 +140,17 @@ static int atmel_nor_global_unprotect(struct spi_no=
r *nor, loff_t ofs, u64 len)
>  static int atmel_nor_is_global_protected(struct spi_nor *nor, loff_t ofs=
,
>  					 u64 len)
>  {
> +	u8 sr;
>  	int ret;
> =20
>  	if (ofs >=3D nor->params->size || (ofs + len) > nor->params->size)
>  		return -EINVAL;
> =20
> -	ret =3D spi_nor_read_sr(nor, nor->bouncebuf);
> +	ret =3D spi_nor_read_srs(nor, &sr, NULL);
>  	if (ret)
>  		return ret;
> =20
> -	return ((nor->bouncebuf[0] & ATMEL_SR_GLOBAL_PROTECT_MASK) =3D=3D ATMEL=
_SR_GLOBAL_PROTECT_MASK);
> +	return ((sr & ATMEL_SR_GLOBAL_PROTECT_MASK) =3D=3D ATMEL_SR_GLOBAL_PROT=
ECT_MASK);
>  }
> =20
>  static const struct spi_nor_locking_ops atmel_nor_global_protection_ops =
=3D {
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index b25d1a870a22..ca66661a7f44 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -443,75 +443,6 @@ int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u=
8 ndummy, u8 *id,
>  	return ret;
>  }
> =20
> -/**
> - * spi_nor_read_sr() - Read the Status Register.
> - * @nor:	pointer to 'struct spi_nor'.
> - * @sr:		pointer to a DMA-able buffer where the value of the
> - *              Status Register will be written. Should be at least 2 by=
tes.
> - *
> - * Return: 0 on success, -errno otherwise.
> - */
> -int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
> -{
> -	int ret;
> -
> -	if (nor->spimem) {
> -		struct spi_mem_op op =3D SPI_NOR_RDSR_OP(sr);
> -
> -		if (nor->reg_proto =3D=3D SNOR_PROTO_8_8_8_DTR) {
> -			op.addr.nbytes =3D nor->params->rdsr_addr_nbytes;
> -			op.dummy.nbytes =3D nor->params->rdsr_dummy;
> -			/*
> -			 * We don't want to read only one byte in DTR mode. So,
> -			 * read 2 and then discard the second byte.
> -			 */
> -			op.data.nbytes =3D 2;
> -		}
> -
> -		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> -
> -		ret =3D spi_mem_exec_op(nor->spimem, &op);
> -	} else {
> -		ret =3D spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDSR, sr,
> -						      1);
> -	}
> -
> -	if (ret)
> -		dev_dbg(nor->dev, "error %d reading SR\n", ret);
> -
> -	return ret;
> -}
> -
> -/**
> - * spi_nor_read_cr() - Read the Configuration Register using the
> - * SPINOR_OP_RDCR (35h) command.
> - * @nor:	pointer to 'struct spi_nor'
> - * @cr:		pointer to a DMA-able buffer where the value of the
> - *              Configuration Register will be written.
> - *
> - * Return: 0 on success, -errno otherwise.
> - */
> -int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
> -{
> -	int ret;
> -
> -	if (nor->spimem) {
> -		struct spi_mem_op op =3D SPI_NOR_RDCR_OP(cr);
> -
> -		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> -
> -		ret =3D spi_mem_exec_op(nor->spimem, &op);
> -	} else {
> -		ret =3D spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDCR, cr,
> -						      1);
> -	}
> -
> -	if (ret)
> -		dev_dbg(nor->dev, "error %d reading CR\n", ret);
> -
> -	return ret;
> -}
> -
>  /**
>   * spi_nor_set_4byte_addr_mode_en4b_ex4b() - Enter/Exit 4-byte address m=
ode
>   *			using SPINOR_OP_EN4B/SPINOR_OP_EX4B. Typically used by
> @@ -617,12 +548,13 @@ int spi_nor_set_4byte_addr_mode_brwr(struct spi_nor=
 *nor, bool enable)
>  int spi_nor_sr_ready(struct spi_nor *nor)
>  {
>  	int ret;
> +	u8 sr;
> =20
> -	ret =3D spi_nor_read_sr(nor, nor->bouncebuf);
> +	ret =3D spi_nor_read_srs(nor, &sr, NULL);
>  	if (ret)
>  		return ret;
> =20
> -	return !(nor->bouncebuf[0] & SR_WIP);
> +	return !(sr & SR_WIP);
>  }
> =20
>  /**
> @@ -784,345 +716,210 @@ int spi_nor_global_block_unlock(struct spi_nor *n=
or)
>  }
> =20
>  /**
> - * spi_nor_write_sr() - Write the Status Register.
> + * spi_nor_read_srs_ll() - Low-level Status Registers read.
>   * @nor:	pointer to 'struct spi_nor'.
> - * @sr:		pointer to DMA-able buffer to write to the Status Register.
> - * @len:	number of bytes to write to the Status Register.
> + * @opcode:	opcode for the status register read operation.
> + * @sr:		pointer to buffer for storing the contnet of the status registe=
rs.
> + * @len:	number of status registers to read.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len)
> +static int spi_nor_read_srs_ll(struct spi_nor *nor, u8 opcode, u8 *sr2,
> +			       unsigned int len)
>  {
> -	int ret;
> +	int ret, i;
> =20
> -	ret =3D spi_nor_write_enable(nor);
> -	if (ret)
> -		return ret;
> +	for (i =3D 0; i < len; i++)
> +		nor->bouncebuf[i] =3D 0;
> =20
>  	if (nor->spimem) {
> -		struct spi_mem_op op =3D SPI_NOR_WRSR_OP(sr, len);
> +		struct spi_mem_op op =3D SPI_NOR_RDSR_OP(opcode, nor->bouncebuf, len);
> =20
>  		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> =20
>  		ret =3D spi_mem_exec_op(nor->spimem, &op);
>  	} else {
> -		ret =3D spi_nor_controller_ops_write_reg(nor, SPINOR_OP_WRSR, sr,
> -						       len);
> +		ret =3D spi_nor_controller_ops_read_reg(nor, opcode, nor->bouncebuf, l=
en);
>  	}
> =20
> -	if (ret) {
> -		dev_dbg(nor->dev, "error %d writing SR\n", ret);
> -		return ret;
> -	}
> -
> -	return spi_nor_wait_till_ready(nor);
> -}
> -
> -/**
> - * spi_nor_write_sr1_and_check() - Write one byte to the Status Register=
 1 and
> - * ensure that the byte written match the received value.
> - * @nor:	pointer to a 'struct spi_nor'.
> - * @sr1:	byte value to be written to the Status Register.
> - *
> - * Return: 0 on success, -errno otherwise.
> - */
> -static int spi_nor_write_sr1_and_check(struct spi_nor *nor, u8 sr1)
> -{
> -	int ret;
> -
> -	nor->bouncebuf[0] =3D sr1;
> -
> -	ret =3D spi_nor_write_sr(nor, nor->bouncebuf, 1);
> -	if (ret)
> -		return ret;
> -
> -	ret =3D spi_nor_read_sr(nor, nor->bouncebuf);
> -	if (ret)
> -		return ret;
> -
> -	if (nor->bouncebuf[0] !=3D sr1) {
> -		dev_dbg(nor->dev, "SR1: read back test failed\n");
> -		return -EIO;
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * spi_nor_write_16bit_sr_and_check() - Write the Status Register 1 and =
the
> - * Status Register 2 in one shot. Ensure that the byte written in the St=
atus
> - * Register 1 match the received value, and that the 16-bit Write did no=
t
> - * affect what was already in the Status Register 2.
> - * @nor:	pointer to a 'struct spi_nor'.
> - * @sr1:	byte value to be written to the Status Register 1.
> - *
> - * Return: 0 on success, -errno otherwise.
> - */
> -static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
> -{
> -	int ret;
> -	u8 *sr_cr =3D nor->bouncebuf;
> -	u8 cr_written;
> -
> -	/* Make sure we don't overwrite the contents of Status Register 2. */
> -	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
> -		ret =3D spi_nor_read_cr(nor, &sr_cr[1]);
> -		if (ret)
> -			return ret;
> -	} else if ((spi_nor_get_protocol_width(nor->read_proto) =3D=3D 4 ||
> -		    spi_nor_get_protocol_width(nor->write_proto) =3D=3D 4) &&
> -		   nor->params->quad_enable) {
> -		/*
> -		 * If the Status Register 2 Read command (35h) is not
> -		 * supported, we should at least be sure we don't
> -		 * change the value of the SR2 Quad Enable bit.
> -		 *
> -		 * When the Quad Enable method is set and the buswidth is 4, we
> -		 * can safely assume that the value of the QE bit is one, as a
> -		 * consequence of the nor->params->quad_enable() call.
> -		 *
> -		 * According to the JESD216 revB standard, BFPT DWORDS[15],
> -		 * bits 22:20, the 16-bit Write Status (01h) command is
> -		 * available just for the cases in which the QE bit is
> -		 * described in SR2 at BIT(1).
> -		 */
> -		sr_cr[1] =3D SR2_QUAD_EN_BIT1;
> -	} else {
> -		sr_cr[1] =3D 0;
> -	}
> -
> -	sr_cr[0] =3D sr1;
> -
> -	ret =3D spi_nor_write_sr(nor, sr_cr, 2);
> -	if (ret)
> -		return ret;
> -
> -	ret =3D spi_nor_read_sr(nor, sr_cr);
> -	if (ret)
> -		return ret;
> -
> -	if (sr1 !=3D sr_cr[0]) {
> -		dev_dbg(nor->dev, "SR: Read back test failed\n");
> -		return -EIO;
> -	}
> -
> -	if (nor->flags & SNOR_F_NO_READ_CR)
> -		return 0;
> -
> -	cr_written =3D sr_cr[1];
> -
> -	ret =3D spi_nor_read_cr(nor, &sr_cr[1]);
> -	if (ret)
> -		return ret;
> -
> -	if (cr_written !=3D sr_cr[1]) {
> -		dev_dbg(nor->dev, "CR: read back test failed\n");
> -		return -EIO;
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * spi_nor_write_16bit_cr_and_check() - Write the Status Register 1 and =
the
> - * Configuration Register in one shot. Ensure that the byte written in t=
he
> - * Configuration Register match the received value, and that the 16-bit =
Write
> - * did not affect what was already in the Status Register 1.
> - * @nor:	pointer to a 'struct spi_nor'.
> - * @cr:		byte value to be written to the Configuration Register.
> - *
> - * Return: 0 on success, -errno otherwise.
> - */
> -int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr)
> -{
> -	int ret;
> -	u8 *sr_cr =3D nor->bouncebuf;
> -	u8 sr_written;
> -
> -	/* Keep the current value of the Status Register 1. */
> -	ret =3D spi_nor_read_sr(nor, sr_cr);
> -	if (ret)
> -		return ret;
> -
> -	sr_cr[1] =3D cr;
> -
> -	ret =3D spi_nor_write_sr(nor, sr_cr, 2);
> -	if (ret)
> -		return ret;
> -
> -	sr_written =3D sr_cr[0];
> -
> -	ret =3D spi_nor_read_sr(nor, sr_cr);
> -	if (ret)
> -		return ret;
> -
> -	if (sr_written !=3D sr_cr[0]) {
> -		dev_dbg(nor->dev, "SR: Read back test failed\n");
> -		return -EIO;
> -	}
> -
> -	if (nor->flags & SNOR_F_NO_READ_CR)
> -		return 0;
> -
> -	ret =3D spi_nor_read_cr(nor, &sr_cr[1]);
> -	if (ret)
> -		return ret;
> -
> -	if (cr !=3D sr_cr[1]) {
> -		dev_dbg(nor->dev, "CR: read back test failed\n");
> -		return -EIO;
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * spi_nor_write_16bit_sr_cr_and_check() - Write the Status Register 1 a=
nd the
> - * Configuration Register in one shot. Ensure that the bytes written in =
both
> - * registers match the received value.
> - * @nor:	pointer to a 'struct spi_nor'.
> - * @regs:	two-byte array with values to be written to the status and
> - *		configuration registers.
> - *
> - * Return: 0 on success, -errno otherwise.
> - */
> -static int spi_nor_write_16bit_sr_cr_and_check(struct spi_nor *nor, cons=
t u8 *regs)
> -{
> -	u8 written_regs[2];
> -	int ret;
> -
> -	written_regs[0] =3D regs[0];
> -	written_regs[1] =3D regs[1];
> -	nor->bouncebuf[0] =3D regs[0];
> -	nor->bouncebuf[1] =3D regs[1];
> -
> -	ret =3D spi_nor_write_sr(nor, nor->bouncebuf, 2);
> -	if (ret)
> -		return ret;
> -
> -	ret =3D spi_nor_read_sr(nor, &nor->bouncebuf[0]);
> -	if (ret)
> -		return ret;
> -
> -	if (written_regs[0] !=3D nor->bouncebuf[0]) {
> -		dev_dbg(nor->dev, "SR: Read back test failed\n");
> -		return -EIO;
> -	}
> -
> -	if (nor->flags & SNOR_F_NO_READ_CR)
> -		return 0;
> -
> -	ret =3D spi_nor_read_cr(nor, &nor->bouncebuf[1]);
> -	if (ret)
> -		return ret;
> -
> -	if (written_regs[1] !=3D nor->bouncebuf[1]) {
> -		dev_dbg(nor->dev, "CR: read back test failed\n");
> -		return -EIO;
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * spi_nor_write_sr_and_check() - Write the Status Register 1 and ensure=
 that
> - * the byte written match the received value without affecting other bit=
s in the
> - * Status Register 1 and 2.
> - * @nor:	pointer to a 'struct spi_nor'.
> - * @sr1:	byte value to be written to the Status Register.
> - *
> - * Return: 0 on success, -errno otherwise.
> - */
> -int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1)
> -{
> -	if (nor->flags & SNOR_F_HAS_16BIT_SR)
> -		return spi_nor_write_16bit_sr_and_check(nor, sr1);
> -
> -	return spi_nor_write_sr1_and_check(nor, sr1);
> -}
> -
> -/**
> - * spi_nor_write_sr_cr_and_check() - Write the Status Register 1 and ens=
ure that
> - * the byte written match the received value. Same for the Control Regis=
ter if
> - * available.
> - * @nor:	pointer to a 'struct spi_nor'.
> - * @regs:	byte array to be written to the registers.
> - *
> - * Return: 0 on success, -errno otherwise.
> - */
> -int spi_nor_write_sr_cr_and_check(struct spi_nor *nor, const u8 *regs)
> -{
> -	if (nor->flags & SNOR_F_HAS_16BIT_SR)
> -		return spi_nor_write_16bit_sr_cr_and_check(nor, regs);
> -
> -	return spi_nor_write_sr1_and_check(nor, regs[0]);
> -}
> -
> -/**
> - * spi_nor_write_sr2() - Write the Status Register 2 using the
> - * SPINOR_OP_WRSR2 (3eh) command.
> - * @nor:	pointer to 'struct spi_nor'.
> - * @sr2:	pointer to DMA-able buffer to write to the Status Register 2.
> - *
> - * Return: 0 on success, -errno otherwise.
> - */
> -static int spi_nor_write_sr2(struct spi_nor *nor, const u8 *sr2)
> -{
> -	int ret;
> -
> -	ret =3D spi_nor_write_enable(nor);
> -	if (ret)
> -		return ret;
> -
> -	if (nor->spimem) {
> -		struct spi_mem_op op =3D SPI_NOR_WRSR2_OP(sr2);
> -
> -		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> -
> -		ret =3D spi_mem_exec_op(nor->spimem, &op);
> -	} else {
> -		ret =3D spi_nor_controller_ops_write_reg(nor, SPINOR_OP_WRSR2,
> -						       sr2, 1);
> -	}
> -
> -	if (ret) {
> -		dev_dbg(nor->dev, "error %d writing SR2\n", ret);
> -		return ret;
> -	}
> -
> -	return spi_nor_wait_till_ready(nor);
> -}
> -
> -/**
> - * spi_nor_read_sr2() - Read the Status Register 2 using the
> - * SPINOR_OP_RDSR2 (3fh) command.
> - * @nor:	pointer to 'struct spi_nor'.
> - * @sr2:	pointer to DMA-able buffer where the value of the
> - *		Status Register 2 will be written.
> - *
> - * Return: 0 on success, -errno otherwise.
> - */
> -static int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
> -{
> -	int ret;
> -
> -	if (nor->spimem) {
> -		struct spi_mem_op op =3D SPI_NOR_RDSR2_OP(sr2);
> -
> -		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> -
> -		ret =3D spi_mem_exec_op(nor->spimem, &op);
> -	} else {
> -		ret =3D spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDSR2, sr2,
> -						      1);
> -	}
> +	memcpy(sr2, nor->bouncebuf, len);
> =20
>  	if (ret)
> -		dev_dbg(nor->dev, "error %d reading SR2\n", ret);
> +		dev_dbg(nor->dev, "Error %d reading Status Registers\n", ret);
> =20
>  	return ret;
>  }
> =20
> +/**
> + * spi_nor_write_srs_ll() - Low-level Status Registers write.
> + * @nor:	pointer to 'struct spi_nor'.
> + * @opcode:	opcode for the status register write operation.
> + * @srs:	pointer to status registers buffer to write.
> + * @len:	number of status registers to write.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_write_srs_ll(struct spi_nor *nor, u8 opcode,	const u8=
 *srs,
> +				unsigned int len)
> +{
> +	int ret, i;
> +
> +	ret =3D spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
> +
> +	for (i =3D 0; i < len; i++)
> +		nor->bouncebuf[i] =3D srs[i];
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =3D SPI_NOR_WRSR_OP(opcode,
> +						       nor->bouncebuf, len);
> +
> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +		ret =3D spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		ret =3D spi_nor_controller_ops_write_reg(nor, opcode,
> +						       nor->bouncebuf, len);
> +	}
> +
> +	if (ret) {
> +		dev_dbg(nor->dev, "Error %d writing Status Registers\n", ret);
> +		return ret;
> +	}
> +
> +	return spi_nor_wait_till_ready(nor);
> +}
> +
> +int spi_nor_read_srs(struct spi_nor *nor, u8 *sr1, u8 *sr2)

nitpick, i think this is a weird name. But maybe it's just me.

What if we'd just make the one status register as u32? I mean in the
winbond datasheet it's called S7-S0 and S15-S8. That way we also
don't need a two byte qe_mask. To optimize the standard usecase to
poll the WIP bit, we could add a byte mask.

> +{
> +	struct spi_nor_flash_parameter *params =3D nor->params;
> +	int ret;
> +
> +	if (params->read_srs_opcode &&
> +	    ((sr1 && !params->read_sr1_opcode) || (sr2 && !params->read_sr2_opc=
ode))) {
> +		u8 srs[2] =3D {};
> +
> +		ret =3D spi_nor_read_srs_ll(nor, params->read_srs_opcode, srs, 2);
> +		if (ret)
> +			return ret;
> +
> +		if (sr1)
> +			*sr1 =3D srs[0];
> +
> +		if (sr2)
> +			*sr2 =3D srs[1];
> +
> +		return 0;
> +	}
> +
> +	if (sr1) {
> +		ret =3D spi_nor_read_srs_ll(nor, params->read_sr1_opcode, sr1, 1);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (sr2) {
> +		if (params->read_sr2_opcode) {
> +			ret =3D spi_nor_read_srs_ll(nor, params->read_sr2_opcode, sr2, 1);
> +			if (ret)
> +				return ret;
> +		} else {
> +			/* Make sure the QE bit is persistently kept */
> +			if (spi_nor_get_protocol_width(nor->read_proto) =3D=3D 4 ||
> +			    spi_nor_get_protocol_width(nor->write_proto) =3D=3D 4)
> +				*sr2 =3D params->qe_mask[1];
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int spi_nor_write_srs(struct spi_nor *nor, const u8 *sr1, const u8 *sr2)
> +{
> +	struct spi_nor_flash_parameter *params =3D nor->params;
> +	int ret;
> +
> +	if (nor->flags & SNOR_F_HAS_16BIT_SR) {
> +		u8 srs[2];
> +
> +		if (!sr1 || !sr2) {
> +			ret =3D spi_nor_read_srs_ll(nor, params->read_srs_opcode, srs, 2);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		if (sr1)
> +			srs[0] =3D *sr1;
> +		if (sr2)
> +			srs[1] =3D *sr2;
> +
> +		return spi_nor_write_srs_ll(nor, params->write_srs_opcode, srs, 2);
> +	}
> +
> +	if (sr1) {
> +		ret =3D spi_nor_write_srs_ll(nor, params->write_sr1_opcode, sr1, 1);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (sr2 && params->read_sr2_opcode) {
> +		ret =3D spi_nor_write_srs_ll(nor, params->write_sr2_opcode, sr2, 1);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * spi_nor_generic_quad_enable() - Read the status registers,
> + *				   apply the QE bit mask,
> + *				   write the status registers,
> + *				   read them back and check the content.
> + *
> + * @nor:	pointer to 'struct spi_nor'
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_generic_quad_enable(struct spi_nor *nor)
> +{
> +	u8 *qe_mask =3D nor->params->qe_mask;
> +	u8 srs[2] =3D {}, tmp[2] =3D {};
> +	int ret;
> +
> +	if (!qe_mask[0] && !qe_mask[1])
> +		return 0;
> +
> +	ret =3D spi_nor_read_srs(nor, &srs[0], &srs[1]);
> +	if (ret)
> +		return ret;
> +
> +	if (srs[0] & qe_mask[0] || srs[1] & qe_mask[1])
> +		return 0;
> +
> +	srs[0] |=3D qe_mask[0];
> +	srs[1] |=3D qe_mask[1];
> +
> +	if (nor->flags & SNOR_F_HAS_16BIT_SR)
> +		ret =3D spi_nor_write_srs(nor, &srs[0], &srs[1]);
> +	else
> +		ret =3D spi_nor_write_srs(nor,
> +					qe_mask[0] ? &srs[0] : NULL,
> +					qe_mask[1] ? &srs[1] : NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D spi_nor_read_srs(nor, &tmp[0], &tmp[1]);
> +	if (ret)
> +		return ret;
> +
> +	if (srs[0] !=3D tmp[0] || srs[1] !=3D tmp[1])
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>  /**
>   * spi_nor_erase_die() - Erase the entire die.
>   * @nor:	pointer to 'struct spi_nor'.
> @@ -1904,106 +1701,6 @@ static int spi_nor_erase(struct mtd_info *mtd, st=
ruct erase_info *instr)
>  	return ret;
>  }
> =20
> -/**
> - * spi_nor_sr1_bit6_quad_enable() - Set the Quad Enable BIT(6) in the St=
atus
> - * Register 1.
> - * @nor:	pointer to a 'struct spi_nor'
> - *
> - * Bit 6 of the Status Register 1 is the QE bit for Macronix like QSPI m=
emories.
> - *
> - * Return: 0 on success, -errno otherwise.
> - */
> -int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor)
> -{
> -	int ret;
> -
> -	ret =3D spi_nor_read_sr(nor, nor->bouncebuf);
> -	if (ret)
> -		return ret;
> -
> -	if (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)
> -		return 0;
> -
> -	nor->bouncebuf[0] |=3D SR1_QUAD_EN_BIT6;
> -
> -	return spi_nor_write_sr1_and_check(nor, nor->bouncebuf[0]);
> -}
> -
> -/**
> - * spi_nor_sr2_bit1_quad_enable() - set the Quad Enable BIT(1) in the St=
atus
> - * Register 2.
> - * @nor:       pointer to a 'struct spi_nor'.
> - *
> - * Bit 1 of the Status Register 2 is the QE bit for Spansion like QSPI m=
emories.
> - *
> - * Return: 0 on success, -errno otherwise.
> - */
> -int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor)
> -{
> -	int ret;
> -
> -	if (nor->flags & SNOR_F_NO_READ_CR)
> -		return spi_nor_write_16bit_cr_and_check(nor, SR2_QUAD_EN_BIT1);
> -
> -	ret =3D spi_nor_read_cr(nor, nor->bouncebuf);
> -	if (ret)
> -		return ret;
> -
> -	if (nor->bouncebuf[0] & SR2_QUAD_EN_BIT1)
> -		return 0;
> -
> -	nor->bouncebuf[0] |=3D SR2_QUAD_EN_BIT1;
> -
> -	return spi_nor_write_16bit_cr_and_check(nor, nor->bouncebuf[0]);
> -}
> -
> -/**
> - * spi_nor_sr2_bit7_quad_enable() - set QE bit in Status Register 2.
> - * @nor:	pointer to a 'struct spi_nor'
> - *
> - * Set the Quad Enable (QE) bit in the Status Register 2.
> - *
> - * This is one of the procedures to set the QE bit described in the SFDP
> - * (JESD216 rev B) specification but no manufacturer using this procedur=
e has
> - * been identified yet, hence the name of the function.
> - *
> - * Return: 0 on success, -errno otherwise.
> - */
> -int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
> -{
> -	u8 *sr2 =3D nor->bouncebuf;
> -	int ret;
> -	u8 sr2_written;
> -
> -	/* Check current Quad Enable bit value. */
> -	ret =3D spi_nor_read_sr2(nor, sr2);
> -	if (ret)
> -		return ret;
> -	if (*sr2 & SR2_QUAD_EN_BIT7)
> -		return 0;
> -
> -	/* Update the Quad Enable bit. */
> -	*sr2 |=3D SR2_QUAD_EN_BIT7;
> -
> -	ret =3D spi_nor_write_sr2(nor, sr2);
> -	if (ret)
> -		return ret;
> -
> -	sr2_written =3D *sr2;
> -
> -	/* Read back and check it. */
> -	ret =3D spi_nor_read_sr2(nor, sr2);
> -	if (ret)
> -		return ret;
> -
> -	if (*sr2 !=3D sr2_written) {
> -		dev_dbg(nor->dev, "SR2: Read back test failed\n");
> -		return -EIO;
> -	}
> -
> -	return 0;
> -}
> -
>  static const struct spi_nor_manufacturer *manufacturers[] =3D {
>  	&spi_nor_atmel,
>  	&spi_nor_eon,
> @@ -2494,6 +2191,7 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u=
32 *hwcaps)
>  {
>  	struct spi_nor_flash_parameter *params =3D nor->params;
>  	unsigned int cap;
> +	u8 opcode;
> =20
>  	/* X-X-X modes are not supported yet, mask them all. */
>  	*hwcaps &=3D ~SNOR_HWCAPS_X_X_X;
> @@ -2525,14 +2223,14 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor,=
 u32 *hwcaps)
>  			*hwcaps &=3D ~BIT(cap);
>  	}
> =20
> -	/* Some SPI controllers might not support CR read opcode. */
> -	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
> -		struct spi_mem_op op =3D SPI_NOR_RDCR_OP(nor->bouncebuf);
> -
> +	/* Some SPI controllers might not support reading SR2 */
> +	opcode =3D nor->params->read_sr2_opcode;
> +	if (opcode) {
> +		struct spi_mem_op op =3D SPI_NOR_RDSR_OP(opcode, nor->bouncebuf, 1);
>  		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> =20
>  		if (!spi_mem_supports_op(nor->spimem, &op))
> -			nor->flags |=3D SNOR_F_NO_READ_CR;
> +			nor->params->read_sr2_opcode =3D 0;
>  	}
>  }
> =20
> @@ -3106,11 +2804,14 @@ static void spi_nor_init_default_params(struct sp=
i_nor *nor)
>  	const struct flash_info *info =3D nor->info;
>  	struct device_node *np =3D spi_nor_get_flash_node(nor);
> =20
> -	params->quad_enable =3D spi_nor_sr2_bit1_quad_enable;
> -	params->otp.org =3D info->otp;
> -
> -	/* Default to 16-bit Write Status (01h) Command */
> +	/* Default to 16-bit Read/Write Status commands */
>  	nor->flags |=3D SNOR_F_HAS_16BIT_SR;
> +	params->read_srs_opcode =3D SPINOR_OP_RDSR;
> +	params->write_srs_opcode =3D SPINOR_OP_WRSR;
> +	params->quad_enable =3D spi_nor_generic_quad_enable;
> +	params->qe_mask[1] =3D BIT(1);

Not sure this is a safe bet. I'd need to consult all datasheets of
the different vendors. Not now..

> +
> +	params->otp.org =3D info->otp;
> =20
>  	/* Set SPI NOR sizes. */
>  	params->writesize =3D 1;
> @@ -3258,8 +2959,11 @@ static int spi_nor_quad_enable(struct spi_nor *nor=
)
>  		return 0;
> =20
>  	if (!(spi_nor_get_protocol_width(nor->read_proto) =3D=3D 4 ||
> -	      spi_nor_get_protocol_width(nor->write_proto) =3D=3D 4))
> +	      spi_nor_get_protocol_width(nor->write_proto) =3D=3D 4)) {
> +		nor->params->qe_mask[0] =3D 0;
> +		nor->params->qe_mask[1] =3D 0;

Why setting the mask to 0? The mask is still valid, but we just
cannot use it. But it could still be a useful information, i.e. in
debugfs.

>  		return 0;
> +	}
> =20
>  	return nor->params->quad_enable(nor);
>  }
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index ba2d1a862c9d..d4aff914caf5 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -37,36 +37,18 @@
>  		   SPI_MEM_OP_NO_DUMMY,					\
>  		   SPI_MEM_OP_NO_DATA)
> =20
> -#define SPI_NOR_RDSR_OP(buf)						\
> -	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR, 0),			\
> +#define SPI_NOR_RDSR_OP(opcode, buf, len)				\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),				\
>  		   SPI_MEM_OP_NO_ADDR,					\
>  		   SPI_MEM_OP_NO_DUMMY,					\
> -		   SPI_MEM_OP_DATA_IN(1, buf, 0))
> +		   SPI_MEM_OP_DATA_IN(len, buf, 0))
> =20
> -#define SPI_NOR_WRSR_OP(buf, len)					\
> -	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR, 0),			\
> +#define SPI_NOR_WRSR_OP(opcode, buf, len)				\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),				\
>  		   SPI_MEM_OP_NO_ADDR,					\
>  		   SPI_MEM_OP_NO_DUMMY,					\
>  		   SPI_MEM_OP_DATA_OUT(len, buf, 0))
> =20
> -#define SPI_NOR_RDSR2_OP(buf)						\
> -	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR2, 0),			\
> -		   SPI_MEM_OP_NO_ADDR,					\
> -		   SPI_MEM_OP_NO_DUMMY,					\
> -		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
> -
> -#define SPI_NOR_WRSR2_OP(buf)						\
> -	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR2, 0),			\
> -		   SPI_MEM_OP_NO_ADDR,					\
> -		   SPI_MEM_OP_NO_DUMMY,					\
> -		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
> -
> -#define SPI_NOR_RDCR_OP(buf)						\
> -	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDCR, 0),			\
> -		   SPI_MEM_OP_NO_ADDR,					\
> -		   SPI_MEM_OP_NO_DUMMY,					\
> -		   SPI_MEM_OP_DATA_IN(1, buf, 0))
> -
>  #define SPI_NOR_EN4B_EX4B_OP(enable)					\
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(enable ? SPINOR_OP_EN4B : SPINOR_OP_EX4B, 0),=
	\
>  		   SPI_MEM_OP_NO_ADDR,					\
> @@ -130,7 +112,6 @@ enum spi_nor_option_flags {
>  	SNOR_F_HAS_4BAIT	=3D BIT(4),
>  	SNOR_F_HAS_LOCK		=3D BIT(5),
>  	SNOR_F_HAS_16BIT_SR	=3D BIT(6),
> -	SNOR_F_NO_READ_CR	=3D BIT(7),
>  	SNOR_F_HAS_SR_TB_BIT6	=3D BIT(8),
>  	SNOR_F_HAS_4BIT_BP      =3D BIT(9),
>  	SNOR_F_HAS_SR_BP3_BIT6  =3D BIT(10),
> @@ -375,6 +356,13 @@ struct spi_nor_otp {
>   * @otp:		SPI NOR OTP info.
>   * @set_octal_dtr:	enables or disables SPI NOR octal DTR mode.
>   * @quad_enable:	enables SPI NOR quad mode.
> + * @qe_mask:		two bytes mask used to set/clear the QE bit

Two bytes? I assume that's one for each status register. That's not
really clear. But also see above, maybe make it u32.

> + * @read_srs_opcode:	opcode used to read SR1 and SR2 in one operation
> + * @read_sr1_opcode:	opcode used to read SR1 alone
> + * @read_sr2_opcode:	opcode used to read SR2 alone
> + * @write_srs_opcode:	opcode used to write SR1 and SR2 in one operation
> + * @write_sr1_opcode:	opcode used to write SR1 alone
> + * @write_sr2_opcode:	opcode used to write SR2 alone
>   * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
>   * @ready:		(optional) flashes might use a different mechanism
>   *			than reading the status register to indicate they
> @@ -405,6 +393,13 @@ struct spi_nor_flash_parameter {
> =20
>  	int (*set_octal_dtr)(struct spi_nor *nor, bool enable);
>  	int (*quad_enable)(struct spi_nor *nor);
> +	u8				qe_mask[2];
> +	u8				read_srs_opcode;
> +	u8				read_sr1_opcode;
> +	u8				read_sr2_opcode;
> +	u8				write_srs_opcode;
> +	u8				write_sr1_opcode;
> +	u8				write_sr2_opcode;

Can we move all the opcodes into one place? There is already a
die_erase_opcode. Though it might just be a good idea now to group
them into a subnode.

spi_nor_flash_opcodes {
	u8 die_erase;
	u8 rdsr;
	u8 rdsr1;
	u8 rdsr2;
	u8 wrsr;
	u8 wrsr1;
	u8 wrsr2;
};

Also I'd make it a callback, so a it can be overwritten if there's
some weird flash.

int (*read_sr)(struct spi_nor *nor, u32 *sr, u8 bm)
int (*write_sr)(struct spi_nor *nor, u32 sr, u8 bm)

int spi_nor_generic_read_sr(struct spi_nor *nor, u32 *sr,
                            u8 byte_mask)
{
	spi_nor_flash_parameter *params =3D nor->params;

	if (params->flags & SNOR_F_SUPPORTS_SR_16BIT_READ)
		...
}

int spi_nor_generic_write_sr(struct spi_nor *nor, u32 *sr,
                             u8 byte_mask)
{
	if (params->flags & SNOR_F_HAS_16BIT_SR)
		...
}

-michael

>  	int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
>  	int (*ready)(struct spi_nor *nor);
> =20
> @@ -633,18 +628,11 @@ int spi_nor_wait_till_ready(struct spi_nor *nor);
>  int spi_nor_global_block_unlock(struct spi_nor *nor);
>  int spi_nor_prep_and_lock(struct spi_nor *nor);
>  void spi_nor_unlock_and_unprep(struct spi_nor *nor);
> -int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
> -int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
> -int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
>  int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
>  		    enum spi_nor_protocol reg_proto);
> -int spi_nor_read_sr(struct spi_nor *nor, u8 *sr);
>  int spi_nor_sr_ready(struct spi_nor *nor);
> -int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
> -int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
> -int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
> -int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr);
> -int spi_nor_write_sr_cr_and_check(struct spi_nor *nor, const u8 *regs);
> +int spi_nor_read_srs(struct spi_nor *nor, u8 *sr1, u8 *sr2);
> +int spi_nor_write_srs(struct spi_nor *nor, const u8 *sr1, const u8 *sr2)=
;
> =20
>  ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
>  			  u8 *buf);
> diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.=
c
> index fbefcef2d2e1..5d1c31edb417 100644
> --- a/drivers/mtd/spi-nor/debugfs.c
> +++ b/drivers/mtd/spi-nor/debugfs.c
> @@ -19,7 +19,6 @@ static const char *const snor_f_names[] =3D {
>  	SNOR_F_NAME(HAS_4BAIT),
>  	SNOR_F_NAME(HAS_LOCK),
>  	SNOR_F_NAME(HAS_16BIT_SR),
> -	SNOR_F_NAME(NO_READ_CR),
>  	SNOR_F_NAME(HAS_SR_TB_BIT6),
>  	SNOR_F_NAME(HAS_4BIT_BP),
>  	SNOR_F_NAME(HAS_SR_BP3_BIT6),
> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigad=
evice.c
> index ef1edd0add70..4070a692e968 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -23,8 +23,10 @@ gd25q256_post_bfpt(struct spi_nor *nor,
>  	 *      GD25Q256E      | SFDP_JESD216_MAJOR | SFDP_JESD216B_MINOR
>  	 */
>  	if (bfpt_header->major =3D=3D SFDP_JESD216_MAJOR &&
> -	    bfpt_header->minor =3D=3D SFDP_JESD216_MINOR)
> -		nor->params->quad_enable =3D spi_nor_sr1_bit6_quad_enable;
> +	    bfpt_header->minor =3D=3D SFDP_JESD216_MINOR) {
> +		nor->params->qe_mask[0] =3D BIT(6);
> +		nor->params->qe_mask[1] =3D 0;
> +	}
> =20
>  	return 0;
>  }
> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> index 18d9a00aa22e..04db42b5141e 100644
> --- a/drivers/mtd/spi-nor/issi.c
> +++ b/drivers/mtd/spi-nor/issi.c
> @@ -131,7 +131,8 @@ static const struct flash_info issi_nor_parts[] =3D {
> =20
>  static void issi_nor_default_init(struct spi_nor *nor)
>  {
> -	nor->params->quad_enable =3D spi_nor_sr1_bit6_quad_enable;
> +	nor->params->qe_mask[0] =3D BIT(6);
> +	nor->params->qe_mask[1] =3D 0;
>  }
> =20
>  static const struct spi_nor_fixups issi_fixups =3D {
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macroni=
x.c
> index e97f5cbd9aad..55612237c1ef 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -65,11 +65,12 @@ mx25l3255e_late_init_fixups(struct spi_nor *nor)
> =20
>  	/*
>  	 * SFDP of MX25L3255E is JESD216, which does not include the Quad
> -	 * Enable bit Requirement in BFPT. As a result, during BFPT parsing,
> -	 * the quad_enable method is not set to spi_nor_sr1_bit6_quad_enable.
> -	 * Therefore, it is necessary to correct this setting by late_init.
> +	 * Enable bit Requirement in BFPT. As a result, during BFPT parsing
> +	 * the quad_enable mask is reset. Therefore, it is necessary to
> +	 * correct this setting by late_init.
>  	 */
> -	params->quad_enable =3D spi_nor_sr1_bit6_quad_enable;
> +	params->qe_mask[0] =3D BIT(6);
> +	params->qe_mask[1] =3D 0;
> =20
>  	/*
>  	 * In addition, MX25L3255E also supports 1-4-4 page program in 3-byte
> @@ -314,7 +315,8 @@ static int macronix_nor_set_octal_dtr(struct spi_nor =
*nor, bool enable)
> =20
>  static void macronix_nor_default_init(struct spi_nor *nor)
>  {
> -	nor->params->quad_enable =3D spi_nor_sr1_bit6_quad_enable;
> +	nor->params->qe_mask[0] =3D BIT(6);
> +	nor->params->qe_mask[1] =3D 0;
>  }
> =20
>  static int macronix_nor_late_init(struct spi_nor *nor)
> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> index 7d0b145d78d8..64686b904e24 100644
> --- a/drivers/mtd/spi-nor/otp.c
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -175,24 +175,24 @@ static int spi_nor_otp_lock_bit_cr(unsigned int reg=
ion)
>   */
>  int spi_nor_otp_lock_sr2(struct spi_nor *nor, unsigned int region)
>  {
> -	u8 *cr =3D nor->bouncebuf;
>  	int ret, lock_bit;
> +	u8 sr2;
> =20
>  	lock_bit =3D spi_nor_otp_lock_bit_cr(region);
>  	if (lock_bit < 0)
>  		return lock_bit;
> =20
> -	ret =3D spi_nor_read_cr(nor, cr);
> +	ret =3D spi_nor_read_srs(nor, NULL, &sr2);
>  	if (ret)
>  		return ret;
> =20
>  	/* no need to write the register if region is already locked */
> -	if (cr[0] & lock_bit)
> +	if (sr2 & lock_bit)
>  		return 0;
> =20
> -	cr[0] |=3D lock_bit;
> +	sr2 |=3D lock_bit;
> =20
> -	return spi_nor_write_16bit_cr_and_check(nor, cr[0]);
> +	return spi_nor_write_srs(nor, NULL, &sr2);
>  }
> =20
>  /**
> @@ -207,18 +207,18 @@ int spi_nor_otp_lock_sr2(struct spi_nor *nor, unsig=
ned int region)
>   */
>  int spi_nor_otp_is_locked_sr2(struct spi_nor *nor, unsigned int region)
>  {
> -	u8 *cr =3D nor->bouncebuf;
>  	int ret, lock_bit;
> +	u8 sr2;
> =20
>  	lock_bit =3D spi_nor_otp_lock_bit_cr(region);
>  	if (lock_bit < 0)
>  		return lock_bit;
> =20
> -	ret =3D spi_nor_read_cr(nor, cr);
> +	ret =3D spi_nor_read_srs(nor, NULL, &sr2);
>  	if (ret)
>  		return ret;
> =20
> -	return cr[0] & lock_bit;
> +	return sr2 & lock_bit;
>  }
> =20
>  static loff_t spi_nor_otp_region_start(const struct spi_nor *nor, unsign=
ed int region)
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 4600983cb579..23b809cc958f 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -561,10 +561,21 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	val >>=3D BFPT_DWORD11_PAGE_SIZE_SHIFT;
>  	params->page_size =3D 1U << val;
> =20
> +	/*
> +	 * The standard declares various read and write status methods, some of
> +	 * them will be overloaded based on the QER field.
> +	 */
> +	params->read_srs_opcode =3D SPINOR_OP_RDSR;

Not sure, that's a sane default. I think it was always 05/35 for
reading. Some newer flashes might have mapped the sr2 to the second
byte for the 05 opcode.

> +	params->read_sr1_opcode =3D SPINOR_OP_RDSR;
> +	params->read_sr2_opcode =3D SPINOR_OP_RDCR;
> +	params->write_srs_opcode =3D SPINOR_OP_WRSR;
> +	params->write_sr1_opcode =3D SPINOR_OP_WRSR;
> +
>  	/* Quad Enable Requirements. */
>  	switch (bfpt.dwords[SFDP_DWORD(15)] & BFPT_DWORD15_QER_MASK) {
>  	case BFPT_DWORD15_QER_NONE:
> -		params->quad_enable =3D NULL;
> +		params->qe_mask[0] =3D 0;
> +		params->qe_mask[1] =3D 0;
>  		break;
> =20
>  	case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
> @@ -572,23 +583,33 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  		 * Writing only one byte to the Status Register has the
>  		 * side-effect of clearing Status Register 2.
>  		 */
> +		params->write_sr1_opcode =3D 0;
> +		fallthrough;
>  	case BFPT_DWORD15_QER_SR2_BIT1_NO_RD:
>  		/*
>  		 * Read Configuration Register (35h) instruction is not
>  		 * supported.
>  		 */
> -		nor->flags |=3D SNOR_F_HAS_16BIT_SR | SNOR_F_NO_READ_CR;
> -		params->quad_enable =3D spi_nor_sr2_bit1_quad_enable;
> +		params->read_sr2_opcode =3D 0;
> +		nor->flags |=3D SNOR_F_HAS_16BIT_SR;
> +		params->qe_mask[0] =3D 0;
> +		params->qe_mask[1] =3D BIT(1);
>  		break;
> =20
>  	case BFPT_DWORD15_QER_SR1_BIT6:
>  		nor->flags &=3D ~SNOR_F_HAS_16BIT_SR;
> -		params->quad_enable =3D spi_nor_sr1_bit6_quad_enable;
> +		params->qe_mask[0] =3D BIT(6);
> +		params->qe_mask[1] =3D 0;
>  		break;
> =20
>  	case BFPT_DWORD15_QER_SR2_BIT7:
>  		nor->flags &=3D ~SNOR_F_HAS_16BIT_SR;
> -		params->quad_enable =3D spi_nor_sr2_bit7_quad_enable;
> +		params->qe_mask[0] =3D 0;
> +		params->qe_mask[1] =3D BIT(7);
> +		params->read_srs_opcode =3D 0;
> +		params->read_sr2_opcode =3D SPINOR_OP_RDSR2;
> +		params->write_srs_opcode =3D 0;
> +		params->write_sr2_opcode =3D SPINOR_OP_WRSR2;
>  		break;
> =20
>  	case BFPT_DWORD15_QER_SR2_BIT1:
> @@ -599,8 +620,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  		 * assumption of a 16-bit Write Status (01h) command.
>  		 */
>  		nor->flags |=3D SNOR_F_HAS_16BIT_SR;
> -
> -		params->quad_enable =3D spi_nor_sr2_bit1_quad_enable;
> +		params->write_sr1_opcode =3D 0;
> +		params->read_srs_opcode =3D 0;
> +		params->qe_mask[0] =3D 0;
> +		params->qe_mask[1] =3D BIT(1);
>  		break;
> =20
>  	default:
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansio=
n.c
> index 19a0ad145599..2689ea21074c 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -399,8 +399,9 @@ static int cypress_nor_determine_addr_mode_by_sr1(str=
uct spi_nor *nor,
>  					  nor->bouncebuf);
>  	bool is3byte, is4byte;
>  	int ret;
> +	u8 sr;
> =20
> -	ret =3D spi_nor_read_sr(nor, &nor->bouncebuf[1]);
> +	ret =3D spi_nor_read_srs(nor, &sr, NULL);
>  	if (ret)
>  		return ret;
> =20
> @@ -408,7 +409,7 @@ static int cypress_nor_determine_addr_mode_by_sr1(str=
uct spi_nor *nor,
>  	if (ret)
>  		return ret;
> =20
> -	is3byte =3D (nor->bouncebuf[0] =3D=3D nor->bouncebuf[1]);
> +	is3byte =3D (nor->bouncebuf[0] =3D=3D sr);
> =20
>  	op =3D (struct spi_mem_op)
>  		CYPRESS_NOR_RD_ANY_REG_OP(4, SPINOR_REG_CYPRESS_STR1V, 0,
> @@ -417,7 +418,7 @@ static int cypress_nor_determine_addr_mode_by_sr1(str=
uct spi_nor *nor,
>  	if (ret)
>  		return ret;
> =20
> -	is4byte =3D (nor->bouncebuf[0] =3D=3D nor->bouncebuf[1]);
> +	is4byte =3D (nor->bouncebuf[0] =3D=3D sr);
> =20
>  	if (is3byte =3D=3D is4byte)
>  		return -EIO;
> @@ -1098,13 +1099,14 @@ static const struct flash_info spansion_nor_parts=
[] =3D {
>  static int spansion_nor_sr_ready_and_clear(struct spi_nor *nor)
>  {
>  	int ret;
> +	u8 sr;
> =20
> -	ret =3D spi_nor_read_sr(nor, nor->bouncebuf);
> +	ret =3D spi_nor_read_srs(nor, &sr, NULL);
>  	if (ret)
>  		return ret;
> =20
> -	if (nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
> -		if (nor->bouncebuf[0] & SR_E_ERR)
> +	if (sr & (SR_E_ERR | SR_P_ERR)) {
> +		if (sr & SR_E_ERR)
>  			dev_err(nor->dev, "Erase Error occurred\n");
>  		else
>  			dev_err(nor->dev, "Programming Error occurred\n");
> @@ -1124,7 +1126,7 @@ static int spansion_nor_sr_ready_and_clear(struct s=
pi_nor *nor)
>  		return -EIO;
>  	}
> =20
> -	return !(nor->bouncebuf[0] & SR_WIP);
> +	return !(sr & SR_WIP);
>  }
> =20
>  static int spansion_nor_late_init(struct spi_nor *nor)
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index db02c14ba16f..15f8b2cbd497 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -21,16 +21,17 @@ static int sst26vf_nor_lock(struct spi_nor *nor, loff=
_t ofs, u64 len)
>  static int sst26vf_nor_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
>  {
>  	int ret;
> +	u8 cr;
> =20
>  	/* We only support unlocking the entire flash array. */
>  	if (ofs !=3D 0 || len !=3D nor->params->size)
>  		return -EINVAL;
> =20
> -	ret =3D spi_nor_read_cr(nor, nor->bouncebuf);
> +	ret =3D spi_nor_read_srs(nor, NULL, &cr);
>  	if (ret)
>  		return ret;
> =20
> -	if (!(nor->bouncebuf[0] & SST26VF_CR_BPNV)) {
> +	if (!(cr & SST26VF_CR_BPNV)) {
>  		dev_dbg(nor->dev, "Any block has been permanently locked\n");
>  		return -EINVAL;
>  	}
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 235070b215d1..d746cb595b09 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -36,7 +36,7 @@ static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
> =20
>  static u8 spi_nor_get_sr_cmp_mask(struct spi_nor *nor)
>  {
> -	if (!(nor->flags & SNOR_F_NO_READ_CR) &&
> +	if (nor->params->read_sr2_opcode &&
>  	    nor->flags & SNOR_F_HAS_SR2_CMP_BIT6)
>  		return SR2_CMP_BIT6;
>  	else
> @@ -207,17 +207,9 @@ void spi_nor_cache_sr_lock_bits(struct spi_nor *nor,=
 u8 *sr)
> =20
> =20
>  	if (!sr) {
> -		if (spi_nor_read_sr(nor, nor->bouncebuf))
> +		if (spi_nor_read_srs(nor, &sr_cr[0], &sr_cr[1]))
>  			return;
> =20
> -		sr_cr[0] =3D nor->bouncebuf[0];
> -
> -		if (!(nor->flags & SNOR_F_NO_READ_CR)) {
> -			if (spi_nor_read_cr(nor, nor->bouncebuf))
> -				return;
> -		}
> -
> -		sr_cr[1] =3D nor->bouncebuf[0];
>  		sr =3D sr_cr;
>  	}
> =20
> @@ -273,20 +265,10 @@ static int spi_nor_sr_lock(struct spi_nor *nor, lof=
f_t ofs, u64 len)
>  	int ret;
>  	u8 pow;
> =20
> -	ret =3D spi_nor_read_sr(nor, nor->bouncebuf);
> +	ret =3D spi_nor_read_srs(nor, &status_old[0], &status_old[1]);
>  	if (ret)
>  		return ret;
> =20
> -	status_old[0] =3D nor->bouncebuf[0];
> -
> -	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
> -		ret =3D spi_nor_read_cr(nor, nor->bouncebuf);
> -		if (ret)
> -			return ret;
> -
> -		status_old[1] =3D nor->bouncebuf[0];
> -	}
> -
>  	/* If nothing in our range is unlocked, we don't need to do anything */
>  	if (spi_nor_is_locked_sr(nor, ofs, len, status_old))
>  		return 0;
> @@ -378,10 +360,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff=
_t ofs, u64 len)
>  	    (ofs_old < ofs_new || (ofs_new + len_new) < (ofs_old + len_old)))
>  		return -EINVAL;
> =20
> -	if (nor->flags & SNOR_F_NO_READ_CR)
> -		ret =3D spi_nor_write_sr_and_check(nor, best_status_new[0]);
> -	else
> -		ret =3D spi_nor_write_sr_cr_and_check(nor, best_status_new);
> +	ret =3D spi_nor_write_srs(nor, &best_status_new[0], &best_status_new[1]=
);
>  	if (ret)
>  		return ret;
> =20
> @@ -409,20 +388,10 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, l=
off_t ofs, u64 len)
>  	int ret;
>  	u8 pow;
> =20
> -	ret =3D spi_nor_read_sr(nor, nor->bouncebuf);
> +	ret =3D spi_nor_read_srs(nor, &status_old[0], &status_old[1]);
>  	if (ret)
>  		return ret;
> =20
> -	status_old[0] =3D nor->bouncebuf[0];
> -
> -	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
> -		ret =3D spi_nor_read_cr(nor, nor->bouncebuf);
> -		if (ret)
> -			return ret;
> -
> -		status_old[1] =3D nor->bouncebuf[0];
> -	}
> -
>  	/* If nothing in our range is locked, we don't need to do anything */
>  	if (spi_nor_is_unlocked_sr(nor, ofs, len, status_old))
>  		return 0;
> @@ -512,10 +481,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, lo=
ff_t ofs, u64 len)
>  	    (ofs_new < ofs_old || (ofs_old + len_old) < (ofs_new + len_new)))
>  		return -EINVAL;
> =20
> -	if (nor->flags & SNOR_F_NO_READ_CR)
> -		ret =3D spi_nor_write_sr_and_check(nor, best_status_new[0]);
> -	else
> -		ret =3D spi_nor_write_sr_cr_and_check(nor, best_status_new);
> +	ret =3D spi_nor_write_srs(nor, &best_status_new[0], &best_status_new[1]=
);
>  	if (ret)
>  		return ret;
> =20
> @@ -536,20 +502,10 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor=
, loff_t ofs, u64 len)
>  	u8 sr_cr[2] =3D {};
>  	int ret;
> =20
> -	ret =3D spi_nor_read_sr(nor, nor->bouncebuf);
> +	ret =3D spi_nor_read_srs(nor, &sr_cr[0], &sr_cr[1]);
>  	if (ret)
>  		return ret;
> =20
> -	sr_cr[0] =3D nor->bouncebuf[0];
> -
> -	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
> -		ret =3D spi_nor_read_cr(nor, nor->bouncebuf);
> -		if (ret)
> -			return ret;
> -
> -		sr_cr[1] =3D nor->bouncebuf[0];
> -	}
> -
>  	return spi_nor_is_locked_sr(nor, ofs, len, sr_cr);
>  }
> =20
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.=
c
> index 60a7bb1f2ce4..f96a11531a09 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -481,13 +481,13 @@ static int winbond_nor_late_init(struct spi_nor *no=
r)
>  	 * been to declare CR reads as unsupported, whereas the Jedec
>  	 * specification doesn't clearly state that. In practice, all these
>  	 * chips do support reading back the CR, which is needed for SWP suppor=
t,
> -	 * so make sure that capability remains enabled (needed for SWP).
> +	 * so make sure that capability remains enabled.
>  	 * In practice, only exclude the old W25X family (JEDEC ID: EF 30 xx)
>  	 * which actually does not support this feature.
>  	 */
>  	if (nor->info->id->bytes[0] =3D=3D 0xef &&
>  	    nor->info->id->bytes[1] > 0x30)
> -		nor->flags &=3D ~SNOR_F_NO_READ_CR;
> +		params->read_sr2_opcode =3D SPINOR_OP_RDCR;
> =20
>  	return 0;
>  }
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 4b92494827b1..f0b5a1989881 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -113,20 +113,16 @@
>  #define SR_E_ERR		BIT(5)
>  #define SR_P_ERR		BIT(6)
> =20
> -#define SR1_QUAD_EN_BIT6	BIT(6)
> -
>  #define SR_BP_SHIFT		2
> =20
>  /* Enhanced Volatile Configuration Register bits */
>  #define EVCR_QUAD_EN_MICRON	BIT(7)	/* Micron Quad I/O */
> =20
>  /* Status Register 2 bits. */
> -#define SR2_QUAD_EN_BIT1	BIT(1)
>  #define SR2_LB1			BIT(3)	/* Security Register Lock Bit 1 */
>  #define SR2_LB2			BIT(4)	/* Security Register Lock Bit 2 */
>  #define SR2_LB3			BIT(5)	/* Security Register Lock Bit 3 */
>  #define SR2_CMP_BIT6		BIT(6)
> -#define SR2_QUAD_EN_BIT7	BIT(7)
> =20
>  /* Supported SPI protocols */
>  #define SNOR_PROTO_INST_MASK	GENMASK(23, 16)


--0610f1ebae319002edd6101cb49e58853663e0733d7e3b3d77139c0f443e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCakzKUBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gSHwGAkDIGJq3x7VC8vxF/K87Ot5A9CPJpnEoz
XRZDURtqkSw15thQHSl9xmCxLCC0yMbFAYD5Y65HPSZX/f8LzU+HB/pbNmqtQ8lk
N2k48fYcUnHl/Si8YJJrZCdyfvD7x4potsA=
=lfRf
-----END PGP SIGNATURE-----

--0610f1ebae319002edd6101cb49e58853663e0733d7e3b3d77139c0f443e--


--===============8668739728521531230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8668739728521531230==--

