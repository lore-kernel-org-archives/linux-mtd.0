Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB2EC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 10:32:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCBA363219
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 10:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCBA363219
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cUd+JbhWqRzSy81tGHoEf8xHovx9eEgXvwyCO7bS1n0=; b=Vgu8lyzs8w0vh4
	a1M/wZ7krXhriPJlPUc9/e0rS297W72mH+UCpTofmTWo7JKrndU/wlC+Ro6DKRhV5smkwlF5MTqYI
	I83Q8Q8B6Rvk/j9wVOm9G+u8Z3YJxBICiqH8ydAMx/gSBY0ulSOBAIL1QiJB90PmrqotAcQAvsGbR
	Q81Uq6nqqc8sMi6fIAhdIcUbQ4jydvVLMstQ06A9ZKMYH5kRY1YFTefsdVJk0kRi5yCgI6jtNC/9X
	N5/CwOeVUV5mYtGFVeQygLAzmcJ/mlJdRDBQbKGcYsOPXdR1iEs8hU5JDcz9vCwVFUTdiyPMbiJ/u
	mR98gvcEpwsHEi3lHB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmvlD-001CuS-6U; Tue, 16 Nov 2021 10:32:19 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmvkh-001Cm9-3O
 for linux-mtd@lists.infradead.org; Tue, 16 Nov 2021 10:31:48 +0000
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B8F143F1AD
 for <linux-mtd@lists.infradead.org>; Tue, 16 Nov 2021 10:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637058705;
 bh=g5kT88EclUTS2mZGyESS2Hco+eCrz9DKbUmHpnwpdJI=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=T3K/NAbZ9JkTwqPo6/PR2fssfdYo90IgBnD7Nylg7Bej4XrYc+oAIC3XPcCc/JzJl
 xaER/H8fscF/jQjkA8R700vVGQ7l0vbsSj5jV+lp/A2BiSW4hYUR5AMPNNDdq4ygYF
 JLvWO/7Wm/9TmflamuEENM0pdBDfS8gYp82RlIgK/mD5i0BETchqemXCTvvxLq6cs0
 I2gopi6MB3rq9KBKU157+TEET/sClLByzfbFyu64CvnM2eDylgIKFWdhFSVkPdKwls
 owVBbgnX9KW1k5/1P3sS3ZCd3+UWNMaXVVU5aUVycF6Yorr0DemB1v9uIPDmMuBDUc
 BNGdqBLfsnvkw==
Received: by mail-lj1-f197.google.com with SMTP id
 y11-20020a2e978b000000b00218df7f76feso6078377lji.11
 for <linux-mtd@lists.infradead.org>; Tue, 16 Nov 2021 02:31:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g5kT88EclUTS2mZGyESS2Hco+eCrz9DKbUmHpnwpdJI=;
 b=ngSVZpTpT21Z3bF9SAbXcvxaShIXcouV3+y4q0IfaKr6N6C4bxsEEmeGnYcuPh1nx3
 GnIczdkIryD3RL/hgB9zjdFOKOetW9w7FMx0Mn/8V1Hxbh9vstGr8MAou2ns9AlRXCyl
 9i4OetItAgUGF5lAaIVsGeP6G2BAvxF9l7YXopjI9QcMoijJuLKevpmgvh22I4EVODHI
 nVS650UkSgB8Genv3/IafZPPV1qZmiTtzaQPaphuXVa0KaRgRDG4X+4DV3FDom1gwPtW
 yE21zBBSLQz/jGf+RXt/1d69xPV4aIWYWiCqboVHSfXbGPKqR+VI3HcWmuXJkuD0VpbX
 wGxQ==
X-Gm-Message-State: AOAM530hNHwbVTcIevWDEQbUj/hP4JiIDuAM2PQqXAhQFgbitCNQrxcY
 M7G7u+OIBcXqF/e9lyV6+6g8dTA2lpaAdYlhrs9KVZxPlSHr1g0j8EeJdulSItFn9bXoGBWctBd
 hfFDvJuKiYB2KnnrEgDEEeku1PDMLpfQzBlq4yEMLa/c=
X-Received: by 2002:a05:6512:3a91:: with SMTP id
 q17mr5473876lfu.425.1637058705230; 
 Tue, 16 Nov 2021 02:31:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUH80JQXZBEvDWfVj29pNQ2Zba/7Rx08vt0/WpoIec8KWneuc1zgQFATOcJm/krv8sKR6wdQ==
X-Received: by 2002:a05:6512:3a91:: with SMTP id
 q17mr5473855lfu.425.1637058705021; 
 Tue, 16 Nov 2021 02:31:45 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl.
 [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id j5sm1114418lfe.219.2021.11.16.02.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 02:31:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 5/7] memory: renesas-rpc-if: Return error in
 case devm_ioremap_resource() fails
Date: Tue, 16 Nov 2021 11:31:04 +0100
Message-Id: <163705866144.26823.3259399993902920486.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211025205631.21151-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211025205631.21151-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_023147_300641_D678B2A8 
X-CRM114-Status: UNSURE (   9.94  )
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

On Mon, 25 Oct 2021 21:56:29 +0100, Lad Prabhakar wrote:
> Make sure we return error in case devm_ioremap_resource() fails for dirmap
> resource.
> 
> 

Applied, thanks!

[5/7] memory: renesas-rpc-if: Return error in case devm_ioremap_resource() fails
      commit: 818fdfa89baac77a8df5a2c30f4fb798cc937aa0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
