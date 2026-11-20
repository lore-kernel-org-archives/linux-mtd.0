Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C42606A331
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 12:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m4QtFG6F;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hso3mAMK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v49o9GaFu5bvoTwnfKH2OrYkVdEoUVDcU+aUi36JRNg=; b=m4QtFG6Ff/xsJFklL4gGncb9I4
	lFmWVcZ1ptLEDl/xGqYXVu6L/NCZI6f/+bbmXP8GVhEp8fw7InO4CARdaQpjDIlPp/BV6mPV3TaSH
	JDG1Jpk2CR33lYFN96xft7cxGSIfOO1ejX0lP9PDZdTOatYaxHSypDJ6wZFZ0dipwihqtfldy3Fws
	/nwBPEG6BTFI/6URh2A56pCq3ClM/KJgRnHpYt63smqTcncKd2EDB9GnnZi3EeCPWdNBc+ZXxmeYk
	RDs0p4BS/kCBK8Vl39OqVQ3bIvBNA9VLGIVxG7aL1HQxTTrzwhmDNzHe50YyW1WRKu2x0DSZNzCQ2
	Jn9AJv1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNvh-0000000EzRg-46Ki;
	Fri, 20 Nov 2026 12:41:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNvg-0000000EzRG-2GyC
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 12:41:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 175A6403CA;
	Fri, 20 Nov 2026 12:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 51C541F000CA;
	Fri, 20 Nov 2026 12:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795178483;
	bh=pOz5Kp9Rx77Id2rt+cmAdtztYLE/96Bihgs/QD1W4Ds=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=hso3mAMKKr1LtxhrYacAuDi5W3FY/TsDpioBP9WvasaMxmR603VWxr5AAoZfadPtD
	 GRn+eYgWucP6Dt0PEHvYfCk7lfiwXO4v9nHpRQ4AopeVhxSnevQb5fujM2iPZ3oR21
	 t3obW9Y/gpmGQUZLUt6e2IdBUV0XI2ApJnOkWVLtsmWbE942T04u+IgWBJIYFWMmfS
	 dKuVP8HFswJSP8tUwNfBcAyJ+mF+D3YG72F0uZnnQ5dpGu7BgBFhJmNJ4lr1EbXO9L
	 /EqZDPuZlxvgKTJZcupnla90tT20DBDUtMSIVyn2q/lwGMjmlT6NpFyZ9yM4F4+7rB
	 Ai1Jm9Fq4vIYg==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 20 Nov 2026 13:41:19 +0100
Message-Id: <DN01NSO0FLT0.11GY6QPV7JVR4@kernel.org>
To: "Cheng Ming Lin" <linchengming884@gmail.com>, "Marek Vasut"
 <marex@nabladev.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Describe locking support for
 MX25L51245G
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Maarten Zanders" <maarten@zanders.be>,
 "Cheng Ming Lin" <chengminglin@mxic.com.tw>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20261024001658.222147-1-marex@nabladev.com>
 <8ee5b312-80bc-4584-ac35-cc76c2812c5d@nabladev.com>
 <20261028081534.945416-1-linchengming884@gmail.com>
In-Reply-To: <20261028081534.945416-1-linchengming884@gmail.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============9024688794372664824=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============9024688794372664824==
Content-Type: multipart/signed;
 boundary=654c4deafe92b97eeb8f531c0823c0f759ccbbe1599d33a102b0087920a3;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--654c4deafe92b97eeb8f531c0823c0f759ccbbe1599d33a102b0087920a3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

sorry for the slow response.

On Wed Oct 28, 2026 at 9:15 AM CET, Cheng Ming Lin wrote:
> On 10/24/26 2:18 AM, Marek Vasut wrote:
>> Cheng Ming , can you (or someone from Macronix) please have a look at
>> this patch and confirm that it is OK ?
>
> I checked the patch against the MX25L51245G datasheet. RDCR (0x15),
> CR bit 3 as TB, the TB bit being OTP, and the 4-BP locking scheme all
> match the datasheet, so the description is correct from our side.
>
> One concern, in line with the sashiko-bot comment: since locking is
> an optional feature, I think failing to read CR should not fail the
> probe. Controllers with a restricted opcode set (e.g. spi-intel) will
> return -EOPNOTSUPP for 0x15, and this part probes fine on them today
> with macronix_qpp4b_fixups. Rather than special-casing -EOPNOTSUPP,
> how about just leaving locking disabled on any CR read error, e.g.:
>
> 	/*
> 	 * Locking is optional. If CR cannot be read (e.g. the controller
> 	 * does not support RDCR), leave locking disabled instead of
> 	 * failing the probe.
> 	 */
> 	if (mx25l51245_read_cr(nor, nor->bouncebuf))
> 		return 0;
>
> Michael, a related question for you. Maarten posted a series last
> year to make the RDCR opcode configurable in the core and use 0x15
> for Macronix:
>
> https://lore.kernel.org/linux-mtd/20250922155635.749975-1-maarten@zanders=
.be/
>
> It stalled because setting 0x15 for all Macronix parts is wrong (e.g.
> MX25L12805D has no RDCR), and because there was no user of RDCR at the
> time. This patch is now such a user.
>
> I have gone through the flashes currently in the Macronix ID table
> and checked which ones do not have a CR / do not support RDCR. If it
> helps, I can add this information per flash entry, so that 0x15 is
> only used for the parts that actually support it. For IDs that are
> shared by several parts, RDCR would only be enabled if all of them
> support it. That should address the concern on Maarten's series, and
> this patch could then simply use spi_nor_read_cr() instead of
> implementing its own RDCR helper in macronix.c.
>
> Would that be an acceptable direction?

Yes and in fact with the recent changes, you should be able to set
.read_sr2.

-michael

--654c4deafe92b97eeb8f531c0823c0f759ccbbe1599d33a102b0087920a3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCawA/8BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jcJAF9E/kmErxSnR7jg/hNYnj2SE2ALvVM715N
vihDIpRMR9t4q5LL483W0iqcWM/no4krAX4uX2p6HZIN+77TdCHivdnx4Dnvcmyd
Kl++/8Pn6vWeHBpg69v/a/6F/g63Tj88WYk=
=QVSo
-----END PGP SIGNATURE-----

--654c4deafe92b97eeb8f531c0823c0f759ccbbe1599d33a102b0087920a3--


--===============9024688794372664824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============9024688794372664824==--

