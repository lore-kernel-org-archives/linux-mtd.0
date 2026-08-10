Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08C7C5AC82
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 06:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bs9vzdUA40xcior+mHCgN/t/kg0QOxsHe04VxEkWuGw=; b=D3hc3Z+e1+TYZt7M5XyFpXg6pe
	HQXjGBDaie/DtkDVZrbXil3cVCh4+Rp088TbeOcCN308f7cB38zpu4CIIjFb5ot/sqN66rfAABNN4
	G1urc+Kx76gO/Dc+QhoC0VpWbtvaVDAz7IMsQlvXk/jp232I3Z2wqvvi3Tcz+0KEQ04b+1V/CIeWK
	9zjvfCbBOfcFNVl0rClVHgXI6XNtxUfRCutjBbGWlUURj8xDdQJiJ9Qhm/4Cqx9MkivZZlxAnRdJy
	lnZbfUwAwlQsFDxJYY4sPcyTatvzTeYHugCNMXlv185pvMVYlfdAYbnu925Yp3afJtwkrAwtCStCo
	+6rG075A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJWd-0000000B5yz-1yb0;
	Mon, 10 Aug 2026 06:30:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJWc-0000000B5ys-0Axb
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 06:30:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id E69C34379F;
	Mon, 10 Aug 2026 06:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 778541F000E9;
	Mon, 10 Aug 2026 06:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786343415;
	bh=bMbqWLJ+xQ+0ueSURHl638U6qP2j2ips3hDRe4p2Etw=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=jSSVEqm3DTTfRBLdBkRpPfj2gkzmu5dPycNv1U4xsmRwep1lnTYAlP86PurPHDTdN
	 YVzzJdAgDQdlktMZIZcNibY7NQBdMBspeYUkNvxAYL1Ru9fRr8QBeT5bJvSxYbiMy4
	 /bHJmHxgTnscExcb1mW9eJVaQMsdzwH7oPgbrIHNWKnOpBnoohStQ7kImXriBvKur4
	 +CgNo8cCrol4YgEpFuo9u4XhG1QFNalxckO1xVtAtIogA59jHxqk44BIWRMwc9a/Ta
	 OTlow/ye+m+20rkUwMoWwPoIKYXUeAsI5Awc3k0/zFxIhSonNE4g8KWaW9pA90Nkwa
	 6zvIi/uPVKaYA==
Mime-Version: 1.0
Date: Mon, 10 Aug 2026 08:30:11 +0200
Message-Id: <DKL1W2D3OJ5J.2VW3B1VPH5LHF@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: allow force unlocking via DT property
Cc: "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Chen Minqiang" <ptpt52@gmail.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <2026-08-05171214.2934-1-ptpt52@gmail.com>
 <20260806112418.14695-1-ptpt52@gmail.com>
In-Reply-To: <20260806112418.14695-1-ptpt52@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2616109741758266447=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2616109741758266447==
Content-Type: multipart/signed;
 boundary=0a6fe17bf19ad5a12e68b66b0165d1da9fb2afb6bb7e78bdaf4e15f2febd;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--0a6fe17bf19ad5a12e68b66b0165d1da9fb2afb6bb7e78bdaf4e15f2febd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 6, 2026 at 1:24 PM CEST, Chen Minqiang wrote:
> Hi,
>
> Thank you for your valuable insight!
>
> You are completely right that for unlisted/generic chips that feature a 4=
-bit
> BP layout (BP3 at bit 5 or bit 6) or a CMP (Complement Protect) bit in SR=
2,
> spi_nor_unlock() won't clear those extra bits without the corresponding f=
lags
> (SNOR_F_HAS_4BIT_BP / SNOR_F_HAS_SR2_CMP_BIT6) set by the ID database or =
SFDP.


Is this AI assisted?

> However, in practice:
> 1. The vast majority of 3.3V/1.8V generic SPI NOR flashes (e.g. 4MB-16MB =
chips
>    commonly found in vendor devices like Tenda AX12L Pro) use the standar=
d
>    3-bit BP (BP0-BP2, SR1 bits 2..4).
> 2. The current main issue is that even for these standard 3-bit BP chips,=
 the
>    kernel currently skips spi_nor_try_unlock_all() completely at boot tim=
e if
>    CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE is set (for non-volatile ch=
ips)
>    or if SNOR_F_HAS_LOCK is not set in chip flags. As a result, status re=
gisters
>    locked by factory bootloaders are never cleared.
>
> `linux,force-sr-unlock` serves as a pragmatic DT override to force the un=
lock
> attempt at probe time.
>
> To address your point regarding 4-bit BP and CMP bits for unlisted chips,=
 we
> have two potential options:
>
> Option A (Current Best-Effort):
> Keep the patch as-is, treating `linux,force-sr-unlock` as a best-effort D=
T
> trigger to invoke standard spi_nor_unlock(). It successfully unlocks the =
vast
> majority of standard 3-bit BP generic chips. For rare unlisted chips with=
 4-bit
> BP or CMP bits, explicit entries can still be added to the ID database wh=
en
> discovered.
>
> Option B (Aggressive Force-Clear):
> When `linux,force-sr-unlock` is present in DT, enhance spi_nor_try_unlock=
_all()
> to perform a broader clear operation on SR1 (masking bits 2..6 to clear B=
P0-BP3/TB)
> and SR2 (clearing CMP bit if SR2 is readable).
>
> Which approach would you prefer? I'd be happy to revise the patch based o=
n your
> guidance.

This patch won't fly as is. You're missing the dt-bindings patch
(which I doubt will be accepted) and I really don't like this
approach. First, why would you unlock a flash automatically? I've
worked hard, to get rid of that anti-feature. Second, what if you
still loose the flash "lottery"?

-michael

--0a6fe17bf19ad5a12e68b66b0165d1da9fb2afb6bb7e78bdaf4e15f2febd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCanlv9BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/juFQF/dXsh8cSiNnGne85mZGpo+2JHGY8HXFhH
uwWOpJgBxTcdNxegYfswC6XtkDhYH81iAX9JH42fJujdSujtuqXdTL48JVlIc7cm
jllnaZj/VHKwOJSbycKZZV9Txkm86eAKJIw=
=S1Jn
-----END PGP SIGNATURE-----

--0a6fe17bf19ad5a12e68b66b0165d1da9fb2afb6bb7e78bdaf4e15f2febd--


--===============2616109741758266447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2616109741758266447==--

