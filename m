Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E49C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Mar 2022 09:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBiTQEacCvpYV+oSAqcF0fRRunAPkknxzu9O10akgTg=; b=Gnin/7q7m13iEGm4kgoJSSRc1p
	crmqup4YDddoqYW58nJC2/lYuzDO1m544Euk9cJT0yspt8gIPTbFoMIuETPuP4qBUjE7GGI6c36kw
	DBtUJRPtU7q9AQkgKFFYI2GfPYelNxdxkBPvGbQU7IbfCZkbjT1KkMhh0Q0JNJoTEN8GRMHka79TF
	iV3BzvxrE2f163v8uM5Nv+JizdZC2ReaTYQ6fSUGrtwFh4X61E1VmECqhawfPUK22Cokt86u1uyLY
	uT5dBo1CoWm3/Tzqe3oWGix4XtbEAGOL5lBlDnOVLWcMJVE6dWyUQIw4cFWp2SqY/+SZXjHUXHq3f
	xwqahnMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ8ac-00Bjjd-3i; Tue, 29 Mar 2022 09:56:38 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ8aX-00Bjhc-Nh
 for linux-mtd@lists.infradead.org; Tue, 29 Mar 2022 09:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=pJFbieYuMliDkorM/V/PDbhfFVJI
 4OfwO+V1QhjgIjI=; b=FTCfDTMel3Y0xfBFes0gT9fT1cbL485/LVqU1dPzzEIX
 21iJL573t/oUpScLaRVSknihh7GZNAUreCGodX9U1P44S6Qv/CS4JWKX20C+Gsyr
 cdLnHadYSxGaOn6NzDhGY9/0wjy+kn567cy+XHOcT/rhhfoeHF8gsADLM6wPIVc=
Received: (qmail 1736111 invoked from network); 29 Mar 2022 11:56:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 29 Mar 2022 11:56:26 +0200
X-UD-Smtp-Session: l3s3148p1@yf0ycVjbXKggAQnoAFHmAKNSQL+AeJes
Date: Tue, 29 Mar 2022 11:56:26 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dung Nguyen <dung.nguyen.zy@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Mark Brown <broonie@kernel.org>, linux-renesas-soc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] memory: renesas-rpc-if: Fix HF/OSPI data transfer in
 Manual mode
Message-ID: <YkLXyoHnB3EucLnA@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dung Nguyen <dung.nguyen.zy@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Mark Brown <broonie@kernel.org>, linux-renesas-soc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <ad6ef2af754c8163f825d3a199d64f910d63f802.1648545212.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <ad6ef2af754c8163f825d3a199d64f910d63f802.1648545212.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_025634_089718_A13CE60C 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7379446056164762089=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7379446056164762089==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1HwUNj8StJmyV25U"
Content-Disposition: inline


--1HwUNj8StJmyV25U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

thank you for this update!

>   - Update comments to match changed code,
>   - Add explicit {read,write}l() for the 4/8 byte case, to increase
>     readability,
>   - Remove redundant break statements,

I really like these changes and have nothing more to add:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I also tested writing on R-Car V3U and V3M, so:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Happy hacking,

   Wolfram


--1HwUNj8StJmyV25U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJC18YACgkQFA3kzBSg
KbZIQRAAkuzVjLW2JAhysnb/w5LhrCW28JB4+nAMveqOktOY8nICtFIKcYMBzKPz
8YPcWrsZw5vxhoO9U/QJLHGvqu1m2jcgVB5sQmHZK82PhBgHAWDH3bv01NCpau+C
6FQdyfi9UO1BJmsezDi/gBpLwSuQDGdWSdVZ8C6NCUUxjsZwqCmzahupWSCgzgHN
ZqI821Tl3L5P7ynMtgZ0C66ATZ62tmtLlG/Iby21e6VeEnIvrdu15G1v9GeqFScY
MQg89w38h15ZkU/nKOIuULw4ZwGqdKpFrTFG/GsUaiG8/qkRpqE99IMouIqO2svQ
aGqGDT8JCx1NE92uB357nAkgjywo2q3cZqFEH2brG7GREVUfhzrP2d4eJqnYDWbB
lrjiYPMgaMtDLjlW0RqcbETFQGQDVlVqHgU3dGBmSGzHm2R1hanTAuoxwyNUTtVv
3WxwDo91OP4RjS5QyY/6M2VE9nSyOSEY2XVB8pjw92OUoovU7CONwfIVgLm5FOcZ
m0RBpwRWXgdU9P/+11OfvDJmVaREcMK/hi0OVvvi52Ynebq35JfHtsNUAkynCwM4
1/81dieewJoPzABVqtuqzbSIktbaXFGCT1+kmaj+aRn1ywhoWKldmMGIm8lXKuvm
rZCYovg8BEKzTx2oQjxn25byetZGGRCIcbSWu1i3CEB65piiFFU=
=USGZ
-----END PGP SIGNATURE-----

--1HwUNj8StJmyV25U--


--===============7379446056164762089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7379446056164762089==--

