Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E876CC88E4C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 09:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSumh1EJuMOmqQO+aAjS2Cow8VusbNfbPD1rLZlLepM=; b=hBfdu0cfEHxZUdQbu8NPOwI0tr
	2NskPJbPkLGFKj7UP9pUy2syVZvAc+cgmTbfboWJC8h9jpaEXR1aqL5buTQiXJ6Oa3rUV0u/eU0vK
	gOmrpmc6j1Mo/HbTdoQXIF632O29BX1CuUYTm1o14HgqcWIDM4FEVm0IrRpPpU/hVNzb/CcxnpNyh
	fnqof7BYby/Kk2K4HQ1xkmnE730ewfrZDqXoOPgOYZpTNpEb6btrunX9DwQdu6AoIRmSNDJuysP1p
	0wcu9hcVf+IvzS97g79Dwr/WAU+6xCZisyKzKpIY9bCqXY2XWFAa69I9dUhXcVmykiJHXydC1L60v
	SClJjG8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xac-0000000GGyB-3EVL;
	Fri, 11 Sep 2026 09:30:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xab-0000000GGxq-1sjG
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 09:30:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id EFDE843D98;
	Fri, 11 Sep 2026 09:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 5A95E1F000FF;
	Fri, 11 Sep 2026 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789119032;
	bh=rz4T8CBZwQqzwi0m3a2/ZBRyZSVhbKnDKVE9J0f6yUI=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=duEllfOMN4cmFPg1neMONWzv1LcnzeFR7WrZN/h3FSFMD/HyxpfMQu5yYo5aZFI52
	 7uw1XxdsjXsRJBnmL2tYLjlGMNhCMaZ32yVAeKhkRRaULaiseLX/1aTD5visBZONoR
	 POjWrOF0btei7PIlweD/vHwE2Do6ohyrZkQOf0k0QQtblFpZZLDb+IYMAI1GtgxQ1Z
	 V8LIATKU3HK5pz136Mwa+0K3ethLUPXdCcxLRIcEl/6B+xRrSfOVGf2TBgO8wUIFPb
	 pFm1vk1z2nbp6VEITBcw1lDZHJ94Kq1hQ+uz43BrGOLzwpBLvg0bf9+R2LLTBKHma8
	 X95QHSARBoCIQ==
Mime-Version: 1.0
Date: Fri, 11 Sep 2026 11:30:29 +0200
Message-Id: <DLCDRJG22PDM.UPGN3KXWKND4@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Fix quad-enable for flashes with QER bit
 in SR1
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Jon Hunter" <jonathanh@nvidia.com>, "Steam
 Lin" <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com> <DLCD7NN2IW82.33ISZCKO1E7UY@kernel.org> <87o6e4qh5g.fsf@bootlin.com>
In-Reply-To: <87o6e4qh5g.fsf@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============2109775801993349584=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2109775801993349584==
Content-Type: multipart/signed;
 boundary=059ea684f812920f19099ef40d45683ff7173b765f8d76345088bce21655;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--059ea684f812920f19099ef40d45683ff7173b765f8d76345088bce21655
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 11, 2026 at 11:19 AM CEST, Miquel Raynal wrote:
>
>>> -	ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>>> +	if (qe_mask[0])
>>> +		ret =3D spi_nor_read_sr1(nor, sr);
>>> +	else
>>> +		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>>
>> Shouldn't that be the other way around?
>>
>> +	if (qe_mask[1])
>> +		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>> +	else
>> +		ret =3D spi_nor_read_sr1(nor, sr);
>>
>> I know qe_mask won't be spread across two SRs. Just to be
>> correct and make it easier to grok.
>
> Why is the second version easier to parse? First version is maybe more
> future proof since we are treating a specific case. Because either it is
> a specific chip (Mxic) or we end up in the more common case. There is
> only one QER entry for qe_mask[0], many for qe_mask[1], and chances are
> that in the future we will mostly see new chips only using a qe_mask[1]
> mask. So having this in the else doesn't sound so strange to me? I also
> don't think we will ever see masks spanning the two registers.

Because for the first one you'll have to know that qe_mask wont span
two different registers, where with my proposal, you don't have to
have that knowledge, no?

If qe_mask[1] is used regardless of qe_mask[0], you know you have to
write sr2, otherwise you'd be skipping something.

With the former, qe_mask[1] might or might not be 0 and you could
end up in spi_nor_read_sr1().

What do you mean with future prove? In the end it's the very same
logic iff there will only be one bit set in qe_mask[] and
sizeof(qe_mask) =3D=3D 2.

-michael

--059ea684f812920f19099ef40d45683ff7173b765f8d76345088bce21655
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqPKNRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ib/wF+IbYzfExispJ6WUUDK1Tad18sAqKeIw8l
ViPZ6kqaJgPZ2jhyY3d+k/Jt/JFkNxqOAX9AqsfgLcNR8IzSZoya04+VPRlc1/Nc
On6SXRPYPLktuFU2LjKMo6mNJVALf/L+D0g=
=H6a2
-----END PGP SIGNATURE-----

--059ea684f812920f19099ef40d45683ff7173b765f8d76345088bce21655--


--===============2109775801993349584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2109775801993349584==--

