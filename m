Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D1FC43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 14:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjL98d1WGqWts7YDQGdEVaA55ofY1JE31ZZPByfaeUw=; b=FL2eDsflFLihEIv4KkYCBimr/t
	b/ICDfl9s8vHzDaffoDDfFfS3vqQ1Ic42E6P6xWF80fjXLeCwj6WWxU945Km/OdoRmyyqzqOGMUSg
	wsCbpQw5eTDO2dyKUngdGKGQFknXTm+ud7LyRLz74+KS1g+s1edbozNpFqhy1wBoKEln/FFzLwE7R
	XzSgmg6zndyXbSJwlK7U+7gciuMVEYfTwDjRaeUeTAAcdmV390J5Z3Fc/4IPV+NiPjKe6fDHp7p8f
	FpSVpiRU/wCdFb+mcLBXRPt799w40NaCyyQ72ZDYgswBbdpC1KzaH34jRVhl+UbKHgmrVMPPhBM6N
	ACALbyiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkCt-0000000Cjm6-3RPr;
	Mon, 06 Jul 2026 14:21:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkCs-0000000CjlU-45kH
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 14:21:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 21E9760098;
	Mon,  6 Jul 2026 14:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 535C31F000E9;
	Mon,  6 Jul 2026 14:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783347717;
	bh=qPIWZFoGipoSJO4LwovW46jO0+IIbbxHU15whaypgqs=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=Lf+YGLoubA1xusTHRZTAOvUXN8AnUj+0OexAwXZKoMvYeEuKSwayqbfPFvQ7Ob6aF
	 E0Z/3/Zf67l5Y+ICgf8mujfqd/z1gM5LscMvP//On6rYQWqYQQ0Vbd1ShmyOyqGeGx
	 B8VWu+ATce9ShCse2fnKBk/ia/Q8TcZcNjoLtzeo0F9gwRf8HruXbaKLzlTUZk1kj2
	 FZindN+JAItssXIPk1Qhuw5x2+tRLNGPXOeAVmOkN/HhUzZDwDhEz4fFx72Wk+njOz
	 r+8nnSCuO7Ww4f19hNj4G+hFr3jc8tjcyXRfap7RMvvAQa13unG3W5DhXZOzUWmSTc
	 7cQqdq+eRk29w==
Mime-Version: 1.0
Date: Mon, 06 Jul 2026 16:21:54 +0200
Message-Id: <DJRK05XL4ONU.MM3VQ61CQJ6I@kernel.org>
Subject: Re: [PATCH 11/30] mtd: spi-nor: winbond: W25Q32JV-Q/N: Fill locking
 information
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com> <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-11-87e5d3122244@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-11-87e5d3122244@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============3465690620485893142=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3465690620485893142==
Content-Type: multipart/signed;
 boundary=2727a3d7c76515e8d5a1fbcf946f12b78f86351a9e714cf339ba6b9dd00b;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--2727a3d7c76515e8d5a1fbcf946f12b78f86351a9e714cf339ba6b9dd00b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 29, 2026 at 5:22 PM CEST, Miquel Raynal wrote:
