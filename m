Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ADFE9A03B
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Feb 2026 07:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Message-Id:Date:Mime-Version:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWjwj8WN5KS6NwLUPR1WRmkOsBaiZlrPiLSzfQ21GP8=; b=bvhdrYPt2cZXZir39de3ml4Xvl
	t7OzS/T1tnPAK+NTNFWDY1r7Ql8AqpY5iJqZG8LU7ChAv1joVyFwgC7r8Vn4FZQTqv3r4WpxO0PDj
	/ax8I6LAgRmuOYuJzxe8k776YJ4jbn4w7p7tK2z6P4ft4ebB0ooZd+ziaGeeA5IYc/KZ4HlAQoTzs
	5YDsgJCPITH9b6ZfrVYhu/0wGOBUfqxvBum2DfixVp9lpmvdM/x90/3XHKFD7f0mZvdfPcwXlm0ZK
	FSk90DSZwWZwnUu/AQwZpzphLZj3BX7Q0G8zmCyvKQhYdAv9re0UNe+soeSBXVfwAjNZF0Bg4B/PM
	Zdm9GbjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsypL-0000000B4bI-0zHS;
	Thu, 19 Feb 2026 07:51:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsypK-0000000B4b6-2idn
	for linux-mtd@lists.infradead.org;
	Thu, 19 Feb 2026 07:51:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD4D760145;
	Thu, 19 Feb 2026 07:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2768FC4CEF7;
	Thu, 19 Feb 2026 07:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771487517;
	bh=BftuWu5xc6UDS/Cu2AeKUgqwOXx8OPwjeNoP/kExL5U=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=Asarl1dgd5jUHWdLztz1U/iLWw5CC2QJmOhJ/zbdWG8OTNtZVqtfyDgjg/vgq3iHS
	 YxWuTnAx0CNIa6XOtgLJlPJSQh6dPMDlyAY3+L3g1tyjYe09J4nNuBlYUfnL0M2fQe
	 7BEY2UNXXxK7ciVMSwIFgUEJm5yxjixW3F1AM4gFXQWiCKshOvp4Xhwrjg1if/KZQx
	 dxU4/+for58XnjM2SFTJyBh4zlFV5TlYmlOFg9U6vdyEzma2cja1qH7yGx2WqvUI22
	 QkJqhJIuy5YdrZeey3y8/6M/RleM6MzQeaXAbUIwYt4Pk+yRKzlEo4fYjXw43PFLVV
	 o3lJWCZ7jXjNg==
Mime-Version: 1.0
Date: Thu, 19 Feb 2026 08:51:53 +0100
Message-Id: <DGIRWWVSU5XE.2DMCL0H8D53MI@kernel.org>
Subject: Re: [PATCH v2 0/3] mtd: spi-nor: winbond: Fix protection handling
From: "Michael Walle" <mwalle@kernel.org>
To: "Eliav Farber" <farbere@amazon.com>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260218143523.17467-1-farbere@amazon.com>
In-Reply-To: <20260218143523.17467-1-farbere@amazon.com>
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
Content-Type: multipart/mixed; boundary="===============1594556453577164387=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1594556453577164387==
Content-Type: multipart/signed;
 boundary=b4c395245128df01f78d3065ca2b3b2b7429c3dffa2013c7e6473e9923a2;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--b4c395245128df01f78d3065ca2b3b2b7429c3dffa2013c7e6473e9923a2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Eliav,

On Wed Feb 18, 2026 at 3:35 PM CET, Eliav Farber wrote:
> This series fixes block protection handling for the following Winbond
> SPI-NOR devices:
>  - w25q256jwm
>  - w25q256jw
>  - w25q64jvm
>
> The devices do not correctly describe their Status Register layout and
> protection capabilities (locking flags, TB bit, BP bit configuration).
> As a result, the spi-nor core rejects protection requests and locking
> operations fail with -EINVAL, e.g.:
>
>   flash_lock -l /dev/mtd29
>   flash_lock: error!: could not lock device: /dev/mtd29
>   error 22 (Invalid argument)
>
> Update the device flags to match the actual hardware behavior so that
> locking and unlocking regions work correctly.
>
> All changes were validated using flash_lock on the affected devices.
>
> Changes in v2:
> - Remove last patch in series that added dual/quad read for w25q64jvm

Why? Unfortunately, you didn't answer my questions.

> - Added Minimum testing requirements for w25q256jwm and w25q64jvm

Thanks, but why was the w25q256jw left out?

> Eliav Farber (3):
>   mtd: spi-nor: winbond: Fix locking support for w25q256jwm
>   mtd: spi-nor: winbond: Fix locking support for w25q256jw
>   mtd: spi-nor: winbond: Fix locking support for w25q64jvm

You're supposed to pick the Reviewed-by: tags up before sending a
new version, see [1].

-michael

[1] https://docs.kernel.org/process/submitting-patches.html

>
>  drivers/mtd/spi-nor/winbond.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)


--b4c395245128df01f78d3065ca2b3b2b7429c3dffa2013c7e6473e9923a2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaZbBGRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gY1QGAz96mfu3GzNXMFKVHYODQNoiKDamF7Zwq
LTovXhA66TEqJYm1/GftvloFjBIkamn/AYC43AXEoGpbMDV80m5IUzGWbCtD2Qoj
IhQu9UfPwOwb8YhHNJPbWyY5Hx4wbFPs8TY=
=cPZG
-----END PGP SIGNATURE-----

--b4c395245128df01f78d3065ca2b3b2b7429c3dffa2013c7e6473e9923a2--


--===============1594556453577164387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1594556453577164387==--

