Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A557CCED243
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Nov 2025 12:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRoO9bi+aObI5+Vk0Aa9v4I4iRGTQFx3KFL+sGYd4Q4=; b=LJzj6xuSl0LYD+pbL8+1WNggKD
	eRsTqGCis5+mGOBNljJdEDipkQEuHrjZoqKdExRwp4doZY6uYS8djP/0V/dDSvh45ZHF8HV/oYKgM
	nY57DW2wXwZc3wvoJLUIup1yTzgEQTj3aUw+j6iWvp9Hh45NCgdbHhkuFSrSSqMFhDoMalisSGGST
	p1zB0uYsOEvhklnZCJUs73yR8a2A1iaOB2jyxrW/ryjB5h/I1oELn11bRwPfG1YV5PSCPzlvJKV1T
	pa04WZzY0FVnr326JtEX7rsFVnGU/mWgXJrXsvEPKUlfk1cCxYu3sZ65AnM0KLQUtO23b+0GxBr9x
	xIP1yA0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLL6u-00000000RHe-1uXp;
	Tue, 18 Nov 2025 12:47:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLL6r-00000000RHH-1bVH
	for linux-mtd@lists.infradead.org;
	Tue, 18 Nov 2025 12:47:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CED7141A69;
	Tue, 18 Nov 2025 12:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC42EC4CEFB;
	Tue, 18 Nov 2025 12:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763470020;
	bh=Q/Plz3ylVM8XTKBkYuFmhDpowiO/ESPOvqC0qViW/tM=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=I+EcS2uJ255q90S5WZx3qwbnOFt2hZzC+p7INcybR2COgaV3s2D4mKShdeL67GFij
	 gU/Xmbox0KXCy20zlsTxSg3gPbVzosJifTRdFbrpkloWBODiDvB98dzC1hVSQByVBl
	 3P8OsfsYU4TewEIakIzu1obRq3sONxDQnpT8eb8CX3X5rAVW7kl389kRkfAIubZ4RW
	 gY/iP5BMHqfNcDq+waAhzOagXf2Pn91nmOuDGag2/RzV0JEs5/vbgRZSOxlqntN1Gd
	 1jyAJr20OhBg4XsKJCAsp0Nwukl/8SK53A75eR2rbm6bJaQmMUzOkYJqF45Zr8b9J2
	 1hpBbqALaCX/g==
Mime-Version: 1.0
Date: Tue, 18 Nov 2025 13:46:52 +0100
Message-Id: <DEBTY3TV74T2.2N3VRS6HGWDXD@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>
Subject: Re: [PATCH 15/19] mtd: spi-nor: debugfs: Add locking support
Cc: "Sean Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com> <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-15-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-15-487bc7129931@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_044701_467949_F1F23767 
X-CRM114-Status: GOOD (  33.83  )
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
Content-Type: multipart/mixed; boundary="===============6370335944435450339=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6370335944435450339==
Content-Type: multipart/signed;
 boundary=b79140256b1e4f2aa973fe6c5b68ba928cc60352cc129e77abeaadae275f;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--b79140256b1e4f2aa973fe6c5b68ba928cc60352cc129e77abeaadae275f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
> The ioctl output may be counter intuitive in some cases. Asking for a
> "locked status" over a region that is only partially locked will return
> "unlocked" whereas in practice maybe the biggest part is actually
> locked.
>
> Knowing what is the real software locking state through debugfs would be
> very convenient for development/debugging purposes, hence this proposal
> for adding two extra blocks at the end of the file:
> - A "software locked sectors" array which lists every section, if it is
> locked or not, showing both the address ranges and the sizes in numbers
> of blocks.

I know the file is called software write protection (or swp) but
it's really a hardware write protection, isn't it?

