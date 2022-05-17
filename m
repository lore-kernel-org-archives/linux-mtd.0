Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCABC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 17 May 2022 12:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9eUQlIxzlKNWVBgw6BJq6owUt4zPV4qjCIuvhiqRP8=; b=WFh5T4KxCDiXkjrH7mZrnGzkY0
	TOGsfklpWq5KBHmBhYFOyXTzy9SLEjoRI9c6IOAueeYyjsmP2A6mIuZBcgGkNAYT4C33AMBvSbl6g
	c8P28BgcoFF9HSihPa7UzRRLnia7Y9Hp5gWzoLIVpZLSqCXzIRza+CvwEQju6RdFeWig8nqqEncLq
	Lp7rJO09x1iymOSIitQYPpoeZn/1vRsFArqO+o/wxhkm0p+KBg8Z4i0MXs45daP0tIChlK1cr6vv1
	gDrWdkhmNci26ZD9XefEYrD7Hl/gIOvZJNjfk0iJnlDA/lTYXaw9HrGeqR51MrcMjdq7TikojB2Ff
	fsaefMxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqw2Z-00DUP0-TR; Tue, 17 May 2022 12:11:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqw2O-00DUMu-0U; Tue, 17 May 2022 12:10:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 831A0611D3;
 Tue, 17 May 2022 12:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A33C34113;
 Tue, 17 May 2022 12:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652789450;
 bh=nHhA4pOzu1gO66uH8rmEjqJYKMiCKmWA2iGxWxEzAh4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EyiFZXZh5Fclcw0wS4f8o+KP7G3ckIgp7jcPSon1mtuibV9m7BrlBTwDkv+km2aSt
 9tHr2WK16Y1cPB+5H57IIMq7tvXs10aXLbZEAiDmPE4GiL1FPQkcPraUjownHlN2ad
 3XuRu/T0La94a1aJNOybBi7hY++FC+t8WzJQAVJCSG3HyvwSMIwzpnhjxPQNHi6YUr
 v/p6YPFq2SHcDdSi1Xq9L5s4W04s1GSQ32eorwaqyJifiFhXp8ce4ZOqcwnV2UZ8o+
 bJVgqW84rfpJg67bEHAOQ3B8CTHbTAdWJbw36LbHgwAePOazYKfmzzdYwn8pONmiWE
 MQE3pDTaeBVuA==
Date: Tue, 17 May 2022 13:10:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, clg@kaod.org,
 andrew@aj.id.au, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, richard@nod.at,
 joel@jms.id.au, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, chin-ting_kuo@aspeedtech.com,
 linux-aspeed@lists.ozlabs.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v7 00/11] spi: spi-mem: Convert Aspeed SMC
 driver to spi-mem
Message-ID: <YoOQxJV2xNfkkwQS@sirena.org.uk>
References: <20220509175616.1089346-1-clg@kaod.org>
 <165272636363.750911.14933122170662994904.b4-ty@kernel.org>
 <20220517110509.2e6xbwot63yl6a3c@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220517110509.2e6xbwot63yl6a3c@ti.com>
X-Cookie: Fats Loves Madelyn.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_051052_130943_612A202C 
X-CRM114-Status: GOOD (  14.94  )
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
Content-Type: multipart/mixed; boundary="===============2634700029599336211=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2634700029599336211==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U/J4X9YllbQQEq3h"
Content-Disposition: inline


--U/J4X9YllbQQEq3h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2022 at 04:35:09PM +0530, Pratyush Yadav wrote:
> On 16/05/22 07:39PM, Mark Brown wrote:
> > On Mon, 9 May 2022 19:56:05 +0200, C=E9dric Le Goater wrote:

> > [08/11] spi: aspeed: Calibrate read timings
> >         commit: eeaec1ea05c0e0f08e04c6844f20cc24a2fcc0f4

> I have repeatedly objected to this patch [0][1][2] and you have=20
> repeatedly decided to not address my objections. I won't spend any more=
=20
> time fighting it. But I will say that you should not expect any=20
> guarantees that SPI NOR or SPI NAND will not break your calibration in=20
> the future if they decide to move the dirmap_create() call around.

You =3D=3D Cedric here.  Sorry, I thought that had been addressed as there
hadn't been anything I'd noticed on the thread for a few versions.  It
does look like there was agreement that there was a problem too :/

--U/J4X9YllbQQEq3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKDkMMACgkQJNaLcl1U
h9AxJgf/RyBtLJoz2CPMw4giFkUWm4H5/IpwJMiB3RCFF9m6e6W5o3GrJzltpG0W
CjYHYKXfSdTnouEbqcVLyvW8MaHISL+CiC0ZIqqp1iNzqs1iE0Ej+oSPQwHA8OcO
DfvyWTyRfmB7+z9YFGRbS+uaGmwwtbJ3t7WtD2o4l28D6Nz1KM2GRaYKAbSrG8UX
hiv41q0rc2uKIMD8wUZJoqvhmGk7Rguo64aYS++ZVxOvE1hwmPq0xqceRYo8nnY8
cGI1QFxoX4kszDYF8ykJ9B5FlsjVpLDvnRxIcTYgh8JdnmUtBlDFphXL825TEkV/
HUGO7UKZIjbQ2mbgXOhFXMSFN520mg==
=Cg54
-----END PGP SIGNATURE-----

--U/J4X9YllbQQEq3h--


--===============2634700029599336211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2634700029599336211==--

