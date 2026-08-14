Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED819C5B572
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2026 09:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69B37aX9ZLlAQy15OMBldG4o1celaCjAAyCorfNoA7o=; b=rEJQSuk/cau9omE/LD7CsjNdKy
	a/GWwY0EODCCmwBzO/wXrA2+iGaaaElfNx4DUXu7LEkd5ad3lVAv0Y6UFDddqeY2jnpqqSMxNXe7q
	O1/g2i0aMrjJUqJQzeI/cqDVIC+V/6fF4roTAvJFdp/7SbqzxkRQNxr1ngJv89rxtV4O8X/J2Nck8
	nvCOItq5BDuHeGl7HqEgGe4iR7c5CIFKL7vowinyYZydwEsws9+Dwyvav2BwLHmEqzTgh/oNL/9x0
	/HSb4fofIHAdnrqF3OIkJ7qfF3RjOT8GiV3RKVZeoDPCjZuKLgHFZxB+ljd9+4D5gv7vT/1lZPLDg
	bllEBdsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoaM-00000002SaX-2zdE;
	Fri, 14 Aug 2026 09:52:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoaK-00000002SZB-3rPx;
	Fri, 14 Aug 2026 09:52:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 5D32D601E0;
	Fri, 14 Aug 2026 09:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 8846C1F000E9;
	Fri, 14 Aug 2026 09:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786701140;
	bh=RGIaFjEjGKTUS3t/KGTvWOkBKKN09Wnhe48eHpevMfI=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=jrurdxJXZX5eIq730I6uz2WVidsRmALut/jfYfeA4huFLz0OefDZb2OoGkKhGWjNS
	 qRjFNx6QiueZYWafoNm4CkYvBSY32DVcHHQjTmFohDRp1E4iWij2jv0UqHcobs46+8
	 Qgnlx6XuJYe+4W7OwwvajReicd7W/1pqnzdWoTo4Q8U9dPS8Jt8QEocfnndQCIs1Ny
	 RCNoxrh641H4FF1FUeqsyIndTmXUsNiKxsZku/VVvOAJg4hNgOIJX/CCX7L/yhSSI/
	 3wJOkVduFhSXXXi26F83JHRLlWV6DhagSWeKAOQ8LOFQteEOTr8sSqSzgEHLumtH4Z
	 v8DBbgrgOtBWg==
Mime-Version: 1.0
Date: Fri, 14 Aug 2026 11:52:16 +0200
Message-Id: <DKOKOYTY1313.1J88PSPUUDFZK@kernel.org>
Subject: Re: [PATCH v3 20/23] mtd: spi-nor: winbond: Add support for
 W25Q01RV-M
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-20-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-20-b637cf120d5c@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============0695551654028518490=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0695551654028518490==
Content-Type: multipart/signed;
 boundary=020a3ae608d6aaedb26dac0e7a007d292f1b85aaf719db6ddf3629c19450;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--020a3ae608d6aaedb26dac0e7a007d292f1b85aaf719db6ddf3629c19450
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> There is an ID collision with the chip of same density from the JV
> family. Both chips are very similar in practice, it is mostly a matter
> of electrical differences (mostly power consumption being lower).
>
> As a significant difference, RV chips identify themselves as supporting
> the new SFDP (rev F) field which forces an alternate write SR2
> opcode (0x31).
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>


--020a3ae608d6aaedb26dac0e7a007d292f1b85aaf719db6ddf3629c19450
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7lUBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ioyQF9FmmcxzDGy3tZU+/RbpRePQhrWYonbw4Z
0St9k4B/9UP10/CmSOTWOWN1h55zjpWJAYCOhYJ3VrqpLPzXaCszJrwINrJkhJla
blFxKVsW6pLZ/24pRldSuKVuhAzifpezo2I=
=BWZl
-----END PGP SIGNATURE-----

--020a3ae608d6aaedb26dac0e7a007d292f1b85aaf719db6ddf3629c19450--


--===============0695551654028518490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0695551654028518490==--

