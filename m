Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C82C48BC3
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Feb 2024 09:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PqzqUn7SUfBeRiYH63ghus5Nw3GJdCPIbt7W8csWB8=; b=5C39T/U9P2rBHcguOPNIiXPMVW
	SxCqhHZ4fxlo2ut2mvadlOOtbG2mChWVgYdBzL8PDAIpzMj9GnLM8Kv34V5H6/O9x+Pm2w1aZQ8RG
	2nrAsB/MUGFHVtw6V8D/me/vZ6qE1II+pp0MAgCtFJ5+CfizT/h5YojL+u2tSdiwyXtJv4Om/jDDX
	ureVArPr6txcyyDm9ZjR+oCD/trOSVQQgUd4XnUbs6Q+QHmqGJsMRpq+oYUP9jsV0viZMdlAYhREy
	/38utQBZArM9oYBLcYDM1ah6Sv/BpL4eytwStA95Ynh38DYJkSmwEgqSEd+Pv95yJhSbAYsXAEG9R
	3yfg4j6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcipG-00000000ENm-36Cc;
	Wed, 21 Feb 2024 09:23:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcipE-00000000EMm-1aIv
	for linux-mtd@lists.infradead.org;
	Wed, 21 Feb 2024 09:23:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A98FB61070;
	Wed, 21 Feb 2024 09:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C35C433C7;
	Wed, 21 Feb 2024 09:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708507415;
	bh=jE1ncH7sLUYatuNt7cLbmypurrJj6Bf/Ccrj6W1lvQc=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=LrmSA7G2qnXbBZhzlDs81CW9rI3+FG6uXE41/r/OntunNmQAaXDrUdQ8ItFLdHyn+
	 bNAfSgOe2g83K0QYoUPAzIXpjzHL7G4l3xvd8XB/qJcF947Mt65f9sgd99elh1g01v
	 /9tAmqpvAK1edAwv7CN7XVVNFYT9gOY5u5xdfzMxSD6pJRfCvbn4uF9h6O2yVw5fIw
	 a4rDLwUB3BShO/RVIULt8/jeq6Te5kQkxR+tRjhbSPAPByOprD+IDlTGO/be3/SsIW
	 oSd+YaFoVy8b+45thdfESHxajkjPW6jTgRNnbfcW+SgrbNClj9xvf8E4CKYySc//gg
	 0kgN66e1XzQJQ==
Date: Wed, 21 Feb 2024 10:23:25 +0100
Message-Id: <CZANBUQ2RJ3N.DO07Z9VFJCBZ@kernel.org>
Cc: "Yazan Shhady" <yazan.shhady@solid-run.com>, "Rob Herring"
 <robh@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Josua Mayer" <josua@solid-run.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-mtd@lists.infradead.org>, "Takahiro Kuwano" <tkuw584924@gmail.com>,
 "Takahiro Kuwano" <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v7] dt-bindings: mtd: spi-nor: add optional interrupts
 property
X-Mailer: aerc 0.16.0
References: <20240219-mtd-flash-interrupt-binding-v7-1-206e30a656fa@solid-run.com> <CZAM553H2H56.2TDN36QEL90XX@kernel.org> <a0144c5b-4095-4a0c-84b6-93dfe9631a6b@solid-run.com>
In-Reply-To: <a0144c5b-4095-4a0c-84b6-93dfe9631a6b@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_012336_534667_BC9C3BFC 
X-CRM114-Status: UNSURE (   9.85  )
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
Content-Type: multipart/mixed; boundary="===============0745443398870914548=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0745443398870914548==
Content-Type: multipart/signed;
 boundary=e9f867f281deaf04305f7f7b113436157ecc73b10b85215ac510f5eb30ca;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--e9f867f281deaf04305f7f7b113436157ecc73b10b85215ac510f5eb30ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

[+ Takahiro]

Hi,

On Wed Feb 21, 2024 at 10:13 AM CET, Josua Mayer wrote:
> Hi,
>
> Am 21.02.24 um 09:27 schrieb Michael Walle:
> > Hi,
> >
> > On Mon Feb 19, 2024 at 3:41 PM CET, Josua Mayer wrote:
> >> Some spi flash memories have an interrupt signal which can be used for
> >> signalling on-chip events such as busy status or ecc errors to the hos=
t.
> > Do you have an example? Maybe one with a public datasheet?
>
> My example is Infineon S28HS512T, however datasheet download requires=20
> user account.
>
> S26HS512T has interrupt line, too, and datasheet is downloadable without=
=20
> registration:
> https://www.infineon.com/cms/en/product/memories/nor-flash/semper-nor-fla=
sh-family/semper-nor-flash/#!documents

Thanks, as far as I can see, both are hyperbus flashes. I'm asking
because I'm not aware of any SPI NOR flash with an interrupt line.=20

-michael

--e9f867f281deaf04305f7f7b113436157ecc73b10b85215ac510f5eb30ca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZdXBDRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvsMiwEAjOqBidGogjxPHhp8y+blJyfOYdrapFQv
ZY95qF3u2uIBAP+EXR9ovlBJIAjMCkirhifr2qt6x005yRPmB2mlhi8N
=iSVx
-----END PGP SIGNATURE-----

--e9f867f281deaf04305f7f7b113436157ecc73b10b85215ac510f5eb30ca--


--===============0745443398870914548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0745443398870914548==--

