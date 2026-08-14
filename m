Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC97AC5CFC1
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2026 09:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TaXvdJGcw6wsemPBIPZ5rkbTEvMLEDJnzJu9cu4kk80=; b=IlMTMIS+TkZ1KehkptYeWhW4iv
	W1FEVrwd8Jt3XzBxyh0V63VenwOZ5RmCB5LGBZY8C4nxel0xlsw0eBfcmctNmOgYeolcu/Nc9tmI/
	/ve3MVJ3TWmxBqozAZGXu7jAbmDC9QBMqrv1ha4hgn8ZLUw/ZQHMQMDfWAeIdP6b0Nj1x2jrzT6c9
	EU4oOPrho+WydIu99h5K+COsT9HA/UddEK0M2XZe+SJraMyFhlEMqXIE5iyMpbOgdHjrfz2lPbaE1
	Ro/HcEQjE6HRg4iWLsXRNOV0BIbNFdA5tjS4Ck5nkbY5Nhinla60XMZS7lFCgd5RaofR81aRa5N+o
	d0mcJLzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoaA-00000002STq-21id;
	Fri, 14 Aug 2026 09:52:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoa8-00000002SSS-1GG1;
	Fri, 14 Aug 2026 09:52:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id BB97D601DE;
	Fri, 14 Aug 2026 09:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E55931F000E9;
	Fri, 14 Aug 2026 09:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786701127;
	bh=ZjEgGR5UyWYuC7bo2ZSqxrX75AbIZW8r7AMwacJ8Gpg=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To;
	b=bZlWQFvd5K5vEmjVtWpPPlAdDSghRgoIDySJsrGGMrOTzGQRKBRtoeY41MsOuRwC0
	 0zwT47TwJcQlmI1mZxjX3ebrura5kVDYzGKW3vpXbzd4OH4au269l4x0pto7o+FpSp
	 wWcPwPmybTx+N8vyMVLfVNxep2vIwHaNUilEAnkqu92nAu1NS6NSBN0vrnuRWpViwi
	 NhdSmb2BhyBPwvECbXvO6hhF6ICwiSKEdivSuxWqzNQdJMsgCTSMmvPouLDAvLfSVa
	 puR1VyGb6Zv7lLECCqaVjp7Cl6jopHXmakScbP02hYMSkk81RqA30WdolAhMkIx+FQ
	 Ma6RrwmdI/N6Q==
Mime-Version: 1.0
Date: Fri, 14 Aug 2026 11:52:03 +0200
Message-Id: <DKOKOT054B79.38O3IU11OM7J2@kernel.org>
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
Subject: Re: [PATCH v3 19/23] mtd: spi-nor: winbond: Add support for
 W25Q51RV-M
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-19-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-19-b637cf120d5c@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============8421865104959520891=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8421865104959520891==
Content-Type: multipart/signed;
 boundary=ffffe9e9efb85a61a6bb44b1ced817c7a224b86fc079b57f44b3b3f0bf3a;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--ffffe9e9efb85a61a6bb44b1ced817c7a224b86fc079b57f44b3b3f0bf3a
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


--ffffe9e9efb85a61a6bb44b1ced817c7a224b86fc079b57f44b3b3f0bf3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7lRBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hexwF/Xjzb2Rja1m6yDd62MiqWfltIjUxRULdZ
Rn9z7fjBCRh3U+RLj4qPsOUfbmpdqXr9AYDVlUFEVq3Czdq3DVTVZ391yNcpj7EQ
vL+LDChqzbbiJhSq+QjO0rzyb5EAIgs65oM=
=PwCl
-----END PGP SIGNATURE-----

--ffffe9e9efb85a61a6bb44b1ced817c7a224b86fc079b57f44b3b3f0bf3a--


--===============8421865104959520891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8421865104959520891==--

