Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BAFE7E0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Feb 2026 09:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htGoS4zXc88VEZeqZkj6UBt5HNeYUI1nHs86O0W18tI=; b=cdPsJMBipN/A47NglyfOVXP4CW
	Zrvxqq1etB1r3yn1V2cQWWnWVc3g5WZ+ObU8s3XMvK2Sc0AzfnGidIZkPAatjujYiFT1Yrvr1bZV0
	5CjrqRRS02egSA+HCvpQagq0sM3z1CDF7tbyZvMjNZEiuzEuqJKaszZHuebGxR0XgoccsXZfdlAdR
	R0x70sz7Gei4RZ9ijvb3LqqxDW0UltspGXfe8U6w8EgkNEViCNa0rm8VOvwVg8t5Ftk4JRwuODBd7
	1mQlTqans9ImUgJmC3S+jD9KN3KOlGQ8gZOtFihsYpk9/7s+Nq19+K70/3QCezr7e6tA+aWwh2rUg
	3CzO1pKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNsc-0000000FAta-1pqk;
	Mon, 09 Feb 2026 09:48:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNsa-0000000FAsW-1Mu8
	for linux-mtd@lists.infradead.org;
	Mon, 09 Feb 2026 09:48:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D651D40AEE;
	Mon,  9 Feb 2026 09:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA2AC16AAE;
	Mon,  9 Feb 2026 09:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770630505;
	bh=w/k37mANKnb9tE0V6Kub9ubfuIj32EQidedBAveARXk=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=sl+XPEEPcBuTtRE9+reIUogcwKdqmLbonc5R0mA77HsibgCIvB9G9qucr/m42/oRE
	 w0GPdS7CvYZ4+2i2SVMeXXrA50euzmgBq29E1Q6kUSQXdwSSo4P2NBgpk47BnJ2TlH
	 X/0tSpo5+xw48Je5vD7LGbEX0d+ldPSA6kq0GIF4Gv3zOsaanSedgduJEOfM9g5sLk
	 r1/t9vIiITBneOxgIxElQtvJqbTQjJacJBpwmYCB3BGi5IpdoVUm+Spfxgwt5I4EwE
	 OLQES1Y7EaJKp9mOmW6FXvS3hfQDDzg1n6syAPe8cFAMBtB725DnlNUpM2FdWdlC9z
	 Q1NGlffK9b7Ig==
Mime-Version: 1.0
Date: Mon, 09 Feb 2026 10:48:21 +0100
Message-Id: <DGAC4N62UZQQ.3R7TLX87PECU3@kernel.org>
Subject: Re: [RFC PATCH v2 09/12] spi: cadence-quadspi: add PHY tuning
 infrastructure
Cc: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <praneeth@ti.com>, <u-kumar1@ti.com>, <p-mantena@ti.com>, <a-dutta@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Santhosh Kumar K" <s-k6@ti.com>, <broonie@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <tudor.ambarus@linaro.org>, <pratyush@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260113141617.1905039-1-s-k6@ti.com>
 <20260113141617.1905039-10-s-k6@ti.com>
In-Reply-To: <20260113141617.1905039-10-s-k6@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_014828_430998_AF45BEE7 
X-CRM114-Status: UNSURE (   9.15  )
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
Content-Type: multipart/mixed; boundary="===============7003114620966928367=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7003114620966928367==
Content-Type: multipart/signed;
 boundary=3fae006473f93b202e9fe7468c884ebf0118ef603a7a5dbb515b94d9e3be;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--3fae006473f93b202e9fe7468c884ebf0118ef603a7a5dbb515b94d9e3be
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Jan 13, 2026 at 3:16 PM CET, Santhosh Kumar K wrote:
> +static int cqspi_get_phy_pattern_offset(struct device *dev, u32 *offset)

..

> +	partition_np =3D of_get_child_by_name(flash_np, "partitions");
> +	if (!partition_np) {
> +		of_node_put(flash_np);
> +		return -ENODEV;
> +	}
> +
> +	for_each_child_of_node(partition_np, part_np) {
> +		if (of_property_read_string(part_np, "label", &label) ||
> +		    !strstr(label, "phypattern"))
> +			continue;

There was already a review comment on the last version. Moving this
into the driver doesn't make it any better. In fact this might
create a (bad) precedent for future drivers.

-michael

--3fae006473f93b202e9fe7468c884ebf0118ef603a7a5dbb515b94d9e3be
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaYmtZhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/g3nQF/ZehnFdPDNUb+qGtsugnARG8Gyx1wWmE7
KDHWkQsA/FeRC0O99ri4eyaI0daM3gcQAX9e7sCThdOPCBfvyBk7S8UhyVXKTiGF
1O3T7/Re6avtBysjtj8ooo9Fia8wiIqdViM=
=4bKt
-----END PGP SIGNATURE-----

--3fae006473f93b202e9fe7468c884ebf0118ef603a7a5dbb515b94d9e3be--


--===============7003114620966928367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7003114620966928367==--

