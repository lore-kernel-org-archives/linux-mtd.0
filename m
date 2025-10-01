Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52949CCA470
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Oct 2025 06:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E40I98JUXxNbgfp8OXBN8OCsRmrPqmzsrQasZh1csl8=; b=PHzWqrii+MBe+ivsAn7uAd0Ie6
	xPHo5oDcQE/94s28SL0CynDPYkSdQbko3tl7FKyE28HFxv6eSwojdwwYab7ojjfTcqHgGHPgW3Qru
	W3EiZHvGGpA4B5SLHM84vK/HBRfFbFESG5EepENvtAtxo4JJdSHP4c9weSyPwSXye581CL8ozrBUk
	ZvY138R19aqTrhpf2IEP3Ek4fTp61q5aGYf4kdX3VpDxgvNc3Aq6p3jikpscU41s3LuMV0bKpTc2l
	+4a4N5tXsR1y59e3mc5KYl+PCaKgl69c2QuQmJkRsoFhoil/bLb1GrAc776A7JOcIdKR2flkrmdKC
	GsOrBYjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3qoM-00000006rCq-1FSg;
	Wed, 01 Oct 2025 06:59:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3qoK-00000006rC8-3Fas
	for linux-mtd@lists.infradead.org;
	Wed, 01 Oct 2025 06:59:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A1BD6143E;
	Wed,  1 Oct 2025 06:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FE0C4CEF4;
	Wed,  1 Oct 2025 06:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759301975;
	bh=1yJxZK3byuLEeQPsQJ6XJ43/ahRJPZuvJfz7COfwWkA=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=BHXtSLstPI8e8tMP+yHELucjuefDahdhaKs0MUmyXwi4hRD1dOQfPrBP5rG3PcaWe
	 lpxGM7dy9E3tkUdHtM0iL9+EMmet9lypUwhqBM1tahnUDNadV9C/DpIEzjomeLi48v
	 uED4P64eOS0O9WuSXwiwqdrvqAzo9E/1r5Pr0h8Hyj4TdJ65ryq8OyHUZiqw30ox1M
	 zND92Kc1w6TUYpfWzOfb8QbgAIS6uTyIxMaQ7SGdeuU8GOBr8Nr82hbmA4yR73ci9d
	 recBekhXWmGkxL27wN3xMDqIdj5sJLLvEHgA4p7MgcPUs8uVl5JCwSysb8xshaIZ07
	 ZkfeME4JXszEw==
Mime-Version: 1.0
Date: Wed, 01 Oct 2025 08:59:31 +0200
Message-Id: <DD6SI06QNEE4.2YCRTWJHEAAQM@kernel.org>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
Cc: "Cheng Ming Lin" <linchengming884@gmail.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Guenter Roeck" <linux@roeck-us.net>, "Cheng
 Ming Lin" <chengminglin@mxic.com.tw>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <alvinzhou@mxic.com.tw>,
 <leoyu@mxic.com.tw>
From: "Michael Walle" <mwalle@kernel.org>
To: "Maarten Zanders" <maarten@zanders.be>, "Pratyush Yadav"
 <pratyush@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250407075400.1113177-1-linchengming884@gmail.com>
 <20250407075400.1113177-2-linchengming884@gmail.com>
 <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
 <mafs05xh6pf7s.fsf@kernel.org>
 <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
 <a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net>
 <aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
 <CAAyq3SYybDgBvkTKh2ZB4UdKq1XV_nnzx3Tj1P915W5x_7_nNA@mail.gmail.com>
 <DD10QMSJVZ2K.26U45JAXV5EY7@kernel.org>
 <CAAyq3SYyqi-oR8T039Zd0uaF6UieX3SdF9UF2kxOG6+yJqAEUg@mail.gmail.com>
 <mafs01pnoceum.fsf@kernel.org>
 <CAPB_pE+f7QGNaBgWz6OSOmfBAdCoOgnUhCV=KzUR94vWt_pEYA@mail.gmail.com>
In-Reply-To: <CAPB_pE+f7QGNaBgWz6OSOmfBAdCoOgnUhCV=KzUR94vWt_pEYA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0500729221536288512=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0500729221536288512==
Content-Type: multipart/signed;
 boundary=59e99ccff2b1627692d0a8b7f4bbfe00a63a16e6c6d961c2c4ba750aa455;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--59e99ccff2b1627692d0a8b7f4bbfe00a63a16e6c6d961c2c4ba750aa455
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Sep 30, 2025 at 3:15 PM CEST, Maarten Zanders wrote:
> Hi all,
>
> On Tue, Sep 30, 2025 at 2:19=E2=80=AFPM Pratyush Yadav <pratyush@kernel.o=
rg> wrote:
>> > I agree with reverting this patch. When I initially verified it, the
>> > devices I had on hand all supported SFDP, so I did not catch this issu=
e.
>> > After checking again, I confirm that some older flashes without SFDP a=
re
>> > indeed affected.
>>
>> Do you know if these flashes are used in any devices that are actively
>> used and maintained? If so, we should revert. If it is likely they
>> aren't actively used, then maybe we just keep things as they are?
>> Dunno...
>
> The non-SFDP parts have been obsoleted in 2009-2010 according to
> Macronix's PCN's. So they're pretty ancient.
>
> If we choose to keep the patch in, I think we should make it more
> consistent and drop support for the smaller flashes without SFDP as
> well. The behavior is different in the spi-nor core for SFDP-parsed vs
> non-SFDP-parsed cases.
> In particular ID's 0xc22016 and 0xc22017 could be handled in the same
> way I believe?

Being EOL doesn't mean they aren't used anymore. SPI (NOR) flashes
tend to be used because they are a rather reliable. So I could
imagine that they are still in use somewhere. My main concern is,
that if we just drop them now and thus make newer flashes work (like
the one from Maarten), we might find ourselves in an uncomfortable
situation in the future. What if someone is reporting a regression
with older flashes? We can't just revert this patch then because we
already support newer flashes. Actually we are in this situation
right now, but not *that* much time has passed.

If we decide to drop older flash support just like that, I'd vote
for a grace period where the user is informed about it.

But I still think we have a better solution: always parse SFDP.
Pre-populate the flash parameters with the info from the flashdb and
then just try to parse the SFDP. There was always the concern to
issue the RDSFDP command on flashes which doesn't support it and
cause unknown behavior. But we are already doing that today with
unknown flashes. So far there was no single report and we have that
behavior for years now (commit 773bbe104497 ("mtd: spi-nor: add
generic flash driver")).

-michael

--59e99ccff2b1627692d0a8b7f4bbfe00a63a16e6c6d961c2c4ba750aa455
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaNzRUxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jC3QGAvM2LLUFf1p0n0KiQZRdrXOutgVN6J6Tf
TM9WL6ezcuCuNUkJH8fKfC0y59aPVjPgAYCr4DEqdDowo76gJ7h9Ikqetua4oyfv
NlYLZ9MQc3kRKZD07XwJaqT6rqOn8Jt5U5A=
=tm4a
-----END PGP SIGNATURE-----

--59e99ccff2b1627692d0a8b7f4bbfe00a63a16e6c6d961c2c4ba750aa455--


--===============0500729221536288512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0500729221536288512==--

