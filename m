Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087DCC4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Nov 2022 22:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=01Sg4pmXZLyZ7EA3wKjd4/aT75dHMvzpmNkyJrmuLdo=; b=uysSEF5ZbrgvMJ
	d16FwmdLfbRVKVSJMrrpvM4LoGGHFRE4PRXKL/UzQ2RassRZYfu2mrKuQiGYLe7sPDauX4w6QO1oK
	4Au7T6+pp0aWjyUTR4IXQwJEcyg5h8Pu1WXAcafn0G6rZzfJpMC5rk1VHgGSD9J1aKU0W5YmqRUZX
	co6sHrYFd19VJEyzphR2CnQovXw/FdCOensnK9JHZHXFjBYL2E91uleK5WxF98goy2JLbwViTGl0F
	wgk870L70yCqet1w+jnanJsfUXJB6kf+iKt4cT/Y/t12SOwJPreMAprnyK1d+JkQq2cOCJbY8SJGT
	TsW6+J5H6h+XHtUQyC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozQMi-00DzCs-59; Sun, 27 Nov 2022 22:43:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozQMX-00Dz7s-Va; Sun, 27 Nov 2022 22:43:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5FAAC60F0B;
	Sun, 27 Nov 2022 22:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFE6C433D6;
	Sun, 27 Nov 2022 22:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669588978;
	bh=xPml7px6Oku3roIslNdkT4oQ4o/v9f557wuY4c/VBBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mj/Bxd/KQUQnElBEBNTwy87wMnyw+ToUpT0zzu2QRRWCOjjq1zIRYcQZDolRjKkdA
	 uwZ/H4G5+mbO+da1x36Y+Y8g3dFOtKQ5FWZyhNK1ppL8RUKYnAg/2qyeTvUEXc054M
	 a5HYJdjL5ePRM9ycXu/OH8sfsaKB5Cw+9O0xvHiHbGFkalIASpo+QKcZDNb0zebYwe
	 MNINzhKoJOcmEQJCHpEQynQ2Uuiz7pCErommCVZ33x0nh+wRVJOnvA9OgyGA+59jfh
	 6u1k9qi7yE/UjBRdVRBgJeIsCI43NIl71SbJBtcs3gC3LOPwecB325RSoq6R5pcjO0
	 LkAWfqGWj1i0A==
Date: Sun, 27 Nov 2022 23:42:55 +0100
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: robh+dt@kernel.org, akpm@linux-foundation.org,
	herbert@gondor.apana.org.au, krzysztof.kozlowski+dt@linaro.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@microchip.com, broonie@kernel.org,
	qyousef@layalina.io, arnd@arndb.de, atishp@atishpatra.org,
	anup@brainfault.org, tkhai@ya.ru, quic_abhinavk@quicinc.com,
	vasily.averin@linux.dev, baolin.wang@linux.alibaba.com,
	colin.i.king@gmail.com, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org, michael@walle.cc,
	miquel.raynal@bootlin.com, richard@nod.at
Subject: Re: [PATCH] MAINTAINERS: Update email of Tudor Ambarus
Message-ID: <20221127224255.uw66dpsl7o757tg6@yadavpratyush.com>
References: <20221122125244.175295-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221122125244.175295-1-tudor.ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_144302_096193_C8EF5081 
X-CRM114-Status: UNSURE (   8.83  )
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

On 22/11/22 02:52PM, Tudor Ambarus wrote:
> My professional email will change and the microchip one will bounce after
> mid-november of 2022.
> 
> Update the MAINTAINERS file, the YAML bindings, MODULE_AUTHOR entries and
> author mentions, and add an entry in the .mailmap file.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Acked-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
