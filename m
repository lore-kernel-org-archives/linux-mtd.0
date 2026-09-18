Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641EFC982DC
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2026 11:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N11SaeX0uOJA93unG4VRf+2QDQFeJI/gYtHv/ZmYz1g=; b=2cR9/f02/LKEthWszCJag0WQuE
	BZBHq+YCCT6pa2ysWYzvUbZVQMRSP6bhcrFGX266uqpLJ2wt+0+119pV+RyOkVT08bs8sW2ASNMbH
	KJO3xoozIVrWw3C2CIbBhcsf9pAznIkfCsawkfyd+apKdccnf6IEkp9XN3JP+VGjcGCOuYPSLi2Hf
	Eq/niO3yhxWMjSVpYlKbfkiWqkwGsXqGK8xrd5F4KdLBVXS/1aUDbmQ8dpl2whT2U5k7Pxj2xRZND
	qBu7KFbx1Aec3EhTg9Tb2Mmm1TXAYrW0a93lSRrWeP4z2XpBnog5gRIU3Wf0nbOQ87+TxmCqNIyNl
	Hib8qDSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Wml-0000000EDtI-2OUY;
	Fri, 18 Sep 2026 11:29:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Wmk-0000000EDsn-0ZNH
	for linux-mtd@lists.infradead.org;
	Fri, 18 Sep 2026 11:29:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id E10AE4048B;
	Fri, 18 Sep 2026 11:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 482DD1F000FF;
	Fri, 18 Sep 2026 11:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789730981;
	bh=Va5Amt0hl9nFtXROENx/Xu/NwtB1ulS7dWCgJ5WWNBg=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=kFbN1KIQHlA6GA2EPXzYOdvBRhf5uaQ0xFdBCdTmsmw6T0MjXO/pro1zVj4eNWH5g
	 A2reavg37V00/Tk7LemTAAr4etANyxcpkx8Cc7o9XN/GoS8YeBvAus9ZRNqF439kbr
	 JUhkGQ8p4Z9JaiMh6K/DtowFC3wYqqJ25TX++VGcSW3LUK3fNg7vdDpKjg8geVzmah
	 uY797LkDRNEQOaNphpuF89e45Ra4VGZnx8qNrnt8LCCSfb3Ro7R+SBdLloMGwWuAQR
	 RWdSXh5XDPRZmNFra0YEAysa86d8e7oHEm41yq1KNEeCdZXxAXiSKIVH1HgjRPLl6Y
	 VnsqLttVMBgHw==
Mime-Version: 1.0
Date: Fri, 18 Sep 2026 13:29:24 +0200
Message-Id: <DLIEOELQERRM.21J9WHMJHGYEB@kernel.org>
Subject: Re: [PATCH 00/25] mtd: spi-nor: winbond: Cleanup JW family, add
 support for PW chips
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>
In-Reply-To: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============6404871424643416031=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6404871424643416031==
Content-Type: multipart/signed;
 boundary=0726a63f4f0dd6365877f391c5c8b973f3469d7b127998ee89f778e734c5;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--0726a63f4f0dd6365877f391c5c8b973f3469d7b127998ee89f778e734c5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Sep 9, 2026 at 5:25 PM CEST, Miquel Raynal wrote:
> Compared to the previous ones, this series is super straightforward
> since it leverages all the core changes that have already been done for
> the JV/RV families. Like the former JV/RV series, it first cleans up the
> table for JW chips. As I have access to a lot of devices, I made test
> runs with almost all of them. This way I could extract the SFDP data,
> the capabilities of the chips, proof that they passed all the tests,
> etc. I then add support for the PW parts, also showing a full test run
> in each case.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> Miquel Raynal (25):
>       mtd: spi-nor: winbond: W25Q32xW-Q/N: Enhance identification of the =
chips
>       mtd: spi-nor: winbond: W25Q64xW-Q/N: Enhance identification of the =
chips
>       mtd: spi-nor: winbond: W25Q32xW-Q/N: Fill locking information
>       mtd: spi-nor: winbond: W25Q64xW-Q/N: Fill locking information
>       mtd: spi-nor: winbond: W25Q128JW-Q/N: Fill locking information
>       mtd: spi-nor: winbond: W25Q32JW-M: Fill locking information
>       mtd: spi-nor: winbond: W25Q64JW-M: Fill locking information
>       mtd: spi-nor: winbond: W25Q128JW-M: Fill locking information
>       mtd: spi-nor: winbond: W25Q256JW-Q/N/M: Fill locking information
>       mtd: spi-nor: winbond: W25Q32JW-Q/N: Add quad page program capabili=
ty
>       mtd: spi-nor: winbond: W25Q64JW-Q/N: Add quad page program capabili=
ty
>       mtd: spi-nor: winbond: W25Q128JW-Q/N: Add quad page program capabil=
ity
>       mtd: spi-nor: winbond: W25Q32JW-M: Add quad page program capability
>       mtd: spi-nor: winbond: W25Q64JW-M: Add quad page program capability
>       mtd: spi-nor: winbond: W25Q128JW-M: Add quad page program capabilit=
y
>       mtd: spi-nor: winbond: Prepare introduction of W25QxxPW-Q/N parts
>       mtd: spi-nor: winbond: Add support for W25Q33PW-Q/N
>       mtd: spi-nor: winbond: Add support for W25Q64PW-Q/N
>       mtd: spi-nor: winbond: Add support for W25Q12PW-Q/N
>       mtd: spi-nor: winbond: Add support for W25Q25PW-Q/N
>       mtd: spi-nor: winbond: Prepare introduction of W25QxxPW-M parts
>       mtd: spi-nor: winbond: Add support for W25Q33PW-M
>       mtd: spi-nor: winbond: Add support for W25Q64PW-M
>       mtd: spi-nor: winbond: Add support for W25Q12PW-M
>       mtd: spi-nor: winbond: Add support for W25Q25PW-M

I've just noticed, that neither lore nor my mail server received all
your mails and there are missing patches.

Could you please send a new v2?

That also means, I've haven't been able to review patches 2, 5, 14,
15, 17, 22, 23.

-michael

--0726a63f4f0dd6365877f391c5c8b973f3469d7b127998ee89f778e734c5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaq0glBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iX5AF+PS85p3AOUowIAsYbLtfG5h9Q94/qnStJ
mvTpabepC1yB9CmG/9V2VWRJhsWtvT0rAYCufaMN5ahbBpNdo2sziRLXt4Y8wZ+f
X6857+M8ikMb9WT4zj7k91L3gU6RnfbTPOY=
=16m/
-----END PGP SIGNATURE-----

--0726a63f4f0dd6365877f391c5c8b973f3469d7b127998ee89f778e734c5--


--===============6404871424643416031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6404871424643416031==--

