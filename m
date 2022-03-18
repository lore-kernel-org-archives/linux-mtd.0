Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FBEC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Mar 2022 10:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HQv+fizNyEU76A4B+LKPXs/3Vw+QQOHzjrmcjY/8+M=; b=rcIVIbYf0oRmttJTaUanClGZS3
	0KIhxA8eabq4kswWzet/mCdqL0s7hRPa+3jGKkYOtj7zZrcVCzsK0DIvgAWhxJcuh/0btYS1iTJop
	x2MI43U41ZS+oLOEt2jwPNMrr35sgeUX50rv035ryBRnK6m2ThUYvQDIp55E7Yk7G+xgEUNG+0d2a
	WvtBVcWErkOWLkaJBrogpJYsyKOrPd4qe8/99SIWn5f1KLK9ArDu8GEUbbp99xonkjqiNCX63AKS8
	qoQUl2FzJnAtWDSbNFpzzQrNmwTiemVH/BfvIa6VMMKx/CPibodHQQh7is1CyQsJh0L34Rsq4xxM6
	6DLIANxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV9ci-0016R4-6q; Fri, 18 Mar 2022 10:14:20 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV9ce-0016P6-Ay
 for linux-mtd@lists.infradead.org; Fri, 18 Mar 2022 10:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=C36zEMNSdev/DAu0BCtj7AW7JfU0
 pw9J2U3bRNfcxa0=; b=xAm+A5eMID7H7nDHXTCWlD3uMBiSd/9+beKehSe9u6Lj
 ty8yB+DR8HWCUtEV2PD9RM/FWaQXKmQmv2osR1SbwLfReNUwOj1cyMyOsgn7wPi8
 xsXFSyU7gSuw/c1TgQyX+JY6xVrLo8fpxH6HVpFwu60mVw54lhvoDK3a5d+dIhQ=
Received: (qmail 3854432 invoked from network); 18 Mar 2022 11:14:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 18 Mar 2022 11:14:06 +0100
X-UD-Smtp-Session: l3s3148p1@FwEaaHvahhBZD+8H
Date: Fri, 18 Mar 2022 11:14:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dung Nguyen <dung.nguyen.zy@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Mark Brown <broonie@kernel.org>, linux-renesas-soc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] memory: renesas-rpc-if: Fix HF/OSPI data transfer in
 Manual mode
Message-ID: <YjRbbbn9U9bff48m@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dung Nguyen <dung.nguyen.zy@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Mark Brown <broonie@kernel.org>, linux-renesas-soc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <b409ea3fae4a6778fd6b44815ad17c9e8e10df87.1647512831.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <b409ea3fae4a6778fd6b44815ad17c9e8e10df87.1647512831.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_031416_997362_A592B205 
X-CRM114-Status: GOOD (  16.34  )
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
Content-Type: multipart/mixed; boundary="===============1480403358201278089=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1480403358201278089==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OtcT9K0vzTCh0l+F"
Content-Disposition: inline


--OtcT9K0vzTCh0l+F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

thank you for the patch!

> Lightly (read-only) tested on:
>   - Salvator-XS with R-Car M3-W ES1.0 with HyperFLASH,
>   - Falcon with R-Car V3U ES1.0 with QSPI.

I (also lightly) tested writing on the V3U and it seems to still work,
even with the problematic cases we needed to fix earlier.

>       Note: Alternatively, rpcif_manual_xfer() could bypass regmap and
>       use {read,write}[bwl]() directly, cfr. commit 0d37f69cacb33435
>       ("memory: renesas-rpc-if: Correct QSPI data transfer in Manual
>       mode") in the BSP.

As discuseed via IRC, I don't like bypassing regmap. I prefer your
solution here.

> @@ -171,18 +171,32 @@ static int rpcif_reg_read(void *context, unsigned int reg, unsigned int *val)

Before this function is a comment which needs to be updated (away from
SMENR_SPIDE to xfer_size).

> +		switch (rpc->xfer_size) {
> +		case 1:
>  			*val = readb(rpc->base + reg);
>  			return 0;
> -		} else if (spide == 0xC) {
> +
> +		case 2:
>  			*val = readw(rpc->base + reg);
>  			return 0;
> -		} else if (spide != 0xF) {
> +
> +		case 4:
> +		case 8:

I think it is more readable to add here:

  			*val = readl(rpc->base + reg);
  			return 0;

> +			break;

... and remove this break ...


> +
> +		default:
>  			return -EILSEQ;
>  		}
> +		break;

... and this one. Same for the write function. I am not strict on this
one, but I think this make following the logic easier.

Rest looks good. I like the additional checks!

All the best,

   Wolfram


--OtcT9K0vzTCh0l+F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI0W2kACgkQFA3kzBSg
KbYjPBAAnH/w2JDoX3xlZOOeiOYsVAWlR7R19tb/2I8echT/IqHjega4sm1hq5bj
KWyrKP5f9aPR/GpFTSDIA1OByx/xQtqkjdCQYH2uMA3Svpc4j2tPb99m2irc6N35
PO1XXiHoszB7t7WQlVbgovRo1eqkMCGaPOuNjHS2mtQe40HTEG4/i9j5MSjPmD7H
vhXOth7tqgy30UTyTUkTvUAdaeRY5NBwN0IMqLmDPLs53YSbmiBD2NXYntBfJtNw
la7yyHCF2YU9cuvcES21D1nFLZx6BQrkqTXtkz0UYYz/RDAlX8P7IOE31Mxr6ChW
v4ni0aqD4NunTnHAZvft2noaXQ9uq74kYiFVpEbpKYox5ZfF1gpY1yXZOOKkxYZu
ISAMdLE9CPZJapvvqEsOADIcM81YPCwsUqa0Ui6gKN/mfo/aJ6B/zOXiLf2K10Gr
V2MLlLcPrA3AiHFc1KTJa/ANRITAlOuNxVhZF09enaTSr5FED+Yu7thW8s1WiMSu
QMH+NIxfKpY8aIAnOeMVQ62PefIeyk+wWX/mRA/1WzxTmMdNk6QP9uEsQPgRs1yC
vD9HxE8zEqwnpbdUeGlpzC51CGuTwctTGot/nfiA97oeQSAVxLi3JAWAApZRZ/mn
Zj30/lWOeAH8vBGhBeMmLfCX1B8bKX+2W683pyr4cHDKFo7TXT4=
=7DDp
-----END PGP SIGNATURE-----

--OtcT9K0vzTCh0l+F--


--===============1480403358201278089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1480403358201278089==--

