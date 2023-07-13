Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C06EEB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 02:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Bna2eUkhst9yrIimxSHfTzMO+iHOya5VXtsokX0YG8=; b=RbDVzTv1mNqJXC
	x8Sk//aqHl868F8QkeL1Ygmt/hFSZEduPAOVNCVcOjOX3RV5aJBjUMRWkP9qbtjXprmlVHBODekT3
	o34vHVuS+1vN5Ob+l8YSJBLwtQ9TXhiwo6ZqPkplBG0YED0G5UAUsboDO6TTkXhkJ1nl40/MmHZsL
	GdLUJhunBGwBq5vApfU7MUDvGF9ppnX2USHRnEQNt3KPQI5f5csxC972sAqQvbax9miQVno+59CVa
	GyOXSVvBMXWYOyD5wJkGxy05+Q/YtwCvVIDB391F7PL0KgDWitmsHH60kUr6xiaFEvj0ITrM2X6yW
	29s0aysRW+Vag3f7dT0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJmUc-001mMV-0q;
	Thu, 13 Jul 2023 02:55:46 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJmUY-001mLr-3D
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 02:55:44 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9922d6f003cso41194166b.0
        for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2023 19:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689216941; x=1691808941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqHNrvvkveMwsMIqHlQIoLwl5eBjuqONVWnhr/JLhn4=;
        b=eN3jdarnvR4nznoLzK5zUTHii6qCOqiXtRfjVHaIKMWuDMIfKvXB9YAaZN0nPQZHS2
         jmRUIHLQkhWW9BGmgZtsOQHcveti4AuVEW/S9uGGT+wOUTQjND5SbxcxYKfB6RmcaLXs
         nFyTSF2nebvS9+s1Mtpn5L4RxA/a7tQkd5CKYm7feh2z4QFSNczwcLbKK2VtNoMSKWMb
         LtDwQ6cDPK/7p39M+mmIm66zaa85bP7YagJQaoj4rWoh9eRqYoLx8l4rn/G0fmDzF4KF
         VusrS4GtDL5ZTsRL3EUP2R/sgV+Ra/+IBIZI7NjrgpLI1mpU1T1XOKWpgwunTN9EURO3
         JImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689216941; x=1691808941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqHNrvvkveMwsMIqHlQIoLwl5eBjuqONVWnhr/JLhn4=;
        b=UbqWoXxW4Ox79/1xz0bWDQnwkaJHi3HBUJdi6Iiam/MX6jk8/wlMBkO53fSOIMdXNh
         sW6Merf3cbGt+5U6ZP6rtyFMTTHuCNA6pdzNMioOe8iZ2/YZkt4jlO68JeWl/BaFJpUH
         F3wzBJYUomWUR8Xkhyn71p0IYiT8UZ3GVw6exm7qadvF4EgMuTN1tg+ZpgTiBV6A2N9U
         7Y4fxbZPceJjLvzBnyP9IolcZoRBWXKf/8uXjidw10714Da3MHSKWHyX2RxiSAGdvlXv
         LYLuuNDjtxKzMdynhKQqwuUdeIpGOBxkhWlIWHJwRqddXJqG4ltKQ5obbXZjwSj9ukQs
         prHg==
X-Gm-Message-State: ABy/qLYv8c7qmljJULWLhrWfm2IyzdOKR7erxmmbAgQZdmd0oY8fKy8s
	+pG7jVkm+pn70sPEJENnum2Kdg==
X-Google-Smtp-Source: APBJJlGDnMuzqlM3S/oG7hu9iHGq/oNkTsE/4WQGNO7n9X4+zCDTU3xH98c4a1bZOahAZ8hZSg4SVQ==
X-Received: by 2002:a17:906:2da:b0:994:30bf:5d4f with SMTP id 26-20020a17090602da00b0099430bf5d4fmr191988ejk.43.1689216940902;
        Wed, 12 Jul 2023 19:55:40 -0700 (PDT)
Received: from 1.. ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id gr19-20020a170906e2d300b0098e2eaec394sm3370236ejb.101.2023.07.12.19.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 19:55:40 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	git@amd.com,
	michael@walle.cc,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	amitrkcian2002@gmail.com
Subject: Re: [PATCH v4 0/2] mtd: spi-nor: Avoid setting SRWD bit in SR
Date: Thu, 13 Jul 2023 05:55:34 +0300
Message-Id: <168921680625.27728.7198640017398565535.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230630142233.63585-1-amit.kumar-mahapatra@amd.com>
References: <20230630142233.63585-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1012; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=TL4ydUNHMhdqUWLxKqFd7lLy6/tNy8U5gmeJJs96hZs=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkr2egmxlAykkZMsiy/cyeajbB6rZFaKpesMTmh Yq2b4bhul6JATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZK9noAAKCRBLVU9HpY0U 6cOvB/0e7UhW/YHvOwuKHQAjeP+VIVQrp+/QzlBBOeTrIbgqWMgMrMM/n5s5McDRv4JpX494XxJ 8TnIk2PifJVaM+qLC3p5UgQsvujGUsFoROBrpKfMxyrGeh4M5Vvg4Xqua1/D+6YDNVfGtEpHptZ 0V2UYr746KcBaa+ckfEtM4dvAm3Ij9Wn3t7UKpE/pTF5XtMQ7keQZ5vz133/vTv2oUp2rr6Q9FU 1Ke7UZ9/9Bno2Ha83CtRqUnOGxGQPoNYKf/kKd88NWp+JYJWq5/TlYd1pUMIztkKH98WP0Llrgv yxPiCp98V49f6xiBvlhnt9us6YmSm8hfwgbJCMc/YWhT5hia
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_195543_063396_B6098EC5 
X-CRM114-Status: UNSURE (   9.03  )
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

On Fri, 30 Jun 2023 19:52:31 +0530, Amit Kumar Mahapatra wrote:
> Setting the status register write disable (SRWD) bit in the status
> register (SR) with WP# signal of the flash not connected or wrongly tied to
> GND (that includes internal pull-downs), will configure the SR permanently
> as read-only. To avoid this a boolean type DT property "no-wp" is
> introduced. If this property is defined, the spi-nor doesn't set the SRWD
> bit in SR while performing flash protection operation.
> 
> [...]

Moved the of_property_read_bool() as suggested by Michael.
Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/2] dt-bindings: mtd: jedec, spi-nor: Add DT property to avoid setting SRWD bit in status register
      https://git.kernel.org/mtd/c/cfc2928cb213
[2/2] mtd: spi-nor: Avoid setting SRWD bit in SR if WP# signal not connected
      https://git.kernel.org/mtd/c/18d7d01a0a0e

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
