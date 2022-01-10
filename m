Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37717C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jan 2022 12:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAxQKPtLLXbfyxW0/0Z866LRQegmstA5aaw2VanKRJ0=; b=UwbExP4lvdiMbiriJClbm9T00z
	doIMLkV2PJjochHei27U6CtmkI/k+e3t5DgCkEN4dftPCLx+dRaSnKZ/bPNv/toQ5BrOFhL7LZX+4
	aixwRZ+wC+RlHUwCrx0Ee2sLsZ9p5vmp+5uTv1fhDvqRP+imEERmFsrw23Cmd1Uxs1xjssAfuCcl2
	9xxxH8DqXdk4+F054mXJ8gfSxvlAzJxkLoYHaRqQExxmzvj+TgKxOdmwxNIWNREPhD1fktvloCiMG
	ja8tjROoMdDyT0Hitq7cxYxVK+nN4D6+4u9VEuROErdGa5wi5PQIeHVJqI9+st8lW5sbMmx7opGYN
	b+t8Alfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6tcb-00BJtC-Od; Mon, 10 Jan 2022 12:17:57 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6tcY-00BJrl-Ms
 for linux-mtd@lists.infradead.org; Mon, 10 Jan 2022 12:17:56 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.37.181]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MEVBc-1n9dRU3GCg-00Fy68; Mon, 10 Jan 2022 13:17:26 +0100
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <post@lespocky.de>)
 id 1n6tc1-0000yo-EF; Mon, 10 Jan 2022 13:17:22 +0100
Date: Mon, 10 Jan 2022 13:17:16 +0100
From: Alexander Dahl <post@lespocky.de>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <jwboyer@gmail.com>,
 "Riku Voipio (Debian)" <riku.voipio@linaro.org>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,
 "Robbat (Gentoo)" <robbat2@gentoo.org>, embedded@gentoo.org,
 "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Pascal Bellard (SliTaz)" <pascal.bellard@slitaz.org>,
 =?iso-8859-1?Q?Llu=EDs_Batlle_i_Rossell_=28NixOS=29?= <shaba@altlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [Buildroot] [ANNOUNCE] mtd-utils-2.1.4 is released
Message-ID: <20220110121715.GA6032@falbala.internal.home.lespocky.de>
Mail-Followup-To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <jwboyer@gmail.com>,
 "Riku Voipio (Debian)" <riku.voipio@linaro.org>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,
 "Robbat (Gentoo)" <robbat2@gentoo.org>, embedded@gentoo.org,
 "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Pascal Bellard (SliTaz)" <pascal.bellard@slitaz.org>,
 =?iso-8859-1?Q?Llu=EDs_Batlle_i_Rossell_=28NixOS=29?= <shaba@altlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 Richard Weinberger <richard@nod.at>
References: <c31dba4f-42a8-ba48-7df2-b56bf4699a4c@sigma-star.at>
MIME-Version: 1.0
In-Reply-To: <c31dba4f-42a8-ba48-7df2-b56bf4699a4c@sigma-star.at>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scan-Signature: cfc1030892414ad8b9e614439ac53396
X-Provags-ID: V03:K1:2K4C7oUIkOL9cDS8fngW0GAotIjoim3o0J/mZ5Gw224CGGSJW1a
 3bUyEsLpTUjPmI2Ge3eCxTY9jXEY3cMOE0pcHFMeZPjHn8Xb3J2SDkjpbjn5EbpoTpoj5cC
 oeTY4HcHq15z5t/9uoDBQcpH3FsPQVdgYddjSYiUs7+/rRKAIXtc11Cj6KK8lNqKbtWHpse
 yQa+LwerXFgAsxa1UfC8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AOZ5K7DzLVs=:MEKhQQXBZSS/c22gbApuUL
 3zo1mVeaK3upLySMT1yJPLRL95yneegdBhlDann80bsvM8b3ERy1pMjV41Hqe+Gv0xNGvSSka
 2bNM72KuWzc9Sr2qhlu3HXPfbS9keyn3HE28M7AU7/jEJlMJJBsq3aC8lw4ClWxXLeOIVSpVt
 Jw198WD1sTeM0vhsA9wwnXi4olygK8lb8R/kPfbqe9ySrMULRle4/tsWXNqF3nc645dnwMzCn
 jGfZhSGGlrKRHmhvu1BTQ+plavIU9NWJ/9cNIJ2WJZh7JyIX4mv9VA+r2o0YaiYqulVAlTGiq
 jyNUuwia5w+LP2Fd1J6qDkNke6KCUb5w2E9XrGBx1GyhL3kqGQHxQLzoi6TlS4/URiXE3xUfn
 +yWD1ecQWEH1pvBnHOvHO98hOOmDxW2mC+wdZCULLmga41X4z7ruHO00NQSvf57zu5ev7UwvT
 TYesrgFK5FpsZVN9ANB9HLwNvh7O1QpSdQGY4LoV6j4Vc/7xGemyApN8gagnbs8j0Rx16yDF/
 rA3bEJFMOBdPWGROjBbQPFqL4Bihxj1P5zrYVJb4z1GK2+odR7i7nepNPuhJqIvKNyW6PiD7Y
 tZYsqWsoak/xr4stVF6ChRqg5A9tOom9/cDBCLOTNgnESXQSBVZEsbaeqFmWBEycaM45SLN4O
 VxDAJYTq+gaV/6ilkypEx745jOgvhLRXec1ZZznjKgvM5A17CkY2x8bOVdfeuELKD/W0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_041755_095291_E47D53A3 
