Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FB0D35176
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Apr 2026 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uHXqGycrFIr4OO/NjsPLWbs3DMWYd8EeZE4HipKifw=; b=fLDb06B1I8auxI1sLex9zy2pJC
	pYRBddfd9vLPG8ztMRylHNRbcyPcFnEm3JXKjiUjbsnXdAK1aTO68+Glf1r7TzSBwwCy9ffUBKhfc
	QVXRV6eusjtiQcWNuA6ynnggJRxOz382Top504MwB6bJUbq9WBRpc4gsHulvxVS54Cl4kmTQm5Z+X
	iIgPMNNpTxarzBN23o/mtzuf2ImbBGDhMenef6AEpS3eCDKvtzS3brTVw4y1knW/JGznVO9ArNAcW
	TcbmrwuWhPMGoziRXewyPO1RgCQi+EYBmGPJqGPFG0KuhGschtYvH96oe7//f/+m8gKJBVG7cJfeA
	gQLGd5kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tJD-0000000EaWr-2SV2;
	Wed, 01 Apr 2026 11:00:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tJB-0000000EaWW-47Tv
	for linux-mtd@lists.infradead.org;
	Wed, 01 Apr 2026 11:00:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 48DBC60126;
	Wed,  1 Apr 2026 11:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F7EC4CEF7;
	Wed,  1 Apr 2026 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775041225;
	bh=P4gPDzIC37mQ2XU2ES1ReyzNW1zgfb4XNdW83riZvtY=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=sFSPKFYweFFOdfbH0OagWFKdwhTq+1MKRsDYRdV0xhvI13BSdEYfJPfUUliaIsPZ8
	 59delv7rophLlaAEkA816DG+xemnbsLMn18Z6kK1y4E1ZuyYuvEiMYmsbG4+rvLY3I
	 Qg0dOE9Aeo4I0uV48WTnU4mWriwqWLJfSDHwy6X+fp3uaudWzUyNUbrd3BFgqVMo83
	 tMI5nivsa18n4OrbifXTgH/cIcjG+hjs8npXnLpiNmTcbPCtrDpksT6Q7eFhIbhR0B
	 +2LuH1JNsqXCPyTqkH3RAMie5qpNbRxJA/H/Fk6ORUkatElASRqgw/y/0ofC3NGIDj
	 UyiGqB+8ucCjg==
Mime-Version: 1.0
Date: Wed, 01 Apr 2026 13:00:20 +0200
Message-Id: <DHHRLJLX9AVS.CRZTDV7TP1DO@kernel.org>
Subject: Re: [PATCH RFC 6/7] spi: spi-mem: Call spi_set_rx_sampling_point()
 for each op
Cc: "Frieder Schrempf" <frieder@fris.de>, "Mark Brown" <broonie@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Han Xu" <han.xu@nxp.com>, "Eberhard Stoll"
 <eberhard.stoll@kontron.de>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Pratyush Yadav" <pratyush@kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <imx@lists.linux.dev>, "Santhosh Kumar K" <s-k6@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Frieder Schrempf"
 <frieder.schrempf@kontron.de>
X-Mailer: aerc 0.20.0
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de> <20260303-fsl-qspi-rx-sampling-delay-v1-6-9326bbc492d6@kontron.de> <87wlzlnioh.fsf@bootlin.com> <a1a711c4-d9df-4bba-8831-2ec787f84cc4@kontron.de> <87ecl09wtv.fsf@bootlin.com> <633fee13-a397-410f-a595-db95e04b8110@kontron.de> <87ldf881gr.fsf@bootlin.com> <fed5fba7-0536-4f92-8372-f4b47c89b1c2@kontron.de> <874ilv84j8.fsf@bootlin.com>
In-Reply-To: <874ilv84j8.fsf@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============6949920430756587931=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6949920430756587931==
Content-Type: multipart/signed;
 boundary=20ef4b1937c524c4b5e1cf3c92e15c2d5ceb7be4f72bca70e5220b66a6c0;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--20ef4b1937c524c4b5e1cf3c92e15c2d5ceb7be4f72bca70e5220b66a6c0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Apr 1, 2026 at 10:32 AM CEST, Miquel Raynal wrote:
>> Let's say for a worst case scenario a chip has an RX delay of 20ns (the
>> highest I've seen in datasheets so far is 8ns). In that case the maximum
>> clock we could safely use for reading the ID would be 1/(2*20e-9) =3D
>> 25MHz. Do you think it really makes much of a difference if we read the
>> ID (only a handful of bytes) at 25MHz or full speed (e. g. 104 MHz)? I
>> mean this should be fast enough either way, no? But maybe I'm misjudging
>> this.
>
> I am honestly not a big fan of the global penalty, but I am not totally
> opposed either, especially since you just said you only observed 8ns
> delays at most. This is 62.5MHz, which is already above what most
> designs use, so the penalty would be minimal. What about taking this
> approach and see if that fixes most of our use cases?

What are the actual numbers we are talking about here? I mean, at
least for SPI NOR, we only read the ID *once*. And it takes about 56
bits (command + id length of 6). That is about 2us at 25MHz. I'd
guess the setup and the software handling takes far longer than
that.

-michael

--20ef4b1937c524c4b5e1cf3c92e15c2d5ceb7be4f72bca70e5220b66a6c0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCacz6xRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jivwF7BfdJ2oJO2K3l5ud626MmhRiz2MLQbewR
E5u5gITBAhN2jHdEai/ryzBXc5JvEBklAYCLd3qRamZ8b67NsNkXMP4lXC5UL7VN
gh53mq8O5Msc590EhY5l3GZxv8zwbYJGhFU=
=FqVe
-----END PGP SIGNATURE-----

--20ef4b1937c524c4b5e1cf3c92e15c2d5ceb7be4f72bca70e5220b66a6c0--


--===============6949920430756587931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6949920430756587931==--

