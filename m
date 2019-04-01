Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D880C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 07:52:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BA9420857
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 07:52:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CzxN99OD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="ZzrcfVAk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BA9420857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l89Syvt9Y6bfja+Nb1zBmnXeHyLLG3mkbe8cduTEdYg=; b=CzxN99ODMwytYMLjnNVMYse7m
	e0I+85UeB1SNbOF0g1020ZXU7+YaBpI2FLL1voDTlf18cAQriLMH7XaTrA3O8F4R4AbCTVmH97itE
	5n9lV7KFeXTGCXrHYcZbpFOSBxVkROovP+IJUvEUnghWezKunAlgQIlSfCiJ8blwe3eCntdAVDDrQ
	jmbcTYGn/XiMfvFJQ8jgHTlfH0zbBRZ36E7SE4k9l+/ydj/7GVggmjxJC7K8Pd1ASEbPT5FQMO08R
	1nUKg51xGCIoUZLWlPHrAiE6xIYVbMQwD9JxlR4FcKUlirPA+IfsA7NDHBOIEHk7B0sOQn897xJXa
	28bMrUZjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hArje-0008Hg-Jn; Mon, 01 Apr 2019 07:52:02 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hArjb-0008HN-7o
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 07:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zv5TUv8WJFX8fnlubsLXjXRzhfQQobOfvHozLtN2Hpc=; b=ZzrcfVAkKf9VNxDp5LQcyMR8v
 urujuNCGR4zCsHcQ/YG+tYuDjVd+VqC5XxlofbVkgpo8ZKqHaCqsrvht6lHekO6paxpfzJalOisxr
 Zd/h8wI4eUBO2/1liyAuSjvlyfi3cSGkiE3bs4mPxtWSt/tgVm0lMBDLSK2/waArHxhGY=;
Received: from [147.50.13.10] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hArj8-00089e-QW; Mon, 01 Apr 2019 07:51:31 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 7FC02440082; Mon,  1 Apr 2019 08:51:27 +0100 (BST)
Date: Mon, 1 Apr 2019 14:51:27 +0700
From: Mark Brown <broonie@kernel.org>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH 3/7] spi: Patch Macronix MX25F0A SPI controller driver
Message-ID: <20190401075127.GM2059@sirena.org.uk>
References: <1553768318-23149-1-git-send-email-masonccyang@mxic.com.tw>
 <1553768318-23149-4-git-send-email-masonccyang@mxic.com.tw>
MIME-Version: 1.0
In-Reply-To: <1553768318-23149-4-git-send-email-masonccyang@mxic.com.tw>
X-Cookie: Use extra care when cleaning on stairs.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_005159_431401_8BFB48F1 
X-CRM114-Status: UNSURE (   7.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, juliensu@mxic.com.tw,
 christophe.kerello@st.com, richard@nod.at, bbrezillon@kernel.org,
 marcel.ziswiler@toradex.com, dwmw2@infradead.org, miquel.raynal@bootlin.com,
 linux-kernel@vger.kernel.org, stefan@agner.ch, linux-spi@vger.kernel.org,
 marek.vasut@gmail.com, paul.burton@mips.com, robh+dt@kernel.org,
 geert@linux-m68k.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmal.com, liang.yang@amlogic.com, lee.jones@linaro.org,
 zhengxunli@mxic.com.tw
Content-Type: multipart/mixed; boundary="===============0723319962662507437=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0723319962662507437==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xtx0sNU5lZ46KfgK"
Content-Disposition: inline


--xtx0sNU5lZ46KfgK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2019 at 06:18:34PM +0800, Mason Yang wrote:
> Patch a MFD driver for Macronix MX25F0A SPI controller.
>=20
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>

I can't tell what this commit is supposed to do based on this commit
message which makes it hard to review :(

--xtx0sNU5lZ46KfgK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlyhwv4ACgkQJNaLcl1U
h9DLegf+I4q4dklppx9CBbUDzY7TJuYMR9fUaHEJ+PERL25QB7175CTrJAMJwNUT
VYMvdLaDFLhYbL5W340U3TsnndEAr5Ad+8UyN6UKyLnDEJ9St1a+mF+s3bGIDh/y
9eoAmlwLizsthxqUJvBRh7ZhvKvwhSqfJ4AsiNFhXfq1BnPeYks5pHRtzAa2Y4Qn
2y6UJEi9pKVrl2Dd8Uer91pO51KSbeT8ScjjbDd8/mD1kTNTxejhvJyzrT2jiqnh
Zqhjwv1kZB6Nx4IvOiLD5SeRi0QPV987Z95qpDgo2EBeY81zRHEt4wcACe95mGcf
6+BzLYW9fOms8zU/qBIE5kPY923RZw==
=IEo0
-----END PGP SIGNATURE-----

--xtx0sNU5lZ46KfgK--


--===============0723319962662507437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0723319962662507437==--