X-CRM114-Status: GOOD (  13.24  )
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
Content-Type: multipart/mixed; boundary="===============3232812397737847739=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3232812397737847739==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello David,

On Fri, Jan 07, 2022 at 03:24:59AM +0000, David Oberhollenzer wrote:
> mtd-utils-2.1.4 is released.
>=20
> Tarball:               ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.=
1.4.tar.bz2
> Tarball gpg signature: ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.=
1.4.tar.bz2.asc
> Signed git tag:        git://git.infradead.org/mtd-utils.git v2.1.4
>=20
> Alternatively also mirrored here:
>=20
> Tarball:               https://infraroot.at/pub/mtd/mtd-utils-2.1.4.tar.b=
z2
> Tarball gpg signature: https://infraroot.at/pub/mtd/mtd-utils-2.1.4.tar.b=
z2.asc
> Signed git tag:        https://git.infraroot.at/mtd-utils.git v2.1.4

I tried to verify the gpg signature, but I could not find a public
key. At https://keys.openpgp.org/ you only get a not working key:

    gpg: key BCE5DC3C741A02D1: new key but contains no user ID - skipped

I also searched at http://www.linux-mtd.infradead.org/index.html and
could not find a key, could you please point us to a recent version?

Greets
Alex

--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAmHcI8cACgkQNK3NAHIh
XMavFg//UIYGWw6LHjB3Z5KJYe9FKzLHp6NEKdk6pXmeUIuxufVKsfdS7nLPwsFP
2hrli88DJG+ItYUl7bFyROEePNafSlAJiAXTAXoI5G0dCNz8TtnWZl7f9awayowf
d5H+nlL6VeIa1fRE/z7MVIiQimmNYHnF2cCTauHmyaK+F41zOrqnlk9VvVebtCp2
w4yB7RwCTiIRXSrAlaHeS2CRRz/bsUX4MjwL7uED0Z5y3fWRqYhJszju4Zp68JBM
4LaNLmGSKll1Hmjk8FVIG4oHJFgMyZoLxwNA08xbiT8ynk4eXgaIKIRvs0KgKYAJ
gcpnHbEw2TNqOJ/lis79z9wKgvMYKx5335pCnD0BD8acfO9s9v6PvxZkHVczj52Y
xW2OBOcHMwjTw4PzNX0BsM7IAQ0TOL2YGpLkgHGotqQPM8f1EKXa3812FDxYhBCD
4WPHI8hWQABnweSCIRUq8/4AZPUZPL/Ui+PqdAnjmZo2oHT8joCLYyhdxvJO8oB7
at1O1Cdct9nPelGwLVaFMUdJQtxVDgzNqiTAENG92Hu3cREDmJ+dqG1uTnZ6Tb3X
PxNWvvZ7QQU35mLiUqN19ERtOuAYbyNUBWL2pzkQ50d8DCAJBegB2kp7kjvzhLXz
VyWjYr831/bObUkdGBqU0O4EZ1/j4SYM4Hfdl0fxO9xFkq6BxzY=
=eEe8
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--


--===============3232812397737847739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3232812397737847739==--

