Return-Path: <SRS0=3ub9=VV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755D1C76186
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jul 2019 22:11:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 464C021880
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jul 2019 22:11:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kuMkQ0rK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 464C021880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=9WmRLZXqX/9wNtr/jhE5nrxF2XzjqAl3CzB+lWaxIRg=; b=kuM
	kQ0rK286B8YS2bwRQysSa/Jp4fkPgPKYkdQvjItgHnL56D4gdC8IZJarolVybmKsaCQQourf5n+Ap
	A5d/oOX9vo+Hpp3Z+xL9X5o0y8lRamCwx+UYErU2jxqt/gPMBW16Ndn80qZL6MDGgE17IF7YX3xrp
	w8qtmxPY510jRzWGozqiE70I7HTSM2gBA8x87iUD9FquG/FMa6dIhuzGUiLN+kC4dk1py2DWSqqpP
	R4YHRy/yKdi/FIzbaggyHap6woJ1LWY2bXxBBWPexLaz3ykjq415M2tdKTSDtkayVxbEfc2zGKiPC
	2g1ghm6SQjkId8TwEeRdwjGrLJU8gTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqPTv-00085s-Ge; Wed, 24 Jul 2019 22:11:31 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqPTr-00085G-Gf
 for linux-mtd@lists.infradead.org; Wed, 24 Jul 2019 22:11:29 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45v8gt4LLsz1rQBF;
 Thu, 25 Jul 2019 00:11:22 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45v8gt3WWJz1qqkP;
 Thu, 25 Jul 2019 00:11:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id EKuri9zD8ueK; Thu, 25 Jul 2019 00:11:20 +0200 (CEST)
X-Auth-Info: FLFRI9ORPmW1dCZX5g9XaLUBSO0COEBkSoguJmIn8OI=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 25 Jul 2019 00:11:20 +0200 (CEST)
Date: Thu, 25 Jul 2019 00:11:14 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
 linux-mtd@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Yogesh Gaur
 <yogeshnarayan.gaur@nxp.com>, Suresh Gupta <suresh.gupta@nxp.com>
Subject: [imx][vybrid][qspi] Regression notification - vybrid vf610 QUADSPI
 - BK4 board
Message-ID: <20190725001114.0ceff19c@jawa>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190724_151127_853849_E2C7C240 
X-CRM114-Status: GOOD (  15.92  )
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
Content-Type: multipart/mixed; boundary="===============3888991437145477591=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3888991437145477591==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0t0lBY=T4wUInZLE/.NrMOy"; protocol="application/pgp-signature"

--Sig_/0t0lBY=T4wUInZLE/.NrMOy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear All,

I'd like to report that after moving the fsl-quadspi.c driver
from ./drivers/mtd to ./drivers/spi (around 5.1-rc1) [1] the=20
Vybrid's QUADSPI (even with single SPI-NOR memory connected) is not
working anymore (the chip ID read is FF FF FF).

This wouldn't be a problem per-se, but not all necessary code was moved
- especially for vybrid which has issues with some HW bugs [2]:

--------------->8----------------
 * The IC guy suggests we use the "AHB Command Read" which is faster
 * then the "IP Command Read". (What's more is that there is a bug in
 * the "IP Command Read" in the Vybrid.)
---------------8<----------------

I've explicitly asked NXP support for this HW issue [3] - but till now
there was no reply.

The official linux-imx (from meta-freescale) seems not to support vybrid
(vf610) anymore - and the newest available now kernel is 4.19 (with the
old fsl-quadspi.c driver available).



Hence the question - has anybody noticed this issue and (maybe) is
working on it?


My quick-hack is to revert the changes from [1] and apply some
"fixes" (which causes this driver to work on Vybrid) on the old driver
[4].


Maybe somebody from NXP (linux-imx@nxp.com ?) can ask HW guys what is
the exact problem for Vybrid's QUADSPI controller, so it can be fixed
properly in the new kernel?
It would be great is somebody from Linux/HW team could reply to the
original post [3].




Thanks in advance for _any_ help.


Note:

[1] - SHA1 IDs for the commits:

84d043185dbe0d1b4f6db575bd91c834d37e2f78
80261459804507a349daf754d6e5d835bb8578ae
78df30808961cd32f0517c7469886386b0680852
50f1242c674226dd866949f24043f5a1076ee242
fcf85e5c2ac0e57430f065c77407e33c7b036a9d

[2] -
https://elixir.bootlin.com/linux/v4.19-rc4/source/drivers/mtd/spi-nor/fsl-q=
uadspi.c#L671

[3] - https://community.nxp.com/thread/485139

[4] -
https://github.com/lmajewski/y2038_kernel/commits/v5.2-vybrid-old-quadspi

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/0t0lBY=T4wUInZLE/.NrMOy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl0414IACgkQAR8vZIA0
zr0cDwgAuCd1l5LUk8N/592qhJpSVkuG4lDokCsNBIT6iwRLrz5hzAmRtQmtIeYE
gHN6Xsz6iMyBjy/H6xkpB9Z77qFnyRtC3+j/aGLLU6Brf+hrtR4r2GOrzDbv1CI6
VLfzncX89BFeATed4T+VczHkpMpyNo0eHx7sIGzyk+cfmkFNZskj4jmBseUmqQ+0
PXEfwkz/FpNMpqnnTxy08v/rmoynsIOWz18pO0Gvc8Z3TqxZtYZMs3TEpjTa1uVS
LpfLWsy25y3SX2uv0LX4uX8BnpKTdJeG5K6Xyudh66LDREv7Y1InmmzPjsAUSRvr
WGdpr7mTupVClT+QEqhkkOF5i1Q3dw==
=w/qn
-----END PGP SIGNATURE-----

--Sig_/0t0lBY=T4wUInZLE/.NrMOy--


--===============3888991437145477591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3888991437145477591==--

