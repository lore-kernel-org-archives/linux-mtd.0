Return-Path: <SRS0=11H7=KC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CB1C43460
	for <linux-mtd@archiver.kernel.org>; Fri,  7 May 2021 15:51:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B593610E7
	for <linux-mtd@archiver.kernel.org>; Fri,  7 May 2021 15:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B593610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vroV+tJX/TyHPWkz/9WZd3Ho6rRD6bXqxJ9khAcE4qI=; b=ZkQ/8Dgng8BwhTT2zIqpDhEEH
	O8mLV7GxtcQn++rqqxfervrf1kF0o6NF0Lit184k9D3QEYhgmJDSP9wddD6vBWgif44LLmW9WAyoy
	AXTE27lSAHvUeOfzvLl/36J+sgC8Bw/GiCgd2dQ4wjah1rKdZeP2zIwgpn2Q0N6UDTSAOUGEJonsi
	WSzGL50KjfIH5jR1dxXsK33BiJ98+3LnW79ZvVgW7Vz+oi1eMhBw9M8Q5VbptXQCAOJ0/9o2SkNRb
	dwqAwzcvP5LdVr1SrkWmhP/co3mYbNH7GRnIOohzP6IhCcWW+WF00V62IuO9HWLASeBkDNYUnIe8i
	X7cEqJ3zA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf2kZ-007TAl-3s; Fri, 07 May 2021 15:50:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf2kX-007TAb-0u
 for linux-mtd@desiato.infradead.org; Fri, 07 May 2021 15:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=R50tC1p5k/fPOb8d3kN+2f3M0GETRvSe71x08MfhO6Q=; b=vvFzisxjnWZ37d55CxWQ+Yoj3G
 io+iYpstLDrguBzX9DASIei3Lp88sWcpwY0Ln65ZZoEQJrt8eUDeKr0qF0wKIXgl4esjVCMBFC6q2
 rSWhU4LYX7LFf5vgNS2Wlq5GoE5/gnN0D8ugQ8bdHn12IZ2IHMAqYjveCeCedgx/o2EAJq97LhbTi
 Lc8EA2JTftE5l7B0jq+LoPy85n2YM/Xl8OqQYjZM6cgut0DHDQ/vCKmDUs++4019seONjMuW0UEzF
 ul81Bgy/w7eTIgdnEykaDz9pcd8lKzuPc7QJt0dvu+ou+Pry2hKS94rQEAewGRjeZhi8NbLVF/2n2
 ZcAIJ1MQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf2kU-006ymd-LZ
 for linux-mtd@lists.infradead.org; Fri, 07 May 2021 15:50:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E4A5610E7;
 Fri,  7 May 2021 15:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620402642;
 bh=R50tC1p5k/fPOb8d3kN+2f3M0GETRvSe71x08MfhO6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dGlDfGcXmDAWISdtPRP5bhOPYFFhqUAcejbB5mKHf1pyc5HUww39ATEyEXWtaGdLh
 QeFyhjSY0cV5nj0HQRrfXXmBNkbsYCUFE2BpKyEm5aJyf/rR41KjCiby5h4rCfvVTf
 gaQjK8C1seVeTXuxNZZkTFJTIw60XtvBu1eG6QKe6ScB/vPdIpObN2Pq68wz+0JTnt
 2+VUynf9i9JxYdPFwzS8tK6dDYjgZ5bs0iMLFlGnRz/6q/EcMq1cPp8K4B/zY55j7X
 ku2QTDhOqplJ6c60NdnUs4gg7N4udi/gWNfN/DzN66TfP9kxK1bekupfCDICBgS8Ig
 Hl8fI+n6b5pdg==
Date: Fri, 7 May 2021 16:50:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH 0/6] Avoid odd length/address read/writes in 8D-8D-8D mode.
Message-ID: <20210507155004.GF6383@sirena.org.uk>
References: <20210506191829.8271-1-p.yadav@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210506191829.8271-1-p.yadav@ti.com>
X-Cookie: Postage will be paid by addressee.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_085042_751499_86D21E81 
X-CRM114-Status: UNSURE (   9.58  )
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
Content-Type: multipart/mixed; boundary="===============0029861586566666276=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0029861586566666276==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xkXJwpr35CY/Lc3I"
Content-Disposition: inline


--xkXJwpr35CY/Lc3I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 07, 2021 at 12:48:23AM +0530, Pratyush Yadav wrote:

> Patch 4 should go through the SPI tree but I have included it in this
> series because if it goes in before patches 1-3, Micron MT35XU and
> Cypress S28HS flashes will stop working correctly.

It probably makes sense to apply these to the MTD tree and then send me
a pull request to avoid any future conflicts with SPI.

--xkXJwpr35CY/Lc3I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCVYasACgkQJNaLcl1U
h9Cixgf9Eaf2a++Xk1MHN7iG0wzgm8We/j3PyiWfvSK9MSUK0Lh0walcRHzraZE3
Jv7OZrDcVwJ5hfho7LWkTQPxny69b8E0bvm96G6FfSQYoVDtkrLi97/cQfWsgrln
ujFsaAMy/fIZNu9CVkdspvfdY/BeVdeD3LhXkDWEkR5KfUz67g0ReT2jSqILU3pj
QFQnwIoY+ZuUPoTajkyedL4YN86TJkKi17j5giHhDGblQVdYPhNKUIuv4ieaoLhF
s/28bYtKWAnwtXMNUQ6q4XAT/jdEo/MBMU7vxzWRfE1hNEBtYlrX82EurTIP+1b7
DVWuFR9d8sry4oe19mg9xkMQNHC6TQ==
=zcei
-----END PGP SIGNATURE-----

--xkXJwpr35CY/Lc3I--


--===============0029861586566666276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0029861586566666276==--

