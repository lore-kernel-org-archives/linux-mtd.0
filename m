Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640E6C3DA4A
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Aug 2024 08:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+D9rO2xadOlBTusuRDtlWBvWOQOE9jmLHF12cgN1qr8=; b=ggrw4yy0ZuFoi74sEnCNC12bct
	0Bit5Du1i5n5uEUyh4JxGnS05npVSyrZTzptD4TxCch0yyRg0OiOKfYO+Ecw3ORbZdgOjxc+maZJ5
	/aR2pWWGSI84nctxycP20d6UF2XKJfhBf6a+XxEJjvr1zBZUmWFSn0/JwCqWVCwT9pFW7yDE/gvLl
	PkHShScUHhWwq37Rt+WCJ/5C6N4l/IwZ4pwp5g2bG1q1GjsvDomzuBevjgqe7sYSLFCiYXugVEaRX
	4p2JLYF1zbW3pIs17Q3xrd09jrbmJQus8HLbjWtDfwRudC/Y6wDN2xDMUQxNVMbTt4LBTWsISW9WR
	lqMSzhDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbyfY-00000007c82-1lzy;
	Thu, 08 Aug 2024 08:38:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbyfV-00000007c7c-3awP
	for linux-mtd@lists.infradead.org;
	Thu, 08 Aug 2024 08:38:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C847961202;
	Thu,  8 Aug 2024 08:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AEEBC32782;
	Thu,  8 Aug 2024 08:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723106324;
	bh=g3ikIRAPipqduSbR7KInxgwTL/5kZLfprTrDzwfV0uA=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=KvD5Ld4IjS7ZeAjZkoDlg/VbOFMCn9OKliVPU3yluJ1PCJhlDCgy0a6A+Sn/ne0kc
	 k6BThMb21O2O0P1dTP8rPYlmvVwYgIR9T+pF/6EVlfzUq1cF99PchdEyxNu121s1TY
	 s6dHGkqFkn539PUlBH4vPGsJ2wev0XjJRvmXl1z1A196asClp0A1JX38mVzzDVC0xD
	 PmYu5DC1N2iESYdCsjjzX9HD1rU1xBlgxMyDQeVPWplq9cnqab3v+3d/u0kGXvo9iL
	 UFTB4Z5Q75mFJwGEhOocKbMUqvivzob68tNqln/e1Bh4R6DttOUmFy0ZT/tPoCKDaC
	 WHgDGImxu/FnA==
Date: Thu, 08 Aug 2024 10:38:40 +0200
Message-Id: <D3AE7NOJD3G1.1IATY7XUPCPSG@kernel.org>
Cc: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <richard@nod.at>,
 <tudor.ambarus@linaro.org>, <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "A. Zini" <alessandro.zini@siemens.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/3] mtd: spi-nor: handle JEDEC manufacturer bank
X-Mailer: aerc 0.16.0
References: <D37V6QTQZM50.2I613FUEQIWXG@kernel.org>
 <20240807133741.27785-1-alessandro.zini@siemens.com>
In-Reply-To: <20240807133741.27785-1-alessandro.zini@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_013846_005385_23C02E0B 
X-CRM114-Status: GOOD (  31.23  )
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
Content-Type: multipart/mixed; boundary="===============4857067547918410317=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4857067547918410317==
Content-Type: multipart/signed;
 boundary=8d48b932c10c9082b555022186e3422e233fd3e18fa09b2d37a365591f87;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--8d48b932c10c9082b555022186e3422e233fd3e18fa09b2d37a365591f87
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Aug 7, 2024 at 3:37 PM CEST, A. Zini wrote:
> > > Given the fast expanding pace of JEP106, the read ID operation has
> > > been expanded to 128 Bytes plus the pre-existing 6 Bytes for the ID
> > > code, thus supporting up to 128 banks.
> >
> > I really don't like issuing a 128byte command for older flashes. So
> > maybe we can just stick to the 6 bytes and if that's not enough we
> > can use the extended format.
>
> I agree that there may be better solutions than this. The idea for this
> patch was indeed to gather some of them and trigger a discussion.
>
> The question I have here is how can we determine when it's "enough"?

Given that most IDs are three bytes long (ignoring any extended IDs
for now) and that the former read length was 6, I'd say it's enough
up until bank 2. IOW. if the IDs are starting with more than 3
continuation codes, resend an extended RDID.

> > I'd like to keep the .id as the primary index. This will now
> > introduce a mfr_bank, so the unique key will be (mfr_bank,id). Can
> > we somehow encode the continuation codes into the id itself? E.g.
> > we know the manufacturer ID is always < 127. Honestly, I'm not sure
> > this is the way to go as we know flash manufacturers sometimes don't
> > care. So right now, we just compare the .id with whats returned by
> > the RDID command without interpreting it.
>
> Even though the manufacturer bank is technically not part of the ID as
> per JEDEC standard, it's still a piece of information needed to
> correctly identify a chip and avoid collisions.
> Therefore, my opinion is that it should be part of the unique key,
> whether encoded in the id itself or in a different field.

Yes of course. I'm just wondering about the advantages of encoding
this as "mfr_bank" instead of just keep it dead simple and use
SNOR_ID(0x7f, 0x7f...). Yes, they might get long and take up a bit
of code space, OTOH we know that vendors f*ck up and get things
wrong. E.g. have a look at the cy15x104q entry.. It wouldn't be
possible to use mfr_bank with that entry.

FWIW, I'm still envisioning a .match() callback, where an SPI-NOR
flash driver could just register its own match function and the core
provides a default "match_snor_id()" one. We could get rid of all
the fixup functions, where we correct the flash parameters in case a
different flash is found which happens to have the same ID.

-michael

> One other possibility could be, when needed, to add two bytes to the id
> field, them being one continuation code and one multiplier factor
> indicating how many continuation codes are present for this
> manufacturer. The absence of the leading continuation code would
> (obviously) be assumed as bank 1.
> The spi_nor_match_id() function should of course be adapted to handle
> this additional information, but we would not have to add an additional
> mfr_bank field.
>
> --
> Alessandro


--8d48b932c10c9082b555022186e3422e233fd3e18fa09b2d37a365591f87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZrSEERIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gZBQF+K/c4M5eyKrYoGvmLR9+jJS9SxZmERW33
TAy/fBCLYvS7tH8oWVpgu7sQMczn9xMIAX4mrz1Msu5BVdnxYkSe5dnMas/aoQE9
oW7Lix35NjmnQ9YMbkRFWqhDwvgJbPUNtyY=
=09c2
-----END PGP SIGNATURE-----

--8d48b932c10c9082b555022186e3422e233fd3e18fa09b2d37a365591f87--


--===============4857067547918410317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4857067547918410317==--

