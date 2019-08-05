Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E13EC0650F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 11:13:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 322AB2075B
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 11:13:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AFeMwOZJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="NgjEVd/0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 322AB2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j/bVFa0kyYk/GGHbLMoCiY/RsBsWav6nwmgN+7eUnhQ=; b=AFeMwOZJRCn7Ohtx9xHnY7jfc
	kZfKxpGiFNfGlGKN3r8pr9jz65qtdouTxDlrdwnhXcD5xzFohKUd9C4d8uNX6xLGQTa+Za3/rTnTX
	3m+LkYlovN+rE3JDJwt6G3tK9JR/R4o77Frm2VQHLY5kKcDDOp3CZym6hDHfxBuPP9YJEvBzRg9hF
	SYiOnP0XFoqWqwMyYntyHnzF16TQYViFuWhjroPv0agRj5zRrnnveIOlYO9o1+l4XQF/P1bDM5vKm
	n63NeoXEWZrqI0ggNA/RymR84fB9j9UQUpYliEXc35UQMlfWvRGWO6O5k26OZzwbMMXyNZC4M3ga2
	7jmYmSgwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huave-0005gA-Ja; Mon, 05 Aug 2019 11:13:26 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huavM-0005V7-B1; Mon, 05 Aug 2019 11:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=utB0r1atmnVwa7CY1NTWgbkaYDxQ5etSjcoSuqlLbMk=; b=NgjEVd/0WOtO+B3zJm+gOUBRU
 yHilyhEsbqPZrpPixoQnumwIxj6RwvF24GISfjL79c79VykIZNce79+G7UlQ6SBrEtr4lnsEy1TmD
 RgifsQ74ii9R0OYcOpPTLmwOYjhFIU3mXnHneKwAErY2Ll+STpvxoG6W/CTLAAyzFbrIM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1huavJ-0008IY-L9; Mon, 05 Aug 2019 11:13:05 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 132672742D06; Mon,  5 Aug 2019 12:13:05 +0100 (BST)
Date: Mon, 5 Aug 2019 12:13:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Ashish Kumar <ashish.kumar@nxp.com>
Subject: Re: [EXT] Re: [Patch v3 2/2] dt-bindings: spi: spi-fsl-qspi: Add
 bindings of ls1088a and ls1012a
Message-ID: <20190805111304.GC6432@sirena.org.uk>
References: <1560942714-13330-1-git-send-email-Ashish.Kumar@nxp.com>
 <1560942714-13330-3-git-send-email-Ashish.Kumar@nxp.com>
 <20190709200857.GA8477@bogus>
 <CA+EcR20ui8Liot+PtzdU6CJb5WzLDHS0Xc7VR7qGAOpD5=ArNQ@mail.gmail.com>
 <VI1PR04MB401579932CF0E7D4AE80E0C995DA0@VI1PR04MB4015.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB401579932CF0E7D4AE80E0C995DA0@VI1PR04MB4015.eurprd04.prod.outlook.com>
X-Cookie: Place stamp here.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_041308_376059_4BA31595 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Han Xu <xhnjupt@gmail.com>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 Kuldeep Singh <kuldeep.singh@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Rob Herring <robh@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============5104494248950878739=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5104494248950878739==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Content-Disposition: inline


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2019 at 09:07:47AM +0000, Ashish Kumar wrote:

> Could you please send this patch[1] from your spi tree, It applies seamle=
ssly on
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/
>=20
> [1]: http://patchwork.ozlabs.org/patch/1118637/

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1ID0AACgkQJNaLcl1U
h9CqaAf/ZHR3MbVzooalCiifNEU+1YHfwNNTTBUF8HJWr2BM2HQbpYWCuQcm9iyQ
FtnKDWPx6ouSI1lYCORQJyqkrZo36kPYN33OegMbzeNJRQb3uw94zVyVlOXAFl3h
/gl+o0+hrEQ2Ttnm/Nj9gZFiGxV6IFHE53HPFcpYBmPj6ME1i3XswYFrpxx6PoQK
GqqbirJm/v47fzXXIhKI6c0PFAKS6mPgFp68krzFXFGgPvvePJ+T5YP0lkImtfhK
BL2GSL9tMrf3InZ+/yOauhunSp7pqr1vF04udoLo5eh5sQqlo+/zCTqUqWN3Pqn8
N4keQhb+N29o99Bx2UV7SBd1YOBC+w==
=FyJ3
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--


--===============5104494248950878739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5104494248950878739==--

