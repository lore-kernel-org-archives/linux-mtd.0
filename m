Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFDAC54E41
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2024 09:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/1CEMq8My4eHxtXdYkG+zLjocEFrvAPwXzticiSi1Q=; b=JIUkxjGngyTo/CESrzL94DFpQU
	5BrBY54mqnAXcHWzZcLagerhUDigWKvNCwaItonSpO9Y5NNEeNSkO7GjXfvRLmY553/ifcYmDtebe
	QXkd+vN+ow/sfs5p8gsJCT/IlticI4+q5SjG/GtAAb9ASUUlWaBNdoSJgUDFuDuEhLk44E47f1uvj
	qn7ua1j+z0JnyiPDWlFCFyN3DBp/dpJnpFhoBfm7az2Ywl98Efl6DzK2MiHv7B0Qwcoz8hGDNrWxZ
	R8RfgYUmM3Gsfm3GBvQMuBedzuUNETvZXceLT9PWIjicsAPfagbRJ7807h602ov0WzEmdLnfS3ZyL
	XbaodrJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh4RQ-00000008JbO-0ZUX;
	Mon, 04 Mar 2024 09:17:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh4RN-00000008JZh-2K9J
	for linux-mtd@lists.infradead.org;
	Mon, 04 Mar 2024 09:16:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 910DE60DB7;
	Mon,  4 Mar 2024 09:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCFA8C433F1;
	Mon,  4 Mar 2024 09:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709543816;
	bh=smtWowPoYhv7nEqimgeA8xDDf1PSEUGTNJKR2E0PKfE=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=Tak5sBNUjnXkT+jt+oS3upMdOErw/XV1bnFuq3gV7KE6pHzfe53DwvyBxSTvqOmk5
	 gtJg0BnwMKflLZksQRhxucvAfFIb/ngzzsCFglrW0Q+6p1EeIhxFRw4Ny+moOxJ9ER
	 BzoxbjOE5qfdnmTNiLcXluFS6MPSkKUBZmhMVwQxgtV931ayWpAAycnqhggvNTDbiN
	 TUarNka6cEvsIydUSzFXP+EthiiuBTrPHyva8eeA3dOJTtY+vHnzpNQMmCncVaP4gw
	 pXY3aJEuuDAmwF0S3RkMKRMxJEtvLO0GMtM1KQGqwhvFHSi67MvIE1NqreluH6qjZV
	 pY9M5r4PlCaCg==
Date: Mon, 04 Mar 2024 10:16:53 +0100
Message-Id: <CZKUPDY8GTHC.BQ9KN9FR2R0H@kernel.org>
Cc: <kernel@collabora.com>, <kernel-janitors@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Muhammad Usama Anjum" <usama.anjum@collabora.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Takahiro Kuwano"
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v2] mtd: spi-nor: core: correct type of i
X-Mailer: aerc 0.16.0
References: <20240304090103.818092-1-usama.anjum@collabora.com>
In-Reply-To: <20240304090103.818092-1-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_011657_659811_5A4C925F 
X-CRM114-Status: UNSURE (   7.24  )
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
Content-Type: multipart/mixed; boundary="===============1204543313275440444=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1204543313275440444==
Content-Type: multipart/signed;
 boundary=56c5c757e8efd87fd596512d7c6b13800a50b7e712b376cf74eec9ce7510;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--56c5c757e8efd87fd596512d7c6b13800a50b7e712b376cf74eec9ce7510
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Mar 4, 2024 at 10:01 AM CET, Muhammad Usama Anjum wrote:
> The i should be signed to find out the end of the loop. Otherwise,
> i >=3D 0 is always true and loop becomes infinite. Make its type to be
> int.
>
> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-u=
niform erase map")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--56c5c757e8efd87fd596512d7c6b13800a50b7e712b376cf74eec9ce7510
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZeWRhRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvvI9QD+NBOU1OgPhPQF+0Iw2vVU+MRbcTw0ux1D
p4zNxDJ+bogBAIO88z955ZP4Qg575PSYdMtAVZ7V6Xt8v3OTgB8inEwA
=0b60
-----END PGP SIGNATURE-----

--56c5c757e8efd87fd596512d7c6b13800a50b7e712b376cf74eec9ce7510--


--===============1204543313275440444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1204543313275440444==--

