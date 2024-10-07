Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D21CFB443
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2024 06:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkcFHZX4Jcl2qojzZFrch87jCj21nhQU6U/H2yN9FVY=; b=Yam9Ywt2ni+ju3fcbJsBQK7guj
	FCTKRGBRbNgLOWSG20EBIhV+sYUQ1OwNassBm8pQzgHd1fxzLten5VO2y+rdoGOIjat4/afKtpEUp
	WE+O41ek+ESEjXMtpYtGVk/0Bck7RWSYkvx5rO0S5OhyD07NSxLa1oVUwGr6150NjpbGsuRf3yr1f
	pBgpbfnw95XnDX1oXJbJ/5zjXsZdVzMnFtshlFO4Cy0DS35rFMT180FuJEhXbId4UZ7OZJ4SY7Czc
	eYcHYN3CyhV09tw0it5HxJziZg5HXypS8VAthEQkmwSYEx5T5VdeaSxjVbunrlolesn+xjQfOc/YU
	W2TRV1AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxhJk-00000001RtK-1L7R;
	Mon, 07 Oct 2024 06:34:04 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxhFd-00000001QJz-2opz
	for linux-mtd@lists.infradead.org;
	Mon, 07 Oct 2024 06:29:51 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5398e3f43f3so4577046e87.2
        for <linux-mtd@lists.infradead.org>; Sun, 06 Oct 2024 23:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728282588; x=1728887388; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=osnv1yxxdQVp7h+Sp8U/YDqEPinZ/nOSgLBWQfew/P4=;
        b=S6fDKE2/3+uBstYjknkhwjl9wZ6+FE5To9kUC3vhWXVrJ28nCB7nFSftCll1BVWNxa
         eeQsA76hKkx18lmlO6xpP/aP+w/GM59/8i0i43+YrlzEnXwg0Nyn/4mFTgA0nqpAUgen
         aj4CNPESkXaugMkWh1DTShaYc0XX7TwVPj7SuQsnWO+zxxlIgDs6+/3X7vi1bM7+PqqG
         KqnE4jwgaOaN4WGGZMuBedmXXwLfbJVUduR4b175ZwPBiJrvW8ElISiE3FJCktWpQBVO
         4FOrDVlxk5LQKz5poXFsbGiT4VufnGhrAqlgRvc4WSTZCWQe5WRO9B6Us3PS2iCvB7XV
         Z2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728282588; x=1728887388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osnv1yxxdQVp7h+Sp8U/YDqEPinZ/nOSgLBWQfew/P4=;
        b=O7ZBJvBNGLZC+EoRbBlq/DlS71d/e/vWgGWB3Dwr625qU3mjeypk42aZr5OzB+N8dy
         miNZAb+YgU25JP1FBsPlung9CjXduROk/7QDN9WLBie5TOUxhlB9iDHrYqX5atPQ+lyf
         IapsURT9mxRZx2uMBikQ5nOtaMhdQvuOdjTeJ8k1d5MNVjujklKvjNxXuRiM7wwEOTvE
         fxzK/yqNW3oZgL2ai+hqiW5QoVvYxNBZhyes0vppz/GMp9ZWA5z5nCbdMiVCHKxPfJdi
         PrIqeFEGChqcRlKInK7tZxI35lPhFw7FoXxT02K1qger5EODsSugwjuy0zZaJ1vZ/Lfh
         Mn5A==
X-Forwarded-Encrypted: i=1; AJvYcCWhWK0haUB0AswjaqnsVWSEhiedBFwfRgT/K1aTgu+yKj5k2EWWLWjKX2/4Bcx73Vlj0llhjYTouJQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YybSDliMipUAn5KhiE5k07txx6mv/mx6WOq58x2qcyJ1mzX/7vJ
	WBp+s2oEaJwCAZLYdkow5+3ytWd3iPXHydWG0xRzzNG2kPpIPtxl
X-Google-Smtp-Source: AGHT+IE7r1R1O5OQdAi7uxj+OWqTtNW67GaV9bYf+ItjaWIPFYGCtZngf3yO0zh1gSmgYJpIbHQ13w==
X-Received: by 2002:a05:6512:3d93:b0:52c:e326:f4cf with SMTP id 2adb3069b0e04-539ab84e3a7mr5206892e87.3.1728282587246;
        Sun, 06 Oct 2024 23:29:47 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec1187sm729051e87.32.2024.10.06.23.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 23:29:46 -0700 (PDT)
