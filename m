Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6945E9A03B
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Feb 2026 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AB5f4K0qvOlttcv2KkqutFQj6M1StTeOdWH9ssT1k1s=; b=vdJDvCOEv3U9lBAlPuFjUNCj7b
	cDUjmq1ykL5/DmA9pfA+JM1F/UP4uH4pB/nCjOqOIppYiZBTw43lsOeG8LJxzvuQZNRE9VcMgDxnV
	FRvHrIBlTzW6xbEeEvN9kO++DdbAI97bo/p08X+scMyD3DEUQcZt5YOy165PitLsLNAbqhparix+O
	GZ2fbjLDzPHLwu+oc+Vld09mSNJAj6nnhqWRGHKPN2rvrE8UEy3o9+f7xL80r+36XJeArrs8UVThG
	6klSxDKMroDxnpc20S8hQe+UxuldUejHqNNYQqPT5RxOL0vvGnTu2Fr+NA3fpioWseiTJwEi7QMZP
	PEI8L0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2vf-0000000BJyj-1ygK;
	Thu, 19 Feb 2026 12:14:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2vc-0000000BJyK-2QqA
	for linux-mtd@lists.infradead.org;
	Thu, 19 Feb 2026 12:14:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E617A4445E;
	Thu, 19 Feb 2026 12:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45AF8C4CEF7;
	Thu, 19 Feb 2026 12:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771503283;
	bh=hxSCJULIk3S57PIoIXZwF+R4TIgdUV4y4Fpg2rlZIo4=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=qp/ApliPrsrwlR/JHVXYzV19s2uUGZ5UF2wu1w3MdpN6L+8jhxgGugk7ak0qY8Xl4
	 BFRZei7FoCJkatL1MjbDRu9JzWu0JfTYdqagH0/astqyeB+KNqAZ4z3B5bjOCbeNN6
	 VDvvpLY+hsvk3F8lnnNmkmA0JvS7x7UVDjvGsWnTG6zRdTgVxNNqQ+ocEcv13CXBrs
	 0LLE3zcfG8idmyKF9J4HIuwlQ4eK8AzkI2795xFuY69P4X9d+NnhSuPbb5krW/ZN4i
	 kD64mA96w7O3C1Jc9zafJrA/eyyjCQdcsv+03q11Q5TJve7AJkmLTrpbiObg+VuZ2f
	 xbPL9Yrhmo4BQ==
Mime-Version: 1.0
Date: Thu, 19 Feb 2026 13:14:39 +0100
Message-Id: <DGIXI3RVPSJW.3J77RFU4JK6O2@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Santhosh Kumar K"
 <s-k6@ti.com>
Subject: Re: [RFC PATCH v2 08/12] spi: cadence-quadspi: read 'has-dqs' DT
 property
Cc: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
 <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <praneeth@ti.com>, <u-kumar1@ti.com>, <p-mantena@ti.com>, <a-dutta@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260113141617.1905039-1-s-k6@ti.com>
 <20260113141617.1905039-9-s-k6@ti.com> <87h5rvgkjs.fsf@bootlin.com>
In-Reply-To: <87h5rvgkjs.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_041444_668870_34C49732 
X-CRM114-Status: GOOD (  18.54  )
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
Content-Type: multipart/mixed; boundary="===============1878650966943433530=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1878650966943433530==
Content-Type: multipart/signed;
 boundary=789f55f8419955e9a8d78cb3b3e5bcab957df757f53d5db9f426fb813101;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--789f55f8419955e9a8d78cb3b3e5bcab957df757f53d5db9f426fb813101
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Feb 5, 2026 at 6:35 PM CET, Miquel Raynal wrote:
> On 13/01/2026 at 19:46:13 +0530, Santhosh Kumar K <s-k6@ti.com> wrote:
>
>> Add a boolean field to struct cqspi_flash_pdata to store whether the
>> attached flash device supports DQS (Data Strobe) mode. Read this from
>> the 'spi-has-dqs' device tree property during flash node parsing.
>>
>> This is preparatory infrastructure for PHY tuning support. The field
>> will be used by subsequent patches to configure read data capture timing
>> with DQS enabled for improved margins in high-speed operations.
>>
>> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
>
> As mentioned in my answer to the cover letter, I am not too much in
> favour of this property because this is something that is somewhat
> related to the chip ID, thus discoverable. I drafted something to get
> rid of this property already, I will share it for opening the
> discussion.
>
> However, for now I am closing my eyes on the fact that the DQS pin might
> not be wired to the controller. In this case we will need some kind of
> "dqs-not-wired" DT property, that's true, but also easily manageable at
> the core level later, when/if the need arises.

Usually, a DQS pin is optional. AFAIK, there is no requirement for
it. I.e. it will probably work fine with slower frequencies and
using an internal loopback. So if you run your flash with slower
frequency you can probably save one pin and use it for something
different.

What I wanted to say is, that not having a DQS pin wired is not
really a mistake. But "dqs-not-wired" sounds exactly like it.
So IMHO it should be the other way around and the device tree should
tell you that *is* wired, if we cannot find detect it otherwise,
like looking at pinmuxing for example (not sure that is feasible
though).

-michael

--789f55f8419955e9a8d78cb3b3e5bcab957df757f53d5db9f426fb813101
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaZb+rxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hX7gGAj59K5l6FuqHIr1P5IbyI4Z0sXZHmHc1o
mDd2Q85Sij8uG8z4QIYml9Qi/puGcxn6AX9WLWJocfkBRAQ6y5MLqQi4fl9IzeI+
dVa+uqTigEU7b9VOdNknXxmEnzfxKWiRiTo=
=bXm6
-----END PGP SIGNATURE-----

--789f55f8419955e9a8d78cb3b3e5bcab957df757f53d5db9f426fb813101--


--===============1878650966943433530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1878650966943433530==--

