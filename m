Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA4EC04FFF
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2024 15:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7brPo4vckHQ8/dVvwNs3d/GYXiXWOLbuIwwDu/SM4o=; b=g3mDB48D/hKFpreVPDwOVt+sIs
	KyvtR4+R1iq31UYohIDMM/X+fVWyuOvzkq13OQSKtaOtfFT7+4b4BB7Omd9RAfbpM/MbYz+v8wO6f
	JP+kXFaESNYo82dokoG3HFXHZzAaZNs3vpXjgFzdkalXx2Fo8CzVXxAjKyZbCS+UcGdVgQiNXP0+w
	fvNV8iCXLw7iPnAzhFvpqZYPF6JoPyJ3dzzPmSR1jTmlObys72xmRVD57XS+7q+4ynIJPOs+0cbAG
	E15drt5lV0DtNgD8d5LWDgoipOU0/iK0VusQ7KRVgsFSHrUxKLfxNaR8UZ6v7+OEfuDsBuDStKt5k
	7BQvBstg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7U2-0000000GfSi-1QQj;
	Wed, 17 Apr 2024 15:46:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7Ty-0000000GfRK-0L5A
	for linux-mtd@lists.infradead.org;
	Wed, 17 Apr 2024 15:46:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75687614F1;
	Wed, 17 Apr 2024 15:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA963C072AA;
	Wed, 17 Apr 2024 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713368757;
	bh=FkhLi0l+6ZQrGYmjsZ3QPjRP3VFib8PbMZ0d05h1nGI=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=LQxnPZ3PuikwhLTTWXHWEnQH23jfeyk7M/Q93UwrJrwgmZS5j92AluZqIOfI2qOo9
	 o+N8cl/UXcwKhjUya76HH7QUzxR2RnT26VuiQNoS9dBDiU/b/MAKkk0nNOmxGNqorU
	 BkOzUQQ46Ct6nBA9Fu/hWZqgLax0q1LN02MEfhqJPppZN+ASa+hszvNxBbTRCS5pr9
	 zn9h54liEqJfIEbkV3KCtGgfxweL4TEoEtlnqnsoHFveN+2w88T8enxfhp4dQ/NCCI
	 9kowpUs5GRgZRyKLSwSz2XcavykqD9y8bXXJODYyDkMJ07plWMmY6u6G1VyXhX8JLX
	 NXSIvAm97ASoA==
Date: Wed, 17 Apr 2024 17:45:51 +0200
Message-Id: <D0MIJ6FT9Q2J.3B75NFD9SOJ7P@kernel.org>
To: "Pratyush Yadav" <pratyush@kernel.org>
Subject: Re: [PATCH v1 3/6] mtd: spi-nor: get rid of SPI_NOR_NO_FR
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240412134405.381832-1-mwalle@kernel.org>
 <20240412134405.381832-4-mwalle@kernel.org> <mafs0sezk6rcr.fsf@kernel.org>
 <D0MH78KYG87L.ETRH24X6MK6X@kernel.org> <mafs0frvk6luy.fsf@kernel.org>
In-Reply-To: <mafs0frvk6luy.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_084558_203533_82E5F226 
X-CRM114-Status: UNSURE (   5.27  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3810963451815862572=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3810963451815862572==
Content-Type: multipart/signed;
 boundary=321d08e96716c0149393a1bb7ecffc24c14fc8e2fbca5068bc9efe4c8478;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--321d08e96716c0149393a1bb7ecffc24c14fc8e2fbca5068bc9efe4c8478
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Apr 17, 2024 at 5:37 PM CEST, Pratyush Yadav wrote:
> BTW, -M and -C options for git-blame can help you a bit. They can detect
> moved and copied lines, and look for the original one to blame. From man
> git-blame:

I know, did you saw "So You Think You Know Git - FOSDEM 2024", too? ;)
Anyway, at least in netdev unnecessary code churn is frowned upon ;)

-michael

--321d08e96716c0149393a1bb7ecffc24c14fc8e2fbca5068bc9efe4c8478
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZh/usRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jeLQF8DbNQGNsJD35l7/QS+EQaMXqVzmNTxaNE
SzCYwDuZ5/RG+JuKK1c0htIiKn6ckJItAYDQ9znC2sNyH6Du70EKIN4C6yau1Xpe
ph6WBDJBx8emXDvlct5RiwPdVSIcQ4zdR1w=
=agYx
-----END PGP SIGNATURE-----

--321d08e96716c0149393a1bb7ecffc24c14fc8e2fbca5068bc9efe4c8478--


--===============3810963451815862572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3810963451815862572==--

