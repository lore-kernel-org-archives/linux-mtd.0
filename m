Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7BCC33CB1
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 09:53:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D13C207FD
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 09:53:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l84Hin/q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WCAVFWr7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D13C207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/FvyuetQc55jjAkiX1qmsIfUNclmrd5Ei6VKn0QR0Y=; b=l84Hin/qzKeYG8
	JyXoAOummLpjr0D83T2BwXSdwnbMWgu4LgQcGFqS0WpDt+Gga96hmBVYh/41G0zN/1swf3LT7zYw/
	qDotZjIsN77x9GiEDwRSxSsVWKZri5UX87li+hl3NnLyNGbQtHjXPdsexgC33siX4ouak0wc+aRyo
	grs49tsj6oYcUXPV98k03fH4Y+dQpRLkEEZNtZHfY45dqO8LZXdldN1/hmLvRntnjR8CfGvhFOVCd
	ZH56krrW3fQNW1idkIzHwnK5fZ1+E2BSCL7uD93xlvniJKv27y3fxfXUty0/7YYwCSkxj2KKktpB0
	98GfczqWibj+RlETHiNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irIsx-0005Lg-Qd; Tue, 14 Jan 2020 09:53:19 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irIse-0004Pu-UP; Tue, 14 Jan 2020 09:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fr/tL1N9zJcY69dJUGwg8on8z8D7PvqK10GbRlVYjgg=; b=WCAVFWr7eftgxjj2BhhxPUxem
 qeHxJHUBxu/QGwS1c2SGZXn1kA+84C3sOOA8/4hGRwC4IA8WJPUJXos62aHbrbt13PcGQWkqE0v6n
 GcmdFjAv/PGHSqznR/FzeSXx8tiDyODXrVr9zAGdkrjO9955Fg0ED32AvvCR/kUox51SB/c9K3CQM
 lunS9zUQB6cWSSMpSRNhXoczPJ9WbapACRBBfWQzv7+6DJINTzkFQXweclJMeM77XDcpMgHcje9rY
 zYtCzQiGS/7/KjSRWjxB9/oseb08Dzb8/jTA4ASqIT0tVTNLyWb6LDdzIDlGApsnLHBktTl37c8Jz
 TT2YNyDow==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irIsY-0006fx-Fl; Tue, 14 Jan 2020 09:52:59 +0000
X-Originating-IP: 90.65.102.129
Received: from localhost (lfbn-lyo-1-1670-129.w90-65.abo.wanadoo.fr
 [90.65.102.129])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 70EBB240006;
 Tue, 14 Jan 2020 09:52:18 +0000 (UTC)
Date: Tue, 14 Jan 2020 10:52:18 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 06/17] dt-bindings: at91-sama5d2_adc: add
 microchip,sam9x60-adc
Message-ID: <20200114095218.GF3137@piout.net>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-7-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578673089-3484-7-git-send-email-claudiu.beznea@microchip.com>
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
Cc: mark.rutland@arm.com, vigneshr@ti.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, pmeerw@pmeerw.net,
 miquel.raynal@bootlin.com, lee.jones@linaro.org, linux-rtc@vger.kernel.org,
 lars@metafoo.de, richard@nod.at, ludovic.desroches@microchip.com,
 wg@grandegger.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 tudor.ambarus@microchip.com, radu_nicolae.pirea@upb.ro,
 linux-can@vger.kernel.org, robh+dt@kernel.org, mkl@pengutronix.de,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, a.zummo@towertech.it,
 richard.genoud@gmail.com, nicolas.ferre@microchip.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, knaack.h@gmx.de,
 dmaengine@vger.kernel.org, eugen.hristev@microchip.com, jic23@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/01/2020 18:17:58+0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-adc to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
