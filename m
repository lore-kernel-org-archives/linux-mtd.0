Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCD7C54791
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 14:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kzq2SEaDxtPejP3/L8BwbCcqcWMryeJreaWDLd98l5I=; b=uCoVsOvzV/7z/oIEd/RxgjqQTc
	nMUFpv5cb72CKOgXEwio/3WWaIKA6H/z3Z63bUV38P4UNr0ikbW23rforg6uxW6z86Y3IAYA+mJcR
	8sz4FxAqMgxxnWpkFgV+ObyjPT3zQXW+IAyO8Y1uUSEZt4+y8jctu38bVqWCfooIEANR47FZSsp0l
	p/q2lLf07yWglSJpF6ePjlXSyNC5076s7F/tq9exlyhH4OAffOrvbEpEDPsElgAyJcHSYNZGJE8oI
	TgoGG1NJX5DPRUQ9D4lECYVCYZuxec3KBIVxuwCiUji4RJdtbqG3vPrHZzxpV3LtCWch/cQZHHAF1
	gIWZks6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkPDF-0000000AKrI-3zeX;
	Wed, 13 Mar 2024 14:04:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkPDC-0000000AKph-2Kia
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 14:04:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 669CE6117C;
	Wed, 13 Mar 2024 14:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FD8C433C7;
	Wed, 13 Mar 2024 14:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710338645;
	bh=c6F26WYWOWPHGngG2bLzrx8m4VbcPQ7QBfWC8CH32Uc=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=TWJQupRIoMDLYy8Z56ID/kiUfI6+tt/S/oJpr7erwMaWPJ+GlbRvRDuV7jZ+vNmW8
	 L84D1juJ/mh9/OBoyiDYlxWn9t7oAQdGo/jRyJ/oRm1l1zEXBxecSCpPYkg9MAJ+pU
	 64NHCHsaoggzD/OW+aAClUurZ7GUlNxJVHQ1pn3aSbQVAz3YYVf38VFf6tYwMpBubo
	 NNGz+uzf7S+1MnHqZ0RVmVducRmBkaHBxNG6P3kZ1Pbq6MMEsoqieSyPGFkvX9lAHl
	 /5Hli3BRxYj1+dtAo2U5BZ9jTfqNZQ7IV+ojXqvGlwvkJG3fsChRR95RPReU9TN6kb
	 p8/TfJKxXmutQ==
Date: Wed, 13 Mar 2024 15:03:52 +0100
Message-Id: <CZSOG0WG0FAJ.23WQ5CB6Q8RIZ@kernel.org>
Subject: Re: [PATCH 2/2] mtd: core: Don't fail mtd_device_parse_register()
 if OTP is unsupported
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Mika
 Westerberg" <mika.westerberg@linux.intel.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Aapo Vienamo" <aapo.vienamo@linux.intel.com>
X-Mailer: aerc 0.16.0
References: <20240307130418.3131898-1-aapo.vienamo@linux.intel.com>
 <20240307130418.3131898-3-aapo.vienamo@linux.intel.com>
 <CZQZXAB2GOCY.12YVJ6CRGG26B@kernel.org>
 <xeqscncwirfaz77mtpcvkueo5xto7vis5khr3uwclcx4sfx6eb@35j3grcqrzo2>
 <CZSIHWU6IYXB.2DUCUUYFTAB2X@kernel.org>
 <lxl3zzgq4kgbgxkya2c6zyagcnrcyp2lzewu553mkmgdlooeca@m2wyltn7qpog>
In-Reply-To: <lxl3zzgq4kgbgxkya2c6zyagcnrcyp2lzewu553mkmgdlooeca@m2wyltn7qpog>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_070406_682667_46D53ADE 
X-CRM114-Status: GOOD (  18.82  )
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
Content-Type: multipart/mixed; boundary="===============3938584058246942350=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3938584058246942350==
Content-Type: multipart/signed;
 boundary=fd774a84601503390b4d60fed6349c6cc9ccc01530323bbd271b951b5256;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--fd774a84601503390b4d60fed6349c6cc9ccc01530323bbd271b951b5256
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Mar 13, 2024 at 2:59 PM CET, Aapo Vienamo wrote:
> On Wed, Mar 13, 2024 at 10:24:13AM +0100, Michael Walle wrote:
> > On Mon Mar 11, 2024 at 5:20 PM CET, Aapo Vienamo wrote:
> > > On Mon, Mar 11, 2024 at 03:38:17PM +0100, Michael Walle wrote:
> > > > Also, you'll print an error message for EOPNOTSUPP, although that i=
s
> > > > not really an error. Is that intended?=20
> > >
> > > Well, when we hit this, the functionality of the SPI memory itself is
> > > degraded in the sense that the OTP functionality is not available. Wh=
at
> > > would you suggest?
> >=20
> > But it's not really an error, I mean, we are ignoring that one on
> > purpose now :) I'd just guard it with "if (ret !=3D -EOPNOTSUPP)".
>
> To clarify, are you suggesting a modification like this to the code at
> the end of mtd_otp_nvmem_add()?
>
> err:
> 	nvmem_unregister(...);
> 	if (ret !=3D EOPNOTSUPP)
> 		return dev_err_probe(...);
> 	return 0;

Yes, either this variant, then you don't need to fix the caller or
return EOPNOTSUPP but just don't print the message.

-michael

--fd774a84601503390b4d60fed6349c6cc9ccc01530323bbd271b951b5256
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZfGySBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvuZrgEArJM6xLpOYhTGbcQdQa1SJArVlp1t5IKr
KPBIGGXA9cUA/iy1eF1dAKCAhY7cOF1DcpEEl6KNC17kS+2BT82oVJ4E
=KvfU
-----END PGP SIGNATURE-----

--fd774a84601503390b4d60fed6349c6cc9ccc01530323bbd271b951b5256--


--===============3938584058246942350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3938584058246942350==--

