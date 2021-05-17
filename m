Return-Path: <SRS0=22uX=KM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B5AC433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 15:51:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBD4E611CA
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 15:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBD4E611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zNE0CoJ4wnSnSucPEdZs7AsVGgic4GMnoYUfk2r7YO4=; b=YW2HRtVIYdjm9Y1T3Iuc7puz1
	vR1GoC3CvAKn3x3/OlqIYMDefO6wxFqANs6gKr/EtC4HF9AXhO4Zt1VyCrQ5R4G+u0Jq5GYhtEPow
	QGVKjQlrsMGAorn8Pbwj0epGmLKhHCZ6YKvjKRIIiU6/tWwxr9goXJLNNL0PtE7IhMCBHUQeKAgxO
	VLefeXHQmw3upDmKAYksDf4zK8jvDwhAP8yYWx8LErOa2dJX9vZdCjc8Y8n7AM1YCC/cdm5OU/5Qj
	FP2S+CtZDUPyHYg2wTKRZrQPN1F9YPdrQFu6sLLfOBqmpMylxSM9wZFGGPGSSbbrF43ktljUMcP+N
	beBxeIayw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lifVe-00FTy6-0M; Mon, 17 May 2021 15:50:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lifVY-00FTxL-Fo
 for linux-mtd@desiato.infradead.org; Mon, 17 May 2021 15:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=v+IC3Fkn1DqRIQwuacT6a0xfUaK38TnZ1/oziVax828=; b=Bqi1++L6z0XgVUTS6rC20o522+
 DR00hq1SQTrvl0zNnd/8gnZoPi36wmBxOFoeShE385u1+1zM9arE2cOnvgv3AV6OYM+2ElxHi8SYX
 8yKqBHT8jNh4NEl7tEcLmPbwUBT9t1yInE99AHoqb3iuxn/GuSW4wTZxAd07um348/42YfRJzd0Mz
 qtw5Haxy82KmlCOyVjH3NfBN4LyLNfeDmdDpyP6LiY7jaIOu3CU3j0x0ulNzm0uPtGwZMRMRCQsOp
 FTy9iPzs+oYsfpnhxFqmAVtrQF+UxyjEJYvArzN4SjDYr0DMcZEWlwHdpKgFQpmIG5imaMeki6CoY
 2h665jEA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lifVU-00Dwms-C7
 for linux-mtd@lists.infradead.org; Mon, 17 May 2021 15:50:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4AD660FEF;
 Mon, 17 May 2021 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621266611;
 bh=v+IC3Fkn1DqRIQwuacT6a0xfUaK38TnZ1/oziVax828=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sSAPkrr/3SMLee031CW8f4eOd5n/X3JE/mc/8VXp8VL3t9DBBxBVWdatqrv97V3mW
 VGlkkuRK4Pjs117tXrGX6tSK9t77HxqYJFe4UdYZpHryNHdUM4ZDGQeEsiCLDnmIqL
 k068TXNngo9KRei/UmvJeyhFbHCryChz8SxMt4oCvITGreSvvJMz2YqnLHoHW/EQdI
 nX5bcIXN4Ujs+36xmdcpU2dylksDiPFV/8nMXG1I4T2QNEfrmTkTsVBN6wdZL/pXGg
 +3d2XA88EmMQeYLTMI3IOGjdESq+H7xGsqKuFI+ZZHrluhdTxh5ti8Um/5eBxC5b6G
 CvCIp0G2fjUHg==
Date: Mon, 17 May 2021 16:49:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhengxun Li <zhengxunli@mxic.com.tw>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 tudor.ambarus@microchip.com, p.yadav@ti.com,
 miquel.raynal@bootlin.com, jaimeliao@mxic.com.tw
Subject: Re: [PATCH v5 2/2] spi: mxic: patch for octal DTR mode support
Message-ID: <20210517154928.GA11957@sirena.org.uk>
References: <1621232088-12567-1-git-send-email-zhengxunli@mxic.com.tw>
 <1621232088-12567-3-git-send-email-zhengxunli@mxic.com.tw>
MIME-Version: 1.0
In-Reply-To: <1621232088-12567-3-git-send-email-zhengxunli@mxic.com.tw>
X-Cookie: Chicken Little was right.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_085012_459263_85963AE9 
X-CRM114-Status: UNSURE (   8.98  )
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
Content-Type: multipart/mixed; boundary="===============4326386363940871895=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4326386363940871895==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 02:14:48PM +0800, Zhengxun Li wrote:
> Driver patch for octal DTR mode support.
>=20
> Owing to the spi_mem_default_supports_op() is not support dtr
> operation. Based on Pratyush patch "spi: spi-mem: add spi_mem_dtr
> _supports_op()" add spi_mem_dtr_supports_op() to support dtr and
> keep checking the buswidth and command bytes.

Acked-by: Mark Brown <broonie@kernel.org>

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCikIcACgkQJNaLcl1U
h9COewf/cNm1FKSaKXYdSEaP+MjW1+CYInU4QTZM6ElWK+dZ4tXlCCZnVDdLcCnO
glQrPUsJMgCtaldBE0FPTH7QrkDbHQZSgXCWeLIjaVJN0eKX+ZwDCmiVeiA1Hirk
3ShedrPGD8fZztfwp9wGpyKyHiTZysZVL0gSNKypar9N/SPFyCQCLVu1JKv5ohHA
wEvZQZF2s7WUhlxAWPm+M7uoAcsLJiNEfM6duVwOyAtTo/bsWnwTAbMtO5bwmvZJ
EJ+uqbA2D6KgbNhPWQ5RYT5HcjDfu5Rn+trvWOyPvN6PvkIWGt8Qqk/vHuTj0MFG
7WqfGs9kx4cqYZ8w/Q/Oyn1ZKpKUZw==
=lT6K
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--


--===============4326386363940871895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4326386363940871895==--

