Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0D4C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Mar 2022 19:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnkWxfc2FHJUrcRpgKcQXtPW+ZNlmAqTE6qKervsFGg=; b=rc0DNflkT1TrdOFvOKRZQmGdXZ
	Cxm7JslylF0M5ZS/5O1i3JfRiHWxv/fG+ar7aAIQO9KOWRzTZN3zweihhOp93i8saCKoWks4kMiAH
	wVMuXeFLEunL/IQctB/NStTOFRPEdOFzxslsABBLRbInhRz5Ocir/cMYPg+ACzgRXBubI3M2TaCSr
	8C1i/ou+9SyoMr9rw8KDMXgaotbYZ1W23ZmE055Kk5aqfiuxWYJMekPSNgzb2+oQm+W8Kcw40eIeb
	nQId2etGYYBX49JB+Yfe1jBzHYVLdqfQtVBP2rQXPVzFs859Pjsbk+h3pEPll2jyY8G4fLa7ctVnz
	umIhsBVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZHYe-00DLzI-1f; Tue, 29 Mar 2022 19:31:12 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZHYW-00DLy7-Mi
 for linux-mtd@lists.infradead.org; Tue, 29 Mar 2022 19:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=y1ipC1cpa1iw38bXt7kXRu+jOzzA
 8giV9UgB2XeS6Xg=; b=AkM5Bxti/QKKcFqioRrwnyWRcY9movcfshJF2ha9lf5e
 OBbdG8vb4hkenwwWSYu6t6tEKXZlRYl+rNoy9cgwIRL0ctXrL5I64C8RLWN8sFiw
 Swp646l18Optgl2UOPGDJ4hM0cbFm1YirKoYhDnS0n4Btz/7E0lnc23d7lG2gNg=
Received: (qmail 1912088 invoked from network); 29 Mar 2022 21:30:59 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 29 Mar 2022 21:30:59 +0200
X-UD-Smtp-Session: l3s3148p1@xFrCd2DbhuIgAQnoAFHmAKSkhU0Puvxy
Date: Tue, 29 Mar 2022 21:30:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Biju Das <biju.das.jz@bp.renesas.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: hyperbus: rpc-if: Fix RPM imbalance in probe
 error path
Message-ID: <YkNecA5xIWl21LW+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <d196bb5849843993557a9b10f3bd28a752e5e8e0.1648562287.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <d196bb5849843993557a9b10f3bd28a752e5e8e0.1648562287.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_123105_351208_9B8B610C 
X-CRM114-Status: UNSURE (   9.79  )
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
Content-Type: multipart/mixed; boundary="===============8561565615302177332=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8561565615302177332==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ByFni+gSrBaOyIw3"
Content-Disposition: inline


--ByFni+gSrBaOyIw3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 04:00:38PM +0200, Geert Uytterhoeven wrote:
> If rpcif_hw_init() fails, Runtime PM is left enabled.
>=20
> Fixes: b04cc0d912eb80d3 ("memory: renesas-rpc-if: Add support for RZ/G2L")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Good catch!

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ByFni+gSrBaOyIw3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJDXmsACgkQFA3kzBSg
KbaLExAAr5kzeoqpZu30Yv3xsOmLfmACfNFvXT3zAL41CSGIFKFWhGgQTQK10BLq
PxXemL5mOM62X/DkBg1olWr55QqDwUmo2A3gpE2H/WprjHGmQ7N9kvA1DLzWTi++
TMuO+RuTvP7XKWfpX7IumW0vPfRlyRC6sqdys3vKwfYjvBU8ITcsRS0h4+XHeGfX
bRBuGk2SeK5080IoKJvKql21FIYl6Hr8a1pD28m6x3NaYnw6SufQZ9++FoQXSkgn
dAp4ue7zHUSgaG0HPTuYGP9jNKk6K0wui7TQsviJGwLdLDFO4mRDYkwoSWbirzpl
jKirRWrpdLMmHM0LVISmUI8dkV96fM/Hr0L8ZzrRYLCXQMcV+vt1ZwzGjWWLr8DI
XWJrr3DL2+b5I+u1Xw3nxsFGDVhgLz12w9xbZTAm3gPYFCVnG3wSGDXgPNuslJDv
4ML9yToOVBsyMcaw1Z+4dK0jWktQA7bKrNx4KDPLv+CR2mMPLWvOxVs7MImdimYr
GYu/D1IU/K6BUAnFosZDmm85qlnZrrPnXMl/VHI3kRMhWZDzdF29XlmXWNG/gPb8
e+eoTMmACEdg0d6Fhum1OuRnAaYMM2OzVs9QkGFmna3UlXgOvUcIiU2z95yHvx4C
iEXIL7rcvyv651bOeE3bm21pcJWb+sKy/ZmM3LLvkA6ymwf5bxQ=
=jHfi
-----END PGP SIGNATURE-----

--ByFni+gSrBaOyIw3--


--===============8561565615302177332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8561565615302177332==--

