Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53C1C54E41
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 14:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yrHo0FLq/3OIj6rZmEu2994HmtlsM/VzIIlp16Bh9BQ=; b=WVaIU8VvAYjKUp
	82pwelVw3rOkLHcWiHKSEBOlUu9UxO3OaYcik2e6TxvbTFZsqoVGvO1zuL992J+ycbzF6Pz1ZPq5h
	iB9id02ejqykr3oxmRRa50z5e1QN4oSoo5ErDiIHSSmfPZ/JNlT4Te4FC+RtnEha8/mb+udmxvEpN
	9ukdtQqcaL44EYnqmuNGf7agLB1XecsNErWgkw++BMe8kc7R94iuz4S3gJuDLk+IWVL2XXE81BiJf
	uHT/HBQCNn1w1rx+dkLRdL4Bg/gJ2q/umZxfGjjeKE8tYaIpui7x920ZAZ0fmerEv/b2GDOe+474p
	m3XDSEEXeTFxEz46mQRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebpO-000000015TA-1RB7;
	Mon, 26 Feb 2024 14:19:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebpG-000000015Qb-2Bde;
	Mon, 26 Feb 2024 14:19:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E7180CE131C;
	Mon, 26 Feb 2024 14:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A484FC43394;
	Mon, 26 Feb 2024 14:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708957156;
	bh=PVAJUbXl+WR8D1faMaGi1Ysgf3Mnd/Ie+kj5VIe/UII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SWfNUk8BwPSS4qdLJ9PsMDzkDLfh40YS2dEWd062VZ/yBuEFXmKLlu9Wz4s7qam96
	 4Aytf1ccQjB3D2bAhYAEslPXqKIgyT866PHcnMuK9JVOhyrSTlgIIzN3/vPPnRtO9W
	 V6MNH8k3tXOPOGLg3ZLca5Vb0QMBibV1j7F8g8Gretnn9yaRlK082i422gNsguJAZu
	 SBpoxnM3Y02MmBCuBLEw+WvWlW8YxQdmzwc0dN4BYuPrCSyKJv9ZGCCaGzzgiG0AZR
	 TPN2Yc6kF0GqEfSwIT+X/RqLbrXm4gmanTSos0ezVgV+LmNRLBaAC3lmF8RIgj1jF3
	 Dxon4YSGaplyQ==
Date: Mon, 26 Feb 2024 19:49:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: claudiu.beznea@tuxon.dev, nicolas.ferre@microchip.com,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: Remove T Ambarus from few mchp entries
Message-ID: <Zdyd4LKFA2jsCrjA@matsya>
References: <20240226115225.75675-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240226115225.75675-1-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_061926_766971_6A6524BB 
X-CRM114-Status: UNSURE (   5.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 26-02-24, 13:52, Tudor Ambarus wrote:
> I have been no longer at Microchip for more than a year and I'm no
> longer interested in maintaining these drivers. Let other mchp people
> step up, thus remove myself. Thanks for the nice collaboration everyone!

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
