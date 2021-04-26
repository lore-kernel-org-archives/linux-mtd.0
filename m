Return-Path: <SRS0=STJJ=JX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD14C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Apr 2021 16:55:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98719610FC
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Apr 2021 16:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98719610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UcKkC8fjG3axm7KxIAIsP5MNPUKjDLHHflmCyakCqEc=; b=MbWJXIc+BFedc0HWw8ODRBAm+
	0RZZgIEcN1qnwkeJWq65fhRnNTt2IW2vG3c3gtIeqr/Q/eFjcI7fsdkWgjbhX9lZFz3ToI7kI4gEC
	WkAnbREDAt1uefkOCx6tg40rzaor3Z5s3CKB6YhfnITMPB9jzfcTR5XTcNHSKOSOE3VRFdf+695AK
	LvbrWPXCGGuVUDsyMuuVoqXdSg+ni/C18Bghmv1Azn2Ptu/p3QGDYBjQLdA6MM83ceaz352xGeXnZ
	m8nFpVixKh/r9rY6X8NPJ/bdb4gnuIpoaKdaY/SvIMCSpaUanpU0meaP4wQnv51jyDOhOs9hPfQ6d
	LuPMazOmQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb4VG-0087jD-Os; Mon, 26 Apr 2021 16:54:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb4VD-0087ip-1w
 for linux-mtd@desiato.infradead.org; Mon, 26 Apr 2021 16:54:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=T0EY4Yo8AKW4bJetEYEzHIaleEspQ9YFH9V20YUMtRQ=; b=mxVxQGIpHh7iMiyzEWqwxS5hkd
 cicjcVMyxt86Y4YUK56pkr4u3P/7DE99VUDO6KCBEiKF6AndKMh2jzSS226QT9r2Ldh9qdl92BnKI
 prwI/w/RyE6taUbOAWsuqR0VQqeiImCwgCOUNHvhutlKY7/W6JeJOMkExnfb1ym3E1/QWmsrKHbRH
 qpqhHzRux4eeFRWAv+RLZaTtsZrdCX/GwrVjE5ryYUAxl7ButNDpqzqj3cqKDGzdiGtaRzYdU/Nrv
 Px5yrgTe1LNgTGlLHZ0WWv+9RSl5wh/wFSKrumB/PYL/VTc9UPbcyD48k+Hzpa63q3507hPiL9tt3
 mp+Wnapw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb4VA-00G6dK-MZ
 for linux-mtd@lists.infradead.org; Mon, 26 Apr 2021 16:54:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D3D761076;
 Mon, 26 Apr 2021 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619456068;
 bh=Givos2wPFTgIoBx6YKC8nj3Pbgm9ei6Z3Wxmrayz8aw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mi1T/fbA112QQ9XjZpq+gfVb8GpNrkpYbelLEM4qxtVfjeSS5xj5qETS4h15vCZaQ
 SusAJJIIGeg4d/X7AtRkN+l7eUcTPDwUJwkQHHwl+9mdIAb90zWQDvqfdK9xYJbhtj
 O4LaB8ZnboQQBLNywMVtp7NofdQvW+DkiVo6657vztl4eiEEfrMUs5ZToR1lLY7pQZ
 aUKM54yBx7CWPD3kqwyCKQEdNiIRxoXPlFrJhq/ylaNFKz65vRJAN/u5UTA+RGQpEF
 whfEa5r9J0mXYrwVFQU5O0KrqpyfBgibTpsEw/WSZFy3WLnrD0MZCCpV7bGJZQWBbs
 hZwL+rU4Zy0uA==
Date: Mon, 26 Apr 2021 17:53:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhengxun Li <zhengxunli@mxic.com.tw>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 tudor.ambarus@microchip.com, miquel.raynal@bootlin.com,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v3 3/3] spi: mxic: patch for octal DTR mode support
Message-ID: <20210426165358.GI4590@sirena.org.uk>
References: <1618900179-14546-1-git-send-email-zhengxunli@mxic.com.tw>
 <1618900179-14546-4-git-send-email-zhengxunli@mxic.com.tw>
MIME-Version: 1.0
In-Reply-To: <1618900179-14546-4-git-send-email-zhengxunli@mxic.com.tw>
X-Cookie: Zeus gave Leda the bird.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_095428_797545_487467C5 
X-CRM114-Status: UNSURE (   8.99  )
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
Content-Type: multipart/mixed; boundary="===============5064888190207252777=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5064888190207252777==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Encpt1P6Mxii2VuT"
Content-Disposition: inline


--Encpt1P6Mxii2VuT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 20, 2021 at 02:29:39PM +0800, Zhengxun Li wrote:

> -	return spi_mem_default_supports_op(mem, op);
> +	all_false = !op->cmd.dtr && !op->addr.dtr && !op->dummy.dtr &&
> +		    !op->data.dtr;
> +
> +	if (all_false)

This feels like we might want a spi_mem_op_is_dtr() helper?  I can see
other controllers wanting a similar check.

--Encpt1P6Mxii2VuT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCG8CUACgkQJNaLcl1U
h9DABwf/T8rQdl/NOEIQUm1TecsYXmR8RsSAvPbEH1oYP+nG22bMVSqWP3PUkoaP
XDYz2jP9Ptfkgh/SbiH8b5zT/c4Z5qYJO0jPNb2/+98XJKao65VDRIpr7P3CXgQj
lzNqJmLteJn2dMcWRwZoIkGV/eniS0VjzDGR/dLguMbuPtCuGL/dCxtEI8412SK2
BrPjHJrzsOOHO/tINDMOH/NLTchiaxX8suduPaish3Nr0aK1kv7YVSa1KgvDpaiK
Hqkps1sdmC1Q/1M2NNCKgTfKhYdZAjIpuAffvO62DnVQaq/O/AeWNPgYXluHK7BX
9s0XSphKweIUGpdrCA3CX7cSzChGEg==
=JjQy
-----END PGP SIGNATURE-----

--Encpt1P6Mxii2VuT--


--===============5064888190207252777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5064888190207252777==--

