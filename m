Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DF2C3DA4A
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Aug 2024 14:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeTkDrtnM9N+fGulHoCJSx69TrmOi82MF1jKkO4Qt+k=; b=M+Dg/VLwe6CdwK43oVH3x/szYR
	8E5kybqrzvvySUBe4Q+1aCO54rEukwaS8uknSWQqOAjRmr3rqx+zHWbjNG9wXe6mOqQgb4+g8Qrll
	Y0C5TYdztmnDK/ttvbqMjEuh+09F3TM9QeSmuY+7oqCOl+EmdvtVAn34RCxy4aHNzfECP/g3F7cLs
	o+jODiYFDpj78pbdSYhIVfpcq4I39QsZdLWTd+XNsYkFIu/P1tCvEHywD+C0vAdItpVE45ea8Nd1r
	l7VWtDwlUc9RNCgVKBgI85Vn9F4V8MKTbhMuKnLypYwRcuoFwHo4q+4aRtrZZOWwRiDLoZ395ROzy
	Fhs25FcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scQvo-0000000BafR-1SVV;
	Fri, 09 Aug 2024 14:49:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scQvm-0000000Baez-0GhH
	for linux-mtd@lists.infradead.org;
	Fri, 09 Aug 2024 14:49:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36BB061262;
	Fri,  9 Aug 2024 14:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E49C4AF0D;
	Fri,  9 Aug 2024 14:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723214964;
	bh=26n09ZIaJtD0l1jyPbXELEN64tF3YdvsFI0WbmrVEqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2JA35G7gH/3s3VRNzS8PKNYunNi9aYQoVFy8XmJ+BwfY5+bQa7LTU3v1QTfEBH3z
	 1t4PxiF8wc0NPzfu0gGcJvmJ5VmEiSi+Iq0iwjl++g93EP98Q0DQrXRG3xN9y0We0I
	 bf1MPn6fHCyPlu0BUjSdcq+Qw5H0nGovMyYEVmjHAFjeUpy1vqOqYvHdhJAMmAniIF
	 d60vrsmjvpbV/gABQG5bJECMEkg2ftFXso1EZx1AWXsGn7jxRGwUm+XHwQufcnGt9f
	 L+r+rgdbLYi/JOksgGbaFh2DYTh7wcwOaJi0qFR0aOr9yNcLD0+IGD4Lc5GF9d75er
	 hwoaAVk4w+VkQ==
Date: Fri, 9 Aug 2024 15:49:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <20240809-smuggler-patrol-067003f0ba9b@spud>
References: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
 <20240808-loongson1-nand-v8-1-c96dea418b41@gmail.com>
 <20240808-backyard-unglue-3cf429ad8da5@spud>
 <CAJhJPsVOTAj9ePzeHkwDX049FKd=9Rs_NjQE2qwQL76GKSC66Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJhJPsVOTAj9ePzeHkwDX049FKd=9Rs_NjQE2qwQL76GKSC66Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_074926_531602_8E791C2E 
X-CRM114-Status: GOOD (  25.28  )
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
Content-Type: multipart/mixed; boundary="===============4857348491622911341=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4857348491622911341==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SxlQ+XhTGBIdU8Mo"
Content-Disposition: inline


--SxlQ+XhTGBIdU8Mo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2024 at 02:47:53PM +0800, Keguang Zhang wrote:
> On Thu, Aug 8, 2024 at 11:37=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Thu, Aug 08, 2024 at 07:22:19PM +0800, Keguang Zhang via B4 Relay wr=
ote:
> > > From: Keguang Zhang <keguang.zhang@gmail.com>
> > >
> > > Add devicetree binding document for Loongson-1 NAND Controller.
> > >
> > > Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> > > ---
> > > Changes in v8:
> > > - Add a description part.
> > > - Adjust the compatible because the match data for ls1c-nfc differs f=
rom ls1b-nfc.
> > > - Mark 'nand-use-soft-ecc-engine' and 'nand-ecc-algo' as mandatory.
> > > - Delete the superfluous blank lines.
> > >
> > > Changes in v7:
> > > - rename the file to loongson,ls1b-nfc.yaml
> > >
> > > Changes in v6:
> > > - A newly added patch
> > > ---
> > >  .../devicetree/bindings/mtd/loongson,ls1b-nfc.yaml | 75 ++++++++++++=
++++++++++
> > >  1 file changed, 75 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.=
yaml b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
> > > new file mode 100644
> > > index 000000000000..7ce335324a29
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
> >
> > When I first read "nfc" here I thought it was a copy-paste mistake, as
> > "nfc" is a technology of it's own. I think it would make sense to rename
> > to "loongson,ls1b-nand-controller" etc to remove that sort of confusion.
> > These devices might not implement NFC, but what's to say that a future
> > device will not?
> >
> Sorry for the confusion.
> The string "loongson,ls1b-nand-controller" might be too long.

It "might"? Why do you think it is too long?

> May I rename it to "loongson,ls1b-nand"?

Sure.

--SxlQ+XhTGBIdU8Mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrYscAAKCRB4tDGHoIJi
0tPAAPsG15YkPAlg2tUUrN2amO1EFgloq1wSMyBK1Q29C6L50AEA4AVTK9jOQ9Zg
mm2+nrwrqf0WFQT/soeSzKGLISNMVg4=
=zt9F
-----END PGP SIGNATURE-----

--SxlQ+XhTGBIdU8Mo--


--===============4857348491622911341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4857348491622911341==--