> - Some kind of mapping of the locked sectors, which pictures the entire
> flash. It may be verbose, so perhaps we'll drop it in the end. I found
> it very useful to really get a clearer mental model of what was
> locked/unlocked, but the array just before is already a good source of
> information.
>
> Here is an example of output, what is after the "sector map" is new.
>
> $ cat /sys/kernel/debug/spi-nor/spi0.0/params
> name		(null)
> id		ef a0 20 00 00 00
> size		64.0 MiB
> write size	1
> page size	256
> address nbytes	4
> flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | HAS=
_SR_TB_BIT6 | HAS_4BIT_BP | SOFT_RESET | NO_WP
>
> opcodes
>  read		0xec
>   dummy cycles	6
>  erase		0xdc
>  program	0x34
>  8D extension	none
>
> protocols
>  read		1S-4S-4S
>  write		1S-1S-4S
>  register	1S-1S-1S
>
> erase commands
>  21 (4.00 KiB) [1]
>  dc (64.0 KiB) [3]
>  c7 (64.0 MiB)
>
> sector map
>  region (in hex)   | erase mask | overlaid
>  ------------------+------------+---------
>  00000000-03ffffff |     [   3] | no
>
> software locked sectors

drop "software" here.

>  region (in hex)   | status   | #blocks
>  ------------------+----------+--------
>  00000000-03ffffff | unlocked | 1024

I really like that.

>
> 64kiB-sectors locking map (x: locked, .: unlocked)
> |........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
.........................
>  ...........................|

Maybe put it into an own file. In any case, a sane line wrapping
would be good. And add a leading offset, ie, "0000: xxxx.....".

..

>  drivers/mtd/spi-nor/core.h    |  4 ++++
>  drivers/mtd/spi-nor/debugfs.c | 45 +++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/mtd/spi-nor/swp.c     | 11 +++++++----
>  3 files changed, 56 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 516ab19dc7b86a5c6ba8729d2ba18904b922df23..8a95592994f749a62b2cc70ab=
85f54d36681e760 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -700,6 +700,10 @@ static inline bool spi_nor_needs_sfdp(const struct s=
pi_nor *nor)
>  	return !nor->info->size;
>  }
> =20
> +u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor);
> +void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff=
_t *ofs, u64 *len);
> +bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, cons=
t u8 *sr);
> +
>  #ifdef CONFIG_DEBUG_FS
>  void spi_nor_debugfs_register(struct spi_nor *nor);
>  void spi_nor_debugfs_shutdown(void);
> diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.=
c
> index d0191eb9f87956418dfd964fc1f16b21e3345049..d2af4c189aad68bab78c1c686=
88b5865eebef9b9 100644
> --- a/drivers/mtd/spi-nor/debugfs.c
> +++ b/drivers/mtd/spi-nor/debugfs.c
> @@ -77,12 +77,16 @@ static void spi_nor_print_flags(struct seq_file *s, u=
nsigned long flags,
>  static int spi_nor_params_show(struct seq_file *s, void *data)
>  {
>  	struct spi_nor *nor =3D s->private;
> +	unsigned int min_prot_len =3D spi_nor_get_min_prot_length_sr(nor);
>  	struct spi_nor_flash_parameter *params =3D nor->params;
>  	struct spi_nor_erase_map *erase_map =3D &params->erase_map;
>  	struct spi_nor_erase_region *region =3D erase_map->regions;
>  	const struct flash_info *info =3D nor->info;
> +	loff_t lock_start, lock_length;
>  	char buf[16], *str;
>  	unsigned int i;
> +	u8 sr[2] =3D {};
> +	int ret;
> =20
>  	seq_printf(s, "name\t\t%s\n", info->name);
>  	seq_printf(s, "id\t\t%*ph\n", SPI_NOR_MAX_ID_LEN, nor->id);
> @@ -159,6 +163,47 @@ static int spi_nor_params_show(struct seq_file *s, v=
oid *data)
>  			   region[i].overlaid ? "yes" : "no");
>  	}
> =20
> +	seq_puts(s, "\nsoftware locked sectors\n");
> +	seq_puts(s, " region (in hex)   | status   | #blocks\n");
> +	seq_puts(s, " ------------------+----------+--------\n");
> +
> +	ret =3D spi_nor_read_sr(nor, nor->bouncebuf);
> +	if (ret)
> +		return ret;
> +
> +	sr[0] =3D nor->bouncebuf[0];
> +
> +	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
> +		ret =3D spi_nor_read_cr(nor, nor->bouncebuf + 1);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	sr[1] =3D nor->bouncebuf[1];

Shouldn't that go into the former if conditional? bouncebuf[1] might
never be read.

