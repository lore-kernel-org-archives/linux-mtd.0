Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B513CE7B04
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Sep 2023 07:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpwYjhGyjyt8O/1ZlEQeDIwRqy1gouC5w+H+StXUCQ4=; b=4nfTJDELK0BVP9idWiemR1HLDj
	mGql7xGzESNSHfZyiN5y9h5HibNTSVHStEq6TY488LS+t99EV60BpYy63Ss6KZem8YvILSDaTNazp
	6DCfrMjF0d+9ETNJwdkb8ct/3jjYlTfDO1SDaG+WlFRmbuQRYjiH6UnOOmPjmqL+ulngM3KIZEy2/
	OzfQCvNsTzCy2la8fIftxPDfRWFY9UwPH4UH1+esF3QZ/ckqASF3VCN7VyHTAhcyqhqdbAuxmjVi+
	JjiUlyNqygvOyQqHf8wylvolSW9OvLBQ6gv0hYdutwp2JJuDQY8QkDxWPWTinsJWtSSdgoxwTa/tn
	OmAXkzJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qllBB-002Uqo-1e;
	Thu, 28 Sep 2023 07:11:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qllAr-002UnH-2T
	for linux-mtd@bombadil.infradead.org;
	Thu, 28 Sep 2023 07:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Gz38FWoRozMk8ZqhH2Py9rFMLzQbTzA9Bq0tD+78bXY=; b=lJ5XYbxOqLm+Fim7IveZxGltA6
	cDsYBO1WszgGCXspvm6+fiKHBuUZVqqdSoZ17lMjrLtGWiTBUNPppZHffJ3GHqGI2C1wNjdK+kK/c
	9EHOnw+wYRCjffgjScB057SvFJr+cj+QczeC6Z7N781VswskqSmkiIwb/RdvP51gYQ5MJLxCuFOqn
	nUfarQMcsAQNg4uQl31xf4PTGiT2dOXMH9E3vWu9JEMONzBBxYeg7oxLmlH4dKKqcr3YET0J696id
	oPIjv8ZL1WfPd+SrXPJkl+XndoQDpn+JRFnfSnbrM5NTFogmPz2QAi913zyr7Iw6ulp9myFOe8geL
	qZDgKQfQ==;
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qllAk-004o1K-33
	for linux-mtd@lists.infradead.org;
	Thu, 28 Sep 2023 07:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Gz38
	FWoRozMk8ZqhH2Py9rFMLzQbTzA9Bq0tD+78bXY=; b=iSteBfY4PmQYZ/rE9MGE
	Aa7HCszSBZXFnVBkVo1yAovhD+Md4Tww6/SrNRadqqVOku/NKM7Ma5t8Pf0CW3UN
	SlSDE04gl5CDWYyUmRdYDb8fNCMKfsJLMLITu2x7ZukNZP/P4fwC3ygs9NslVZBs
	1kuTKsbf41/pocd09vgLIaII7Vg4/aMuH6i1SXMIinXU/VKI8ucdtCaP+5aCj9Ke
	cRpTBoIa1KDIeGLfeZcgheZGv8UZ8TRk0EO614DOdV4X3MkSryYEbO9uPfSPEYp1
	kTNyZ7SykrGZc/g4Lg3Dw+SSlskYrvydEhWyRDpGDRar5CUDKj9DY5XO5Vj4gMIT
	3w==
Received: (qmail 3367098 invoked from network); 28 Sep 2023 09:10:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2023 09:10:25 +0200
X-UD-Smtp-Session: l3s3148p1@rft/AGYGLOAujntX
Date: Thu, 28 Sep 2023 09:10:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mips@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/6] mtd: parsers: ar7: remove support
Message-ID: <ZRUm4DS3qvRfcPox@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mips@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
References: <20230922061530.3121-1-wsa+renesas@sang-engineering.com>
 <20230922061530.3121-3-wsa+renesas@sang-engineering.com>
 <20230922163903.3f49ea2a@xps-13>
MIME-Version: 1.0
In-Reply-To: <20230922163903.3f49ea2a@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_081057_344126_43849FEE 
X-CRM114-Status: GOOD (  10.28  )
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
Content-Type: multipart/mixed; boundary="===============5426709655489089062=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5426709655489089062==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vh1lYzYZNvhd1Ak5"
Content-Disposition: inline


--vh1lYzYZNvhd1Ak5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'm not sure it is wise to merge defconfig changes through mtd. Would
> you mind sending this change aside to avoid potential conflicts? Each
> patch can live on their own anyway.

I checked pxa_defconfig history. Most commits in the last 7 years were
just removing outdated Kconfig symbols from all kind of subsystems. Like
what we want to do here. I think it is okay to keep it.


--vh1lYzYZNvhd1Ak5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUVJuAACgkQFA3kzBSg
KbYCyBAApP4Bff1yQaLcXDSSDNpNegd4Bl+v8pEZsBfyjf5J2xGfttFWrqWNM2ew
NQ9sR5LIPA38eZEHIxl9UBFaC1npN58b+GU8I1OD/OCYLfSjfYeuUPP7GrnXz2nc
EShRfOA6uELVpAWkf8nlIohp4MBrDvJk5Ut+VfG1xG3HE3Sk0Te6uXF3lgLWEU7r
x2/KT/hRj6uJlk6dDb0JrQqbmCpyP4X7HrGGuVDJ4icTBCAAhBluqoVQXa217vJ3
NAI+Q+/A8FWDJNu/jI+IQR68YxMD2juGlqXVNY+bJ80KtX12IgTDR9NWMYNVtTrf
kwpBLAtYSHnaKD4WdfJcOP/2iARYo/e/WFqG/3f6xtJzmnP9+hqIRCPkHpTo/k9S
GPtpeZnAPLjPHk32zQYV8I5b+XODXIw7C4zBB+XvSnx193A3yPHnMtVfhp7GQItT
BeCBJDnMPIUC33wBpzT7ii7HN07d1Vto1mI90ELU1QK0W/sb/E7hokxEHQNM9/QR
1DLh8m5dZCNRzU25gPnYp7MFbdCzqL8itPi5KwVMvoReFXq5Zl9/XK/VUK/yNTzq
/zpymcbR5+zNZP2wKYdTz6vJBq2mr91isLDleuwccXCLLB2FwZ3/I6E8tAXgiWDq
2rmVDN2m2E6/CFQMPUCYi3edterHoV9t9LESTkiY4zkExhhpQt8=
=Si4u
-----END PGP SIGNATURE-----

--vh1lYzYZNvhd1Ak5--


--===============5426709655489089062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5426709655489089062==--

