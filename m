Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCB4D12691
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Dec 2025 09:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drhHri3m8hW5EMkkoPP+RijtuFMkq9h56C/yTXmGMnA=; b=32LlgrLpqEdXivxx5aznqvsHFM
	xMifwJAyxA8KLUaO836ATgTaU1tVhOFcOONR6wzqilAA9HvikoanjA/d2lC7SnAuujgunySLqwjit
	YVhVy392uGTkH4UG/NsgDqNBAOYi98SzxrlGTUTN7dRBuGIgbqIguoriGSBuuy/j2uB8wj9wseYLP
	FKhh8QcpKg5HBCLQGqZ81l1vpbfntnfT6uUehky8WpiCzC+5N0l8S7uAS80yZemtAVHMGag3xfeub
	InvuW9oWK4L7xJed82bmx2+b6W3ba9rovAVqzXOXrldzfh3/PuBNu48sTq23XfM1Cblx81WbBqNT2
	BX+tRvUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQj9z-00000006O82-31KT;
	Wed, 03 Dec 2025 09:28:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQj9w-00000006O6m-2Y9H
	for linux-mtd@lists.infradead.org;
	Wed, 03 Dec 2025 09:28:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB7D343732;
	Wed,  3 Dec 2025 09:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31120C4CEFB;
	Wed,  3 Dec 2025 09:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764754107;
	bh=CWwFvw0Ffo2c4SWNjCrscOW5AF3wytpuiv8wECQFXXo=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=Us8DYBBqBn/iiXU5PwRtkZeejmyIM/m3n+0dZodnPyiMWMtBt27yMGF/mgQ6y/WlV
	 sJtcDHpsEb/35OVAi5+SqJg8bnOKtL742LX4mibxe7pwzp5jwQZiWLjpBdI0l6zi3z
	 SCfhcWRwJgAEeZud7RbsYprTBbfZERkedNWBkilosWketm2Q2ZsJRWV8RJfqWnSkh+
	 XbCSEiICnnSjA0sg1Jp7GMANT5hj2AAK7M0dAXjuDEAkjNItayxlv6HWMyzeqftPyh
	 Wi/Cx8NpaF2LlaJU1rK3LiNgbjYRBs4ZTM+KSXEwMZgwkM9dEJr/zOAZmOqGSntYu3
	 vJBv6KnjYELlw==
Mime-Version: 1.0
Date: Wed, 03 Dec 2025 10:28:23 +0100
Message-Id: <DEOH4AUI33SQ.DGKJ4W258658@kernel.org>
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>, <tudor.ambarus@linaro.org>,
 <p-mantena@ti.com>, <linux-spi@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <a-dutta@ti.com>, <u-kumar1@ti.com>, <praneeth@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Santhosh Kumar K" <s-k6@ti.com>, "Pratyush Yadav" <pratyush@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250811193219.731851-1-s-k6@ti.com>
 <20250811193219.731851-2-s-k6@ti.com> <87seguemzu.fsf@bootlin.com>
 <cb04a4ec-c643-4b80-9288-8fd8944cb4f7@ti.com>
 <mafs0ikf74fja.fsf@kernel.org>
 <fe103265-7a68-41b8-b168-15a5e19abb3f@ti.com>
In-Reply-To: <fe103265-7a68-41b8-b168-15a5e19abb3f@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_012828_685523_636C68A5 
X-CRM114-Status: GOOD (  21.72  )
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
Content-Type: multipart/mixed; boundary="===============3357949314092918641=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3357949314092918641==
Content-Type: multipart/signed;
 boundary=b185b73c10f6ea43f717c58427e829611395f63eeecd3f3edebaeb91c380;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--b185b73c10f6ea43f717c58427e829611395f63eeecd3f3edebaeb91c380
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

>> I think we should start with the requirement to have the pattern flashed
>> already and figure out how SPI NOR or SPI NAND can discover that
>> (perhaps via NVMEM?).

But we should also keep in mind that certain flashes might return
tuning data during the dummy cycles. I.e. the PHY might probably be
tuned on each read and there is no need for any pre-programmed
pattern.

I'm not saying it should be implemented, but the current
implementation should be that flexible that it will be easy to add
that later.

> For SPI NOR, we do not have an equivalent "write-to-cache" possible, so
> we still require a pre-flashed pattern region. At the moment this is
> provided via a dedicated "phypattern" partition, and its offset is
> obtained through the of_get_* APIs.
>
> Regarding ways to locate the partition:
>
> 1. Using NVMEM:
>     a. Exposing the phypattern partition as an NVMEM cell and issuing an
>        NVMEM read during tuning does not work reliably, because NVMEM
>        ends up calling into the MTD read path and we cannot control which
>        read_op variant is used for the read.
>
>     b. Advertising the partition as an NVMEM cell and using NVMEM only
>        to fetch the offset is not possible either. NVMEM abstracts the
>        private data, including partition offsets, so we can't retrieve
>        the offset as well.

You can probably extend the NVMEM API in some way - or switching the
read_op on the fly.

> 2. Using of_get_* APIs:
>        Using the standard OF helpers to locate the phypattern partition
>        and retrieve its offset is both reliable and straighforward, and
>        is the approach currently implemented in v2.

I don't like that hardcoded partition name which is basically
becoming an ABI then.

At least we'd need some kind of phandle to the partition inside the
controller node (and get the ACK from the DT maintainers).

>> I think SFDP is quite nice for this, but IIRC for spi-candence-quadspi,
>> that was not a viable option due to some reasons. If you can now make it
>> work with SFDP, then that would be even better, since we don't have to
>> deal with the pain of pre-flashing.
>
> The current tuning flow requires a specific stress pattern to ensure
> robustness, and the SFDP data aren't good enough for it.

Yes that is also what I can remember from the flexspi controller on
the NXP SoCs. IIRC they need a very specific sequence of ones and
zeros.

-michael

--b185b73c10f6ea43f717c58427e829611395f63eeecd3f3edebaeb91c380
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaTACtxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gPwQGA3pVjRWYMCqc1eSB5eDPLLYDqKikeOb0D
6np2eeX62CQweG6ungvmImgtjSg3Y5mxAYCFL7pAL6wxpRjpzQIFH28XO9Eb/kx2
LqOuvkazj3BekP0SXOaztI8CsQR2zRpeTqg=
=W84c
-----END PGP SIGNATURE-----

--b185b73c10f6ea43f717c58427e829611395f63eeecd3f3edebaeb91c380--


--===============3357949314092918641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3357949314092918641==--

