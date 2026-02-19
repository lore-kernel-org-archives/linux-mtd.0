Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05785E9A03B
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Feb 2026 08:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUkgSbNJHvy3uJaFJ2lJd+81DfqcrYlJxizlB5oO6Ns=; b=hew5+N0DLCb0t/8yw9ZDjc9u0e
	E5imnGqcXD1o4pFQL204AAX3HY70VYayAfpclCN5QUYK55Zz5AGbi8fYZ5D2WWZY82/iE0FHY+s3M
	dZluwZz58OLahjavGITEG+MTuVOcSI+RZqCOZQN7qoAcWDDreuFTUsH3rwBxWwIrZ5LLHusPqWXpM
	kDpFkPTqoIrIhdjIdsK0Rl9sg0XYT5nSz98SYQyo39E/zGWSYwaWbS4Bsf0f9c7la3rhML7BGR1RO
	SniFyOUPuaqzLTtg8g8w5JsvBFxk/hWxF2QkTi5bUOq1KKmeID6ClnEqVxb/zBg84XD5x5YT6q6zI
	Qtr1TTcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vszTN-0000000B89P-0SXT;
	Thu, 19 Feb 2026 08:33:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vszTI-0000000B88c-01iW
	for linux-mtd@lists.infradead.org;
	Thu, 19 Feb 2026 08:33:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B99743DFF;
	Thu, 19 Feb 2026 08:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC66C4CEF7;
	Thu, 19 Feb 2026 08:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771489994;
	bh=7CuuK/0ziAW4syVDA6KX77tamFKsOSxget6SwWeQIlk=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=D9Mr9LYCm37L/N1CWOpScJRdqgnZLzw4qLlvMjs+U00wtD7L8FxIQgmfyJq6xksQL
	 OAN8I/siEyhOeWyxAzw7tKW1rHgcWRCtG+2KcOOONTvuQr6RAV1VhKvC/8sfDYjjf4
	 IRbtuSI/rrxB5oIQPKbv36fnl8PjnBY1DuBHNJmUJZbfgtc4nrAQPZNfHmw2E1IuGI
	 bvY/ScaFuLc6wK/UGnsHPf2AvvHygy95AGF7eC/9vneFb8kwH/4t95qZX84vnZsjz7
	 E16MGADpdkNdgRZeERs5NXewPl+d6hCNykOiiEqukdVPfoYga3iVPAWm1Ac7/T8scz
	 SKsxbN6W4tZAQ==
Mime-Version: 1.0
Date: Thu, 19 Feb 2026 09:33:09 +0100
Message-Id: <DGISSIKZERL6.22GCNLNJG9KBY@kernel.org>
Subject: Re: [RFC PATCH v2 09/12] spi: cadence-quadspi: add PHY tuning
 infrastructure
Cc: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
 <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <praneeth@ti.com>, <u-kumar1@ti.com>, <p-mantena@ti.com>, <a-dutta@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Santhosh Kumar K" <s-k6@ti.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260113141617.1905039-1-s-k6@ti.com>
 <20260113141617.1905039-10-s-k6@ti.com>
 <DGAC4N62UZQQ.3R7TLX87PECU3@kernel.org> <87qzqqxml7.fsf@bootlin.com>
 <DGCXTWSCAH6R.22SIL82AUVGYI@kernel.org> <87fr76xgsl.fsf@bootlin.com>
 <54964ad3-64d7-4f4e-bcf9-f0b92b1df034@ti.com>
In-Reply-To: <54964ad3-64d7-4f4e-bcf9-f0b92b1df034@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_003316_093343_80F7C509 
X-CRM114-Status: GOOD (  25.06  )
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
Content-Type: multipart/mixed; boundary="===============0455817472266742457=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0455817472266742457==
Content-Type: multipart/signed;
 boundary=8180e7ca633d8ac0d60acc5bb8be376c76d43e2963a101100fb17d52ff94;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--8180e7ca633d8ac0d60acc5bb8be376c76d43e2963a101100fb17d52ff94
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Feb 18, 2026 at 7:07 PM CET, Santhosh Kumar K wrote:
> Hello Michael and Miquel,
>
> On 12/02/26 18:25, Miquel Raynal wrote:
>> Hello,
>>=20
>>>>>> +	for_each_child_of_node(partition_np, part_np) {
>>>>>> +		if (of_property_read_string(part_np, "label", &label) ||
>>>>>> +		    !strstr(label, "phypattern"))
>>>>>> +			continue;
>>>>>
>>>>> There was already a review comment on the last version. Moving this
>>>>> into the driver doesn't make it any better. In fact this might
>>>>> create a (bad) precedent for future drivers.
>>>>
>>>> I remember complaining about it but not if there was a solution
>>>> foreseen. In SPI NAND the solution has been found: the pattern is in t=
he
>>>> driver and we load it into cache before PHY tuning. But for SPI NOR I
>>>> understood this wasn't possible. What would be an alternative?
>>>
>>> I'm not complaining about using a partition for the pattern but
>>> about the hardcoded name of it.
>>>
>>> It was proposed to use at least a device tree phandle to point to a
>>> partition (or so).
>>=20
>> Ah, yes indeed, thanks for clarifying this up (again) for me. I also
>> agree the hardcoded name is not ideal.
>
> I remember this was discussed in the previous version. As mentioned
> in v1, using a phandle may not be ideal since a single controller can
> be associated with multiple flashes. Regarding the suggestion to
> maintain an array of phandles - consider a configuration with three
> flashes (NAND, NOR, and another NAND). In such a case, we would not
> need a phandle for the NAND devices, right?

Miquel said:
 | I find pretty strange to have this property in the flash node,
 | even though I understand the reason. Perhaps an array of phandles
 | may work in the controller node instead?  So maybe the phandle
 | should be inside the flash node?

But why is this strange? Can't we treat it as some kind of hint for
the controller, esp. because as we now learned, that it's not needed
for NAND flashes?

I.e. for phy tuning to work you'll have either:
 - nand flash, there it just works out of the box
 - nor flash, you'll need a phy-calibration-pattern-hint property in
   the flash node pointing to a flash partition.

If you think about it, a flash partition with a fixed name is also
part of the flash node. You just add one more indirection to get rid
of the hardcoded name and have a proper DT ABI.

> Also, I'm trying to understand the practical difference between using
> the partition name versus a phandle. Since the phandle would still be
> named something like "phy_partition", it seems functionally similar.
> Please let me know if I'm missing something here.

A phandle will be part of the DT ABI. And it will be configurable by
the user.

-michael

--8180e7ca633d8ac0d60acc5bb8be376c76d43e2963a101100fb17d52ff94
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaZbKxhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gfIQGAhm4BHvpagP/nqVzn2KYHGkLZLYVEFUXO
Eu1rxUUExUUxthrES6MNO5nq1l0/ShbSAYDvtKFe7f4djqUowfoczDGG2uyRYY+Q
C5mflOiigfpnGTVRUXm0MTFX+V7jb9vpNWc=
=Mowf
-----END PGP SIGNATURE-----

--8180e7ca633d8ac0d60acc5bb8be376c76d43e2963a101100fb17d52ff94--


--===============0455817472266742457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0455817472266742457==--

