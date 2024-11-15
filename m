Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F00D6DDEA
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2024 08:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Rn04P0VFJpnYJEtXtOj5bMIShKA2K8pB6nGgsO3SXA=; b=OGYl3IuW7P/5i0ZUKCtGNJ92Fh
	P8At2qBMDMXKD4ldNplPNwS1O2Emp3EVyhNbeD3IlyluM8OqWBNErw92TWdAiV2X7wIrU/p/vbiPC
	RBF9uQZvmCUnyqN22EFdZ1Q4xUH9xHWf6UlU2xuaCB2GivNSyrtG+/NR0Zy1tqAxhpxuZ8OWSXV+c
	qPgI722CEoVpT1P9C7CLjn/QunGx7qAtK8mVGQ4TGLUgSsc3AlpN0/TVkyPkTQqjayeQi10zOFuiu
	rf7Rm4AjKYUL9ZCUHZOLGY5qk7C4U5A3jAXbQtDfn926FJv2/W5BNbdC4ALRha++iBhsfS/SOppiw
	nMbJjKUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBs5f-000000026PG-1plv;
	Fri, 15 Nov 2024 08:54:07 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBs4c-000000026C0-3z4e
	for linux-mtd@lists.infradead.org;
	Fri, 15 Nov 2024 08:53:03 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2fb51f39394so15179531fa.2
        for <linux-mtd@lists.infradead.org>; Fri, 15 Nov 2024 00:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731660781; x=1732265581; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iU6eBIp6waOhY6SP64Je5OJAdsoOlzresKnQlFYoS8A=;
        b=S4Gg9ikdG6837ngBaY+COGX4aOb76em4EKOHYBBO/APoWW1RUkTrHHDRMVGU2ZQrEM
         rPSTP0DlkN7MJavbkvJRJdDWDdhNRElaoBiPevsIFmKfT5y6FNW4AjrqdzwZ9LF/8wag
         om0csPnBU8DRU+z5FltJaOnVv1u9N4L9/eEy0dxEozsyENrBJdyArKN5OJGRXXn6t9IV
         ntS/+e7QtK5kgqPWc/ivF9ZPfnzkv6QI5cpAwtWEUHR6vKEHvsFy4ASH5r5QoueyI4Q7
         oBLMR59dOPOHmtf/EP7pVaZqTM3w8zBcd/YlVnlD6e64tsU19bLjfk+RrOMCeZVUB8vB
         uDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731660781; x=1732265581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iU6eBIp6waOhY6SP64Je5OJAdsoOlzresKnQlFYoS8A=;
        b=M9ipXH3qBXePc7T2sOprUOD+dxifm6qsC5E667LTYLY6/l5Wx2f3Gtw6/vrE17uCsP
         KGeLrvd6nuhlCvpTOkiSRzstAzSA8Du2kYdQ2RlEucHozdtuG78ZNv27VEcrfy4XzFMB
         oNecR1joEHp0UeSFbBesau4zlw96tWwzVPiBpPdXG5aGueEcu8g8KmbIuO2+sYPXYzro
         eX2NB/VaLuF4L4j1OG+uHsm4TFHvteDvDNYArtv/a5ToA75yBM5Zl3WhFaAj3Txn3Bjv
         IDQsG1RTZ01A1U95bIowUqVpRXP4dFbWTLSoPoPEI/44jOC6Y+gy0FZJjxNJrXHk66O+
         6Ahg==
X-Gm-Message-State: AOJu0YxE4pvtZalxc2ftBrG/oPNSX2T6tBnAoTnpJIHKadhXZiXsUeSm
	iWogkYNx4eCagynMKP+fCEfCujttMxFRAXjD7VrRfTkx4Sx75+ix
X-Google-Smtp-Source: AGHT+IGLBF3qhVVzM7RshxSuc6/es49n+LJgEE7VoQSuh4kNKt+Ja+wDG4nGENjUfW+XrS+fGjH+kg==
X-Received: by 2002:a2e:be93:0:b0:2fb:5ac6:90f0 with SMTP id 38308e7fff4ca-2ff609a8cbbmr11354861fa.34.1731660780276;
        Fri, 15 Nov 2024 00:53:00 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff597a0650sm4838791fa.51.2024.11.15.00.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 00:52:58 -0800 (PST)
Date: Fri, 15 Nov 2024 09:52:55 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/2] mtd: nand: davinci: add support for on-die ECC
 engine type
Message-ID: <ZzcL53TmSOwTuIFM@gmail.com>
References: <20241107-ondie-v7-0-98829fc8a958@gmail.com>
 <20241107-ondie-v7-1-98829fc8a958@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241107-ondie-v7-1-98829fc8a958@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_005302_984183_913FD97A 
X-CRM114-Status: GOOD (  12.03  )
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
Content-Type: multipart/mixed; boundary="===============5423346972799368158=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5423346972799368158==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h1/h1bN/JLK5O4bQ"
Content-Disposition: inline


--h1/h1bN/JLK5O4bQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2024 at 02:47:07PM +0100, Marcus Folkesson wrote:
> Some chips, e.g. Micron MT29F1G08ABBFAH4, has a mandatory on-die ECC.
> Add "on-die" as ECC engine type in order to be compatible with those.
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Can someone please take a look at this patch?

Thanks,
Marcus Folkesson

--h1/h1bN/JLK5O4bQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmc3C+IACgkQiIBOb1ld
UjLVIA/9G82izGoDipxNJ2R/Qw3k3V+JB+WnT4Hf4XnW3qpuQZ4n7o7FndyQhg1t
Z6i7neMMsPhbxUwq2FGZWmlEfX9novuQIoSFS7t40uqClyPYfr+yjNknoEtZ4N3g
xbCL14+vPzU9dNqiJxAwwpcAn/xvfPSbb4P5rPmqObKCNwm2TjrR+CAd3B9MeTLH
MpTGyZMVyv3Z6xFMXChHhPxGZRMtTG/KDt1QIUZnqJ0vj8d1Z3ctpYhh+o1klTtI
0jBrF8GxNV77WAOBpYFg7PhVqToBAbOJfkOSB+uQVgKWpNVA1lYHWRM9VUwBepAv
0WY8cpQp4uf5ZLn7oUUWsHy0/eIK90b822hgneXNgdNk6i1F/PxWP2FccqW5VESi
rAJpU6P89nUlYkbiyorE3bkK2t04yTnpk0dNgvvBhLYncPdqy94PpWSw8olNtVAV
Snqg6iiRQ18oXmsXFGAbCGXYaSx7F8GcGRYi24G0MSAFDXa5deuS9cjYAwJAmclw
PYio87RbVtnSyrj0U07ylJ5gxpD0H4/aXROU7jwzJ8upUrDYl4iXIjjzmY63wspF
SEJrOjZdLSWtnXoskB18RU8isFrY2uYK/8b5gH+zKNyGiK/VUNv1AT86B3OlKl0N
O3CuyYPWzOVlGi991nM9j0JqEzt+FmUveQWKHNgAQYkYSsrCzwk=
=oDRL
-----END PGP SIGNATURE-----

--h1/h1bN/JLK5O4bQ--


--===============5423346972799368158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5423346972799368158==--

