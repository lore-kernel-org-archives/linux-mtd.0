Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EDDC43458
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2026 08:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+cEqFWR2vtMyIQVZKF2bFMzJagNmVV35Ax27QLSPlA=; b=SF6ZaoW9KFLka7kCcHHFgOSfx3
	IN4uPmoSb6w5gmG/fVvtMUfUZg2FNvQTTmgsFc49PL06tdFm1d+WBMmJtU6czvfuAK8s3bq6A8qsk
	A6mKo1Ri7QczzmVpGPmUsFlhJPhmPfH3o2Nn48smnO0vB6c5EYRl/QOudskX1xtl7Dl7wR0zR5tfm
	v9S2MP+PL9sR2zugAmppFmGXdFNYoY+BXiS7TClNIgdZQRkEHbR3oam81yPbZrnaXXV7MqmKLBfNN
	ro4ABoW7m+BGwRla0+2nB8Sfapr9dVI9jiiENPo/AcIMPMszrHDUDH/8kEu0NdCkBxlCWzQNNUoTN
	MRmCRhcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepxq-00000000z0s-0eLV;
	Wed, 01 Jul 2026 08:06:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepxn-00000000z0f-0J1B
	for linux-mtd@lists.infradead.org;
	Wed, 01 Jul 2026 08:06:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 856E142A77;
	Wed,  1 Jul 2026 08:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E322C1F000E9;
	Wed,  1 Jul 2026 08:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782893190;
	bh=FV12w+rvQTWbip6Z1AEblD5563RnUc4s2FS6P9VYD/E=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=b0M7IR9+0qjOY/WuGsAyfjBsmCwVaRX4FdkM5TUWR5P/qvM4ekS06BU1fKKQgMOc1
	 XUEVVo9HfoVLEvNve0J0eS2Zg7PwMitqPMdgqLtdTe5MKKQRQYdb2XYqkMsKMJ7S7I
	 PEOp2LmXpbYoevnCSbkkPpLus6wXCw1QKLm/Z9a4MGVZUE7QzmH46zJDKI5Zl2JzCi
	 E3ZzN48BGsjhSaPFKL/JTCZoEq5JWMyy4EqNQBKfctgDMd68iss1GXDlyG8Iiu2pFT
	 kfUe6nXBN+DMd/kfq18HGd69OvYOlNXBJLVmAPDY4NajJTDoUHzbdJ//xblVGkH9lH
	 ZxQKBJVAl2Xcg==
Mime-Version: 1.0
Date: Wed, 01 Jul 2026 10:05:30 +0200
Message-Id: <DJN2V8UD53G1.TWK9X1TCEVJ7@kernel.org>
Subject: Re: [PATCH v2 3/3] mtd: spi-nor: fujitsu: Add support for
 MB85RS4MTY chip
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Chris Packham"
 <chris.packham@alliedtelesis.co.nz>, "Aryan Srivastava"
 <aryan.srivastava@alliedtelesis.co.nz>
From: "Michael Walle" <mwalle@kernel.org>
To: "Ronan Dalton" <ronan.dalton@alliedtelesis.co.nz>,
 <pratyush@kernel.org>, <takahiro.kuwano@infineon.com>
X-Mailer: aerc 0.20.0
References: <20260626022108.1963271-2-ronan.dalton@alliedtelesis.co.nz>
 <20260626022108.1963271-6-ronan.dalton@alliedtelesis.co.nz>
In-Reply-To: <20260626022108.1963271-6-ronan.dalton@alliedtelesis.co.nz>
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
Content-Type: multipart/mixed; boundary="===============8730179701311398673=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8730179701311398673==
Content-Type: multipart/signed;
 boundary=7e2a4fa01a77808d94c03036bcc18aba16b89192e220f76b4303bc9297d7;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--7e2a4fa01a77808d94c03036bcc18aba16b89192e220f76b4303bc9297d7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Jun 26, 2026 at 4:21 AM CEST, Ronan Dalton wrote:
> The MB85RS4MTY chip is similar to the MB85RS1MT chip, but it has a
> higher capacity and can handle higher temperatures. Compared to the
> MB85RS1MT chip, this chip has an expanded set of opcodes which allow
> control over power-saving modes, access to a special sector data area,
> and reading of the unique ID and serial number. However, since the
> spi-nor subsystem doesn't support these extended abilities, they are not
> taken advantage of here.

I'm sorry, but we don't accept any new parts, which clearly emulates
an EEPROM and has no concept of erase blocks (or don't even emulate
the erase opcode). I understand, that it was very convenient to have
a block device. But I want to move away from that NO_ERASE hack and
having two different drivers for the same hardware device.

Maybe someone in the loop has an idea how to move forward regarding
the filesystem issue.

..

> +	}, {
> +		.id =3D SNOR_ID(0x04, 0x7f, 0x49),
> +		.name =3D "mb85rs4mty",

We dropped adding names of the flashes for new parts, because of
notorious id reuse.

-michael

> +		.size =3D SZ_512K,
> +		.sector_size =3D SZ_512K,
> +		.flags =3D SPI_NOR_NO_ERASE
>  	}
>  };
> =20

--7e2a4fa01a77808d94c03036bcc18aba16b89192e220f76b4303bc9297d7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCakTKSxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hIzgF/ZFOzykmps18ahvtmNn5WgK2/N3L2BQpU
wBIOZXiFEBK8KQdF2t+KOps8AeGdlfPzAX9ksgIi/pX5GaGJ3UfU/3pinHB5EyYu
xXk/DVCzGy3kS35na5eLPvnJ6z9LBnNwu6I=
=ltzZ
-----END PGP SIGNATURE-----

--7e2a4fa01a77808d94c03036bcc18aba16b89192e220f76b4303bc9297d7--


--===============8730179701311398673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8730179701311398673==--

