Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FCFC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 13:30:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 942F064DF3
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 13:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 942F064DF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zPrUTcCmNCAZpKLrVKY3GIsF9OSxoHWDgrXX/A3wbx0=; b=JgMaTtQmOhUtpGywUZgIXoMNe
	x14fCOH7CCBzw0115J2KWJUQgRsCwmD+5OqI48KbzTx92eCBgnfjT+3+jNif1P+rpXlYZtFVx3cON
	b+Bs05pReg/6B/53HBFZttFZKLzK7rHu9SqM/zYBe+4/89VNXjI7bgsjVjAJcCSObPwoOGrfhP+Bk
	PL+wDca0c/klGlTdsJ0JbBFT5S3n8uJ53njvtj9xRMCJjrdXExu3RUJoUSL0SkDO0ofZFn1T1/9Qx
	VFt3IKsmbmr2itW3iFXf5bpPunbBcpH3ozOzsfZh7IMYsZdsyxJt5SiY6OmiFMDW8yRPGRMuTRLf3
	Rf4kP9thg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEXlM-00071V-Kb; Tue, 23 Feb 2021 13:30:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEXlK-00070s-NQ
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 13:30:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C197564DF3;
 Tue, 23 Feb 2021 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614087001;
 bh=XMII5kJzF7P9FxJ9CvB6Kb/iAx5gPX6SPCTr8wxUToI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h/2c7Jr0i2cEGSo8V2amsKBVRAV6mNpS/psXrEudjgQ/lsCwrOUwtoYZ4qsvdY8LC
 ibwVO5m4c08C/eRBoQCN54vKT1JTlFA0YkHlgJEtkpeAa4UdmL4dJsqe8phQ/Yh4UO
 20rvCY4xY28vkdpsyUkBZSYnwuJIGEOxLT9znqusybwzvKkfj7kXzNCOSMKqZMgXY1
 0eWVkECp68PsuI5CIYWvJ+ct++3NhYYsGPf9IA5/uONkl6vlcvAcAh4OMMOrpyJo/H
 DeIQSCG0k8HXJz7ESL47PQQoZWvG2jlncSLv/IW+tTEDwNfecAbH/emGLoYt5/BOiL
 6GjIpupH9Gavw==
Date: Tue, 23 Feb 2021 13:28:59 +0000
From: Mark Brown <broonie@kernel.org>
To: zhengxunli@mxic.com.tw
Subject: Re: [PATCH v2 2/2] spi: mxic: patch for octal DTR mode support
Message-ID: <20210223132859.GC5116@sirena.org.uk>
References: <1612517808-10010-1-git-send-email-zhengxunli@mxic.com.tw>
 <1612517808-10010-3-git-send-email-zhengxunli@mxic.com.tw>
 <OFBB82A762.591077E7-ON48258681.001E4996-48258681.0020D66E@mxic.com.tw>
MIME-Version: 1.0
In-Reply-To: <OFBB82A762.591077E7-ON48258681.001E4996-48258681.0020D66E@mxic.com.tw>
X-Cookie: Kilroe hic erat!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_083002_881230_1284FAFE 
X-CRM114-Status: GOOD (  12.22  )
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
Cc: vigneshr@ti.com, juliensu@mxic.com.tw, ycllin@mxic.com.tw,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: multipart/mixed; boundary="===============5141917759668339274=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5141917759668339274==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TiqCXmo5T1hvSQQg"
Content-Disposition: inline


--TiqCXmo5T1hvSQQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 01:58:40PM +0800, zhengxunli@mxic.com.tw wrote:
> Hi Mark,
>=20
> I see that Pratyush patch "spi: spi-mem: add spi_mem_dtr_supports_op()"
> has been accepted, can you help review this patch and make some=20
> suggestions?

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

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

--TiqCXmo5T1hvSQQg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA1AxoACgkQJNaLcl1U
h9B6Bwf9GnAWDCLhkL077YNgjFnDFCuzhAt6om6Yji6MYlAAt56e0QzQkpWJy1Xl
Bs9srHZjitYzUCHo5IIMWqZ3k33sDQTzbcvDCkI+yeBtM0wU50ZdkyU60YDfE7uA
06Uvccd67GUDRaQERy9E/TtACdz9QZjng2nSUt1SWXp2MM/J7kx9HRsF6Yr6FCbj
442q61xckluL74culRVIVhIFv04b5nEGBYdxau/FIMzxtnY1wh4649r7CU8GaDSu
xeSdMXFHzPJxX5SdgfCX7MMi+07QXH2SYZ2cgrVtgzqeO3eHT1u2Za3qBtXkJbEX
uImtztKFJd+UVVj09gPkzEKajBfW0A==
=TICk
-----END PGP SIGNATURE-----

--TiqCXmo5T1hvSQQg--


--===============5141917759668339274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5141917759668339274==--