Date: Mon, 7 Oct 2024 08:29:44 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: mtd: davinci: convert to yaml
Message-ID: <ZwN_2LsLep_mXUgy@gmail.com>
References: <20241006-ondie-v4-0-ff9b9fd9a81d@gmail.com>
 <20241006-ondie-v4-2-ff9b9fd9a81d@gmail.com>
 <deeflg5wd756tkfr6zdta4imuc7ijwl56yclfwiqexlqdq6jsk@5za5g6i7wj6k>
MIME-Version: 1.0
In-Reply-To: <deeflg5wd756tkfr6zdta4imuc7ijwl56yclfwiqexlqdq6jsk@5za5g6i7wj6k>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_232949_789150_11CEE89A 
X-CRM114-Status: GOOD (  16.70  )
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
Content-Type: multipart/mixed; boundary="===============0947296017001721979=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0947296017001721979==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XEOPtyPcjEau4DFa"
Content-Disposition: inline


--XEOPtyPcjEau4DFa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2024 at 08:07:27AM +0200, Krzysztof Kozlowski wrote:
> On Sun, Oct 06, 2024 at 03:05:47PM +0200, Marcus Folkesson wrote:
> > +  ti,davinci-nand-use-bbt:
> > +    type: boolean
> > +    description:
> > +      Use flash based bad block table support. OOB identifier is saved=
 in OOB
> > +      area.
> > +    deprecated: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - ti,davinci-chipselect
> > +
> > +additionalProperties: true
>=20
> That's a final device schema, this cannot be true. Why you are doing
> this entirely different than all other bindings?

=46rom my understanding, additionalProperties is to indicate that the
schema could contain properties that were not explicit listed here but
inherited from e.g. nand-controller.yaml.

Obviously that is not the case.
Could you please give me some guidance?

>=20
> You wrote in changelog, that you "silent the errors". Sorry, but that's
> a no go. You are not suppose to silent them, but FIX THEM.
>=20
>=20
> > +
> > +examples:
> > +  - |
> > +    nand-controller@2000000 {
> > +      compatible =3D "ti,davinci-nand";
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      reg =3D <0 0x02000000>;
>=20
> Keep order like in DTS coding style.
>=20
> Best regards,
> Krzysztof
>=20

Best regards,
Marcus Folkesson

--XEOPtyPcjEau4DFa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmcDf9QACgkQiIBOb1ld
UjK6EhAAuB6a6IgXxYmSKcdGNBGy+OZA+C2kjYHm8eVvYm4lt5AwVuMSacyjAiP+
UnhA8AyF1nEuXvE4aAE8WuwcJWTwQxPbmpHKmU11Xpb4FSyL/d0V75s4ssWvWlm3
PDS3xlUpEQScMBTBILEtUwZs6CNq3bsUJBGTkEmMODMN/Jet1sX7KCTDG5BBHFSL
QHR9bBA13IJTmB0FgghaDm3zAL5H3Kzf4Rk8yaHqGl7upkS3zdN5fonQsGtpexVT
m6EX1zzXFvb2HoV2vKUCLjkfd4/HHYKw3Tc1xSRPIiO9hEy+4j9M71tWF1tEmuuk
xledFWUWZGH6PH8q6aDormFAo8Gd5ejS7xxzLW3FSk11oNMqz/VFwmEu+6K6zDtS
cIj4ngEDhwsQYWsfLO2yT9XiyMYddQhvnpC2aE7POXnNqQeIiJortYBLDBOOpY8L
9U7YzHgGbsnIsDtOb6m1KovJeaqEayh6L2xMlJlCvmSma+mg1XHeH6tB8SA2AIqo
U/PWrufvWM/gyU4yp/IprKPefF0rvtnr74Jgb07g2abQgiWe3gbE3w8F6C3wj1Mc
4i6PmVg05xWk95SkHxeAiaYgugI0BhdMNreiOdUMVO8MonnTAULC1buX1HMLiCYQ
J7N9NKo42gNgf1dQMc41TXcYtj/VizRwsd6WV9pKwnhSrIHy/6w=
=zXUF
-----END PGP SIGNATURE-----

--XEOPtyPcjEau4DFa--


--===============0947296017001721979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0947296017001721979==--

