Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD1D606A327
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 23:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NDRLGz0d;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJbekRne
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l7s4JzWR8ZiwvQ7W/LJcv9Fc76C2WbwjwQVklQXGPZg=; b=NDRLGz0dsfgbbzyEIldAkIB5Ph
	Ei5fZTbIQh8XFRkMzSDnjB0lFtD/dzgYyVeSzplocLma5xEyzbz/sSwN2X601+mavZ06oh8Yw0ffB
	2bXar5ThrJ/vbVL1rsGlrG7pTJzeFVMuvDBHAaavXZxTooc1+W1Wrg/qZr4+/io2y3BGeC/5WS+zV
	+IjN6SkTCoWuFLmWNstsT+JcYmLwEjk4JDt/1o8X7nioGFmOp58fMkGRdO8NVn536jBL2nCQZmKGy
	xOr9zaqHYSGBb5bBFmVwn3/VKJoWDnJ0wUMjhi/+0iFnlXiPrGRxPn1fmC3usy4ry3PxL0QJO8OBN
	d3Ldq2Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvcA-00000005Ghr-0gkG;
	Tue, 10 Nov 2026 23:50:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvc9-00000005Ghg-31ZU
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 23:50:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BA2641960;
	Tue, 10 Nov 2026 23:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57FFD1F0093C;
	Tue, 10 Nov 2026 23:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794354657;
	bh=yTTKJg8z68gV29d9x1cVRTEkXytGiCw1QNZtUBLYJLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nJbekRneS88t8CG5CAQ7Wts5c9M/sx9MAHaUYsqaqMd3E1jCxFtp4ro3gX5ZCQ8rw
	 ad06ETOBmFlfgaHLoyCxopwtyQbIW67vSLUf2V8tObtSij+z6BCLGrkWEra8Aqqa43
	 uK7XlBt51x7oiYOIQ3ge1z5/47c7nmezr/fvTG5SsQBpR/j3JtzPaB3P3zlf8n3V+O
	 UlxDgLJ8c95ZfS/gOeA/ierbAmiW+gfNYoWPWpGE3D31wyXneJ4RQbtbSWdu2g2qWC
	 7HO+CYohaTqY3NlyCt33oGEg3RElAPAj0XUntPe5XzMX3b7Tt7IZbNYqi5u+K4GT1t
	 nTTlVoRP31blA==
Date: Tue, 10 Nov 2026 23:50:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
	linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] spi: spi-qpic-snand: use generic code from the
 'qpic_common' module
Message-ID: <6c4dff3c-dd56-4cbe-b107-4db378c1b569@sirena.org.uk>
References: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
 <25dfb787-27ce-4d47-a619-e9600f4f7902@sirena.org.uk>
 <f75c615e-0a92-4775-803a-8bc2aa3b4261@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <f75c615e-0a92-4775-803a-8bc2aa3b4261@gmail.com>
X-Cookie: You can't take damsel here now.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1363626225605306501=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============1363626225605306501==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZLBFIbqjBO6LCOGP"
Content-Disposition: inline


--ZLBFIbqjBO6LCOGP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:18:11PM +0100, Gabor Juhos wrote:
> 2026. 11. 10. 19:46 keltez=E9ssel, Mark Brown =EDrta:
> > On Mon, Nov 09, 2026 at 08:41:01PM +0100, Gabor Juhos wrote:

> >> base-commit: 4a8faaea975be15cb636646c0d4c6ff1c2110baa
> >> change-id: 20261028-qpic-snand-use-common-functions-12b18fc7a1e5
> >> prerequisite-change-id: 20260922-qpic-snand-fix-singlecw-readloc-c4c89=
b4369f5:v2
> >> prerequisite-patch-id: 7f8a48bccb2e3c8de950bbddacfefe052cea50b8

> > I can't apply this to anything, please resend when it can be applied.

> I assumed that adding the prerequisite-change-id is enough to claim the
> dependency. I will state the dependencies explicitly next time.

My whole process for tracking and reviewing things depends on actually
being able to apply them, and even with things tracked it's far too much
work to follow random stacks of dependencies.  It's getting frustrating
how common it is becoming for people to send out things that depend on
multi-level stacks of random in flight patches.

--ZLBFIbqjBO6LCOGP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzrdsACgkQJNaLcl1U
h9C4Lgf/VFP38ay/rJdk4sWWrVuzUuXjVYS0FbWoEXavt5Ryu181yPQGySsXEFP2
f+1SszvdLD4rq7DPDnegGJGqaOaTEpNBaaYkMywO7yLLBRmmmj7BUMRP8M3fczJD
uGhmJr7/Iv5bs6D/bVFns8Yrq6UiZLLdiSbozaPFbpq5BkMSYsWfotCOQSoUpCof
Ek58XwfbD8As8vxbeIZ6G/rkXgLVTXjia/bV2AjQIJoatfjcLBwYbq1qJ5dLYoMd
Q9TDmBEvSv3l/2u2OhAHuHPFo9YvW3t43RiuzBA/vnfFfmLtOAZ0C9q0YtDdiFt2
C5QWVV32PIgTMNBqJ4zmg/ZyXUEWEw==
=ZIB8
-----END PGP SIGNATURE-----

--ZLBFIbqjBO6LCOGP--


--===============1363626225605306501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1363626225605306501==--