Also, until now, reading the "params" debug file never interacts
with the flash, but with this patch it does. We don't do locking
here which looks wrong. Maybe we should just cache the protection
bits. Not sure.

> +
> +	spi_nor_get_locked_range_sr(nor, sr, &lock_start, &lock_length);
> +	if (!lock_length || lock_length =3D=3D params->size) {
> +		seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, params->size - 1,
> +			   lock_length ? "  locked" : "unlocked", params->size / min_prot_len=
);
> +	} else if (!lock_start) {
> +		seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, lock_length - 1,
> +			   "  locked", lock_length / min_prot_len);
> +		seq_printf(s, " %08llx-%08llx | %s | %llu\n", lock_length, params->siz=
e - 1,
> +			   "unlocked", (params->size - lock_length) / min_prot_len);
> +	} else {
> +		seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, lock_start - 1,
> +			   "unlocked", lock_start / min_prot_len);
> +		seq_printf(s, " %08llx-%08llx | %s | %llu\n", lock_start, params->size=
 - 1,
> +			   "  locked", lock_length / min_prot_len);
> +	}
> +
> +	seq_printf(s, "\n%dkiB-sectors locking map (x: locked, .: unlocked)\n",
> +		   min_prot_len / 1024);
> +	seq_puts(s, "|");
> +	for (i =3D 0; i < params->size; i +=3D min_prot_len)
> +		seq_printf(s, spi_nor_is_locked_sr(nor, i, min_prot_len, sr) ? "x" : "=
.");

As mentioned above, newlines as well as a leading offset counter
would be nice :)

-michael

> +	seq_puts(s, "|\n");
> +
>  	return 0;
>  }
>  DEFINE_SHOW_ATTRIBUTE(spi_nor_params);
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index f5ec05d6f2680113332f47e0efbcb4d88f0d3e3c..0e685aa3a4fdc3100b5259659=
a3083c14a2cf127 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -32,7 +32,7 @@ static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
>  		return SR_TB_BIT5;
>  }
> =20
> -static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
> +u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
>  {
>  	unsigned int bp_slots, bp_slots_needed;
>  	/*
> @@ -53,8 +53,8 @@ static u64 spi_nor_get_min_prot_length_sr(struct spi_no=
r *nor)
>  		return sector_size;
>  }
> =20
> -static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *s=
r, loff_t *ofs,
> -					u64 *len)
> +void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff=
_t *ofs,
> +				 u64 *len)
>  {
>  	u64 min_prot_len;
>  	u8 bp_mask =3D spi_nor_get_sr_bp_mask(nor);
> @@ -112,7 +112,7 @@ static bool spi_nor_check_lock_status_sr(struct spi_n=
or *nor, loff_t ofs,
>  		return (ofs >=3D lock_offs_max) || (offs_max <=3D lock_offs);
>  }
> =20
> -static bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 le=
n, const u8 *sr)
> +bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, cons=
t u8 *sr)
>  {
>  	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, true);
>  }
> @@ -374,6 +374,9 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor, =
loff_t ofs, u64 len)
>   * -is_locked(): Checks if the region is *fully* locked, returns false o=
therwise.
>   *               This feeback may be misleading because users may get an=
 "unlocked"
>   *               status even though a subpart of the region is effective=
ly locked.
> + *
> + * If in doubt during development, check-out the debugfs output which tr=
ies to
> + * be more user friendly.
>   */
>  static const struct spi_nor_locking_ops spi_nor_sr_locking_ops =3D {
>  	.lock =3D spi_nor_sr_lock,


--b79140256b1e4f2aa973fe6c5b68ba928cc60352cc129e77abeaadae275f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaRxqvBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jaMgF/Vu5KAaUvZ6tgLgzqeCOoRKZVByxp7VYl
cpffU68YmLSEJCVC19j6EUgvcFHfWw85AX9szK1IE35kcNXsGKMTxHiG6YQyUZLV
MuRj5nSfc0HD8ATKtR9rRe7Qw4AdgnqxqGk=
=y7oz
-----END PGP SIGNATURE-----

--b79140256b1e4f2aa973fe6c5b68ba928cc60352cc129e77abeaadae275f--


--===============6370335944435450339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6370335944435450339==--

