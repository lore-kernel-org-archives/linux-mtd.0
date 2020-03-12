Return-Path: <SRS0=7qHi=45=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5801C10DCE
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2020 20:50:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA25F206BE
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2020 20:50:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OxjnPUsb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KU1CQP+9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA25F206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JEMJMrQAs7GDe6dlWN2Wo+xNqKxrLKva0KGwqHpz30M=; b=OxjnPUsbMsgDFjpN8chuJ6wfD
	NRupB8cCQmEiOg/s80MigaI8L2azGvejTkhYSpmRqA02+CbCgF6DPfq5vRfoSwRIKxsGxSvH6zBUb
	Iv7M/nQplUNdjQw9nwGtEZgbsFDPoBRnEPphpHPy1loSS1KXRNNu1THKvkGfxzXyQhhIrWYfoI9oV
	DcaVInu/JcvpJGJGrE7awdJVeSHEpVH8MHDPTquLzNIMoMWmwqnBD1wqhGypNVU9eUMQHUatMZygz
	WGxbug9rTeQSGLlANv21YZdAW2IW0nh4sUxCsloOH6/6iqXRiIvwKVU4syeYmZz/a3p9b75nrJABI
	4UfF0Cw7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCUmv-0005fH-HS; Thu, 12 Mar 2020 20:50:41 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1] helo=ozlabs.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCUms-0005ep-My
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2020 20:50:40 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48dgvY3QpZz9sQx;
 Fri, 13 Mar 2020 07:50:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1584046234;
 bh=SGRxPVmXpEYec2aJRsUxfn2RBJDj3T78Oi5OpooClzw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KU1CQP+9+y8pOD47zzXHw03Qxd44gbHHwLd1WnianV1PRVBPu9PNZK0lZAcQmCspu
 2AVjFvyVw8D6Ri4BrMaTVw7StVoWNat5GuQJFnWZO6b4QndxmXXyvqLiU8Wf3n0f8h
 w29Z0BwjgHDXYeQpBXY5b+mbrgWWQr/6sNEuWtXHOSBze/15e0vs/dyy/XLpmJNbw7
 FzoWQJyRqWkR2LdLgz9eAM0yDI6tmnmA65ehb6/Ey33Tx1jsIUNNruMVX0e8ZFARWQ
 t7WVvnegOurFpJS6qgo4xE9nXVQ6JQoS1M7KClZNhOeFpKJ6zsHvQlXQEM5ZN7NHQH
 p+7XGIoIuwXVw==
Date: Fri, 13 Mar 2020 07:50:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] MAINTAINERS: Add staging branch for HyperBus
Message-ID: <20200313075030.713501a2@canb.auug.org.au>
In-Reply-To: <ec8123f1-b855-6c03-8110-0e22eb42152a@ti.com>
References: <20200227051212.15496-1-vigneshr@ti.com>
 <ec8123f1-b855-6c03-8110-0e22eb42152a@ti.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_135038_907221_E4568EB7 
X-CRM114-Status: GOOD (  15.69  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: multipart/mixed; boundary="===============1219102663147773457=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1219102663147773457==
Content-Type: multipart/signed; boundary="Sig_/Blcm2tRGpKw3bKdwva/xUJ8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Blcm2tRGpKw3bKdwva/xUJ8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vignesh,

On Thu, 12 Mar 2020 14:41:19 +0530 Vignesh Raghavendra <vigneshr@ti.com> wr=
ote:
>
> On 27/02/20 10:42 am, Vignesh Raghavendra wrote:
> > Update HyperBus entry with branch used to stage patches under
> > mtd.git. Also, add mailing list and patchwork queue information.
> >=20
> > Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> > Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> > v2: Update commit desc to include all changes being made
> >=20
> >  MAINTAINERS | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a0d86490c2c6..4b9930263dc7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7769,6 +7769,9 @@ F:	Documentation/ABI/testing/debugfs-hyperv
> > =20
> >  HYPERBUS SUPPORT
> >  M:	Vignesh Raghavendra <vigneshr@ti.com>
> > +L:	linux-mtd@lists.infradead.org
> > +Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
> > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git cfi=
/next =20
>=20
>=20
> Could you add CFI branch of mtd.git to linux-next:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
>=20
> branch: cfi/next
>=20
> I am planning to use this branch to stage patches for CFI flashes and
> for newly added HyperBus framework.
>=20
> Miquel has already applied this patch to mtd/next

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/Blcm2tRGpKw3bKdwva/xUJ8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5qoJYACgkQAVBC80lX
0GyRdwf+ObMm/IRmSCI3gK74VN5/xMYEEhc5Cq+bswZ+Jv0vV7bXE+8swkvK1j9V
eKslEggXCrzyv+dWTYOgiGCNuGZd/rmkVg4bBQBT9AALzYRNbUHSh+yOG+JfuKvP
Kn/+oD+0u5CVkor4tHF6OX7z48R0MmE+D5fInXLA3D8ayQeuJ91VKSuJFGIxKXLq
41iEhXNlGFB01v7YTXj1hXOWlyGlSXtVpTC+zEeBdkogIDJVZpx3QDj8lK5PCGnO
3m4sJiKti1S75EhNoNwyVLafxA5EKPJT5h7+gTUAZQiCSmRsxlsKMs/1uo2G9gaB
cTxtqieoUQ6JhrKJmX3WbFfozDlgfw==
=CO6s
-----END PGP SIGNATURE-----

--Sig_/Blcm2tRGpKw3bKdwva/xUJ8--


--===============1219102663147773457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1219102663147773457==--

