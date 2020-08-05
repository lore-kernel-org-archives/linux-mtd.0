Return-Path: <SRS0=xIOg=BP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83D4C433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2020 20:28:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C7D522B42
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2020 20:28:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V8YvRiZT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="iH/s9/oF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C7D522B42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7US90hrwHaCE/W+i5O/Q1MHnFZMsNYQ8jhaYmVr8OPQ=; b=V8YvRiZTn14QjVeyn+0daWgd1
	RP3VBrHwVkY6WMbld5FaNSrV5ZzIDPTUeymfDZm+Tl9AEnJF0feP0BjRkjh2ol780IMO4bHkTojXt
	K7G5vYV8+JVZar5p5eOSdJo+VD4X8nidtILQdigRcmrMT48wluqSyqrAcZSgeg15pF1aJRFEOyYOO
	nOZ1uzdk57X9k4q8qrR4VT7mh6Xybr8D3mAGA2ujgiQ116GXHQ5fwCplVnlkgjJvhREjXV6r06eCr
	j9vamx4AscyCb0DIM6qNo8MZlTki51/GVg9c6a8kUcKgX+wyTtu8BsAPVFuvfNdUuai7meDLN0yro
	OWYxiej2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3Q0T-0005oB-RU; Wed, 05 Aug 2020 20:27:25 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3Q0N-0005n4-4k
 for linux-mtd@lists.infradead.org; Wed, 05 Aug 2020 20:27:20 +0000
Received: by mail-qt1-x843.google.com with SMTP id w9so34693741qts.6
 for <linux-mtd@lists.infradead.org>; Wed, 05 Aug 2020 13:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fNLXuUv5zsD4eCp2NPmnGkehJj6Cw4nIIDheWyj0tNc=;
 b=iH/s9/oFWbSLa+jVDfUWQ+/mNpwRMxY6m/0GVLnRvRfmaC8OsnIKxqnGsf8uPuBibT
 qod/DQtaAiLMpgTGs8NEdiHMOM8IiHYHz9KEFervu/clK4FzbbMKm/PJY9zNBCfa8Ej0
 jwWc7UjwQBq1e3GY14a+3f/tS3gUYX9B1L8bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fNLXuUv5zsD4eCp2NPmnGkehJj6Cw4nIIDheWyj0tNc=;
 b=B9JRTn9wPvSOqUAHojwnZfkwN8nQAtIE9QzpGZa+k+TNXR5hGKvGJDmc9q66blsE06
 tx17kTF7SciXh/mHUSQJ3Yb9F2MQYGxdAVXtxC0aLnQZmkBMRPig0odctaCyD7WbC69d
 BfSYC8FcyKlcY7abcb24YsOl30UWWOB/JhFAgGNsyhHOWhTMWC0/4zATMGLHDxKElthy
 ZmImpVrWTFU9yFXSU8RlabyznPsbGTl4tAp1eCm8HVM0RbNRlbzcuN2QXe4eVpH/9Czq
 xU8jT49rOpEwN9ArSKIhTu/Wr5htVEC1ffsRaRfxBXZ17kSYFI4cmb0XI2LVq+14PGQ0
 5FfQ==
X-Gm-Message-State: AOAM531JepfScrmUQ4OOroyQ5JVWZVEdSoKSB+23XHEZn7ScblljGbrT
 vlR6y1jfkzRaVPR8ys/JwW9xkw==
X-Google-Smtp-Source: ABdhPJz3aBLzpypIvtWr3rvBVcVoEG8HAX1as6JTJcduteBSeegqtcbRtqJznFZ/senn8vt+yYwuNQ==
X-Received: by 2002:aed:2986:: with SMTP id o6mr5276701qtd.105.1596659237042; 
 Wed, 05 Aug 2020 13:27:17 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-3826-99f0-e3e6-2490.inf6.spectrum.com.
 [2606:a000:1401:8c61:3826:99f0:e3e6:2490])
 by smtp.gmail.com with ESMTPSA id 15sm2390617qkm.112.2020.08.05.13.27.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Aug 2020 13:27:16 -0700 (PDT)
Date: Wed, 5 Aug 2020 16:27:14 -0400
From: Tom Rini <trini@konsulko.com>
To: "Doyle, Patrick" <pdoyle@irobot.com>
Subject: Re: [PATCH] Fix corner case in bad block table handling.
Message-ID: <20200805202714.GW6965@bill-the-cat>
References: <MN2PR13MB3309227C223D0CD8AFE5836AB37E0@MN2PR13MB3309.namprd13.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MN2PR13MB3309227C223D0CD8AFE5836AB37E0@MN2PR13MB3309.namprd13.prod.outlook.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_162719_271864_52EB15CD 
X-CRM114-Status: GOOD (  12.12  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Content-Type: multipart/mixed; boundary="===============2048527200311201993=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2048527200311201993==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P33LUqzLXAslwFyJ"
Content-Disposition: inline


--P33LUqzLXAslwFyJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2020 at 02:46:34PM +0000, Doyle, Patrick wrote:

> In the unlikely event that both blocks 10 and 11 are marked as bad (on a
> 32 bit machine), then the process of marking block 10 as bad stomps on
> cached entry for block 11.  There are (of course) other examples.
>=20
> Signed-off-by: Patrick Doyle <pdoyle@irobot.com>
> Reviewed-by: Richard Weinberger <richard@nod.at>

Applied to u-boot/master, thanks!

--=20
Tom

--P33LUqzLXAslwFyJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8rFiEACgkQFHw5/5Y0
tyzCrgv/cKRxfU1wUJSwXFMdg62CmrlCEl5sfVjK4z5UB+Rs5bxB5A/iJTY/XUZ8
WqTxlBYw2LCXFpCNO/UrbhCPANfKwNKis/VS1so2PLC5OPidEPy7RRLnW9dOHlI/
d68pKgc8orck9nFFChvv89P16CteNY8SOKImw55IXiZZJQ4jrzn0GcR63MdbB7RY
zIC3QeS1Rwo0asfO4O2QjLJ3o1ZcSwXVTdlLFTdOluCqybZwqN//w6JS1X6vhw2J
X6JMClLtTfuRUF0RHPI0uPfT5NvAsI3dG0HuY9cVG1NIJuUr8odTd2+rcGulqgi7
rK4uYgfOJQSMKVTUI9H3RpgS5Dh2LnoWomhbwiw8JXymvTcIPJ9mjzveWWQkpJiG
yu44MEtw8GHgYudJ8aAAHrkBDsSAwCazGNklVxQpcaR2pnV99sXR5biBU7kBHqCx
Q3cbzw44cia9GX8CvTMqb4hGO27iGOu3qtWi5HMTybqWBV8dxiTYpdASm6IbCoPJ
sg5xybVF
=gq7C
-----END PGP SIGNATURE-----

--P33LUqzLXAslwFyJ--


--===============2048527200311201993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2048527200311201993==--