> The SFDP table does not advertize the locking capabilities of the
> device, flag these capabilities.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> $ alias show_sectors=3D'grep -A4 "locked sectors" /sys/kernel/debug/spi-n=
or/spi0.0
> /params'
> $ flash_lock -u /dev/mtd0
> $ flash_lock -i /dev/mtd0
> Device: /dev/mtd0
> Start: 0
> Len: 0x400000
> Lock status: unlocked
> Return code: 0
> $ mtd_debug erase /dev/mtd0 0 2097152
> Erased 2097152 bytes from address 0x00000000 in flash
> $ mtd_debug write /dev/mtd0 0 2097152 spi_test
> Copied 2097152 bytes from spi_test to address 0x00000000 in flash
> $ mtd_debug read /dev/mtd0 0 2097152 spi_read
> Copied 2097152 bytes from address 0x00000000 in flash to spi_read
> $ sha256sum spi*
> 6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_rea=
d
> 6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_tes=
t
> $ show_sectors
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-003fffff | unlocked | 64
> $ flash_lock -l /dev/mtd0
> $ flash_lock -i /dev/mtd0
> Device: /dev/mtd0
> Start: 0
> Len: 0x400000
> Lock status: locked
> Return code: 1
> $ mtd_debug erase /dev/mtd0 0 2097152
> Erased 2097152 bytes from address 0x00000000 in flash
> $ mtd_debug read /dev/mtd0 0 2097152 spi_read
> Copied 2097152 bytes from address 0x00000000 in flash to spi_read
> $ sha256sum spi*
> 6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_rea=
d
> 6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_tes=
t
> $ dd if=3D/dev/urandom of=3D./spi_test2 bs=3D1M count=3D2
> 2+0 records in
> 2+0 records out
> $ mtd_debug write /dev/mtd0 0 2097152 spi_test2
> Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
> $ mtd_debug read /dev/mtd0 0 2097152 spi_read2
> Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
> $ sha256sum spi*
> 6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_rea=
d
> 6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_rea=
d2
> 6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_tes=
t
> 5b69b16c88c3ae48213c359d2f9fd7f0583e513dabb224b3404bc93a5e173253  spi_tes=
t2
> $ show_sectors
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-003fffff |   locked | 64
> $ flash_lock -u /dev/mtd0
> $ size=3D$(cat /sys/class/mtd/mtd0/size)
> $ nblocks=3D$(grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params | sed=
 -e 's/.*
> unlocked | //')
> $
> $ bs=3D$(($size / $nblocks))
> $ flash_lock -u /dev/mtd0
> $ flash_lock -l /dev/mtd0 $(($size - (2 * $bs))) 2 # last two
> $ show_sectors
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-003dffff | unlocked | 62
>  003e0000-003fffff |   locked | 2
> $ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # last one
> $ show_sectors
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-003effff | unlocked | 63
>  003f0000-003fffff |   locked | 1
> $ flash_lock -u /dev/mtd0
> $ all_but_one=3D$((($size / $bs) - 1))
> $ flash_lock -l /dev/mtd0 $bs $all_but_one # all but the first
> $ show_sectors
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-0000ffff | unlocked | 1
>  00010000-003fffff |   locked | 63
> $ flash_lock -u /dev/mtd0 $bs 1 # all but the two first
> $ show_sectors
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-0001ffff | unlocked | 2
>  00020000-003fffff |   locked | 62
> $ flash_lock -u /dev/mtd0
> $ flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
> $ show_sectors
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-003effff |   locked | 63
>  003f0000-003fffff | unlocked | 1
> $ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # all but two
> $ show_sectors
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-003dffff |   locked | 62
>  003e0000-003fffff | unlocked | 2
> ---
>  drivers/mtd/spi-nor/winbond.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.=
c
> index 07ab66a9e6c0..e6dca2493357 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -200,7 +200,7 @@ static const struct flash_info winbond_nor_parts[] =
=3D {
>  	}, {
>  		/* W25Q32JV-Q/N */
>  		.id =3D SNOR_ID(0xef, 0x40, 0x16),
> -		.flags =3D SPI_NOR_QUAD_PP,
> +		.flags =3D SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_N=
OR_HAS_CMP,

The original W25Q32 doesn't have the CMP bit.

-michael

--2727a3d7c76515e8d5a1fbcf946f12b78f86351a9e714cf339ba6b9dd00b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaku6AhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hnMAF/QrRLS8DOTUvZmld0Rd4uDgq6574/tVyq
i6xxKnk6MwZy5kHjDuO7tnCxWVEHMCAtAX9j3SMytDu9YRyhmZLO1bmVmm6as2vG
HR2vcTkExEgDzkAgQIENF10RYuIVh+zflNc=
=tzDW
-----END PGP SIGNATURE-----

--2727a3d7c76515e8d5a1fbcf946f12b78f86351a9e714cf339ba6b9dd00b--


--===============3465690620485893142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3465690620485893142==--

