Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E77C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 10:33:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFDD763217
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 10:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFDD763217
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kn+Cy2j2rDvnO+zEBw2f89AMMwoVCeo9ZCJ4EUcEL0M=; b=qQUxUVtEklUNaH
	WpZ6QLIIpwh6v9T2aI1rZDvmmoK0io9SF2Lio9ABURN9RtrMA1vjcpOzl4KK9gnPkaW8aXPCdPyq+
	JiTopWuGalLapgYl0+y/M/SqIWYpmntraNPyzdwG/rajbTs9cAL02RCMDJi0FJ16RmrysY8Lnf46E
	ZUMJ7ASSzGt1zXOh+Nqv4QTb8mMkukthf82XYATHEoG0TMcCEGSe5S8gmG0SU2Ua667QOsBsBwiqi
	s5nlLgN34mJ5BETDYym2883nRpn5O6GxcpdBvXnQevXDVJQd0oT0G8Z94W1hYgLn6GHgLY7O9CayE
	Td+B9b0aKQx1WeC3eu+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmvlZ-001D05-6f; Tue, 16 Nov 2021 10:32:41 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmvkj-001Cmx-Iy
 for linux-mtd@lists.infradead.org; Tue, 16 Nov 2021 10:31:50 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 63CE03F19A
 for <linux-mtd@lists.infradead.org>; Tue, 16 Nov 2021 10:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637058708;
 bh=92zi+uaozVd3dQpRcG3KZ4gZNNYCSn9kCZHl66TmEQ4=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=eSHrNXAaa7jcE23FJU6xMLwAh58fSEIpwvNDYd2SLdr+rc3pY/Ga8zMfWzT1cmTFK
 oHq1nZvququpBpEg3suchbo+S0I2X/CYmyiaH6SXAoUv4AbD24mEzTV6j0ZnJkfYsl
 LBXJf8oV0SHdmv4EjW8BECZkwOXuLO9jzZkUGNKkHq3bnknfqEbo5mAvaONc+qE8sx
 SkXeDwJJg3fKPFfIRPweyf6LsetSVkR3tRyzFUpY+1dwM9NjzNWurepe9T+IdRvloP
 mxbzJSmcS6jZp4Jb4dQfOl4gUTr1BsC+6yrr8bjVnQetNW0DMTjo/m4fovnUEC3mBa
 AwkkS2Z14xkNw==
Received: by mail-lf1-f69.google.com with SMTP id
 f11-20020ac24e4b000000b004001e7ea61cso8043607lfr.6
 for <linux-mtd@lists.infradead.org>; Tue, 16 Nov 2021 02:31:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=92zi+uaozVd3dQpRcG3KZ4gZNNYCSn9kCZHl66TmEQ4=;
 b=1a5jZzRscweehRLpQjAcuDbKFu1U8EGwqpriKxC3vt7ax4lAp4BULnpLLMbyTGKZvw
 ZHfL8tztHZxt+NT6xsXtsQQlK5jE3lBTyridfLs4qVNVvbxE7uJNmzivzuyaj5FXpF78
 V14ExVzjdbaMIbLxpxHjNn3XeNbeohsrTEt8Hy1vkIs+7y93kYCaPx84Dcb9/XfaCAOb
 ZrPmlg4bv9Whja8ThzfCA1XXJ/+/CmKZ8XAI1IgVUgVnK8fflEFPVfirZNLKFbVU23hP
 xfM3CtyGCKxtkouyttkhBGMWBdJANA09hMsB2SleDICrU+70GAgQFcpHhdHm6NF/QAJh
 6oEw==
X-Gm-Message-State: AOAM5319gXCGev4gFK0qegDv7L/n2DJmP0zND0UyMXMgR+w9WnQHTfcG
 9cwV26yn2OdTucLcZs2b9IqY1pw5UOy+Qb0Nv7vgEVPi+KCfNnxh2v+dJ06H9XEVBLi/D4s1dgg
 dvDFJCIHU1sOfTpYdC+dVk8hy8MKSS91FETha1xc2FrY=
X-Received: by 2002:a05:6512:1093:: with SMTP id
 j19mr5749222lfg.340.1637058706565; 
 Tue, 16 Nov 2021 02:31:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFJQ83v72RjqgTGJjKyb8RGySZcPwWRf/nb5XIMU/rZuTUXd/qfX1IRjsZ+BlY4jF7IoGErg==
X-Received: by 2002:a05:6512:1093:: with SMTP id
 j19mr5749196lfg.340.1637058706395; 
 Tue, 16 Nov 2021 02:31:46 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl.
 [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id j5sm1114418lfe.219.2021.11.16.02.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 02:31:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 6/7] memory: renesas-rpc-if: Drop usage of
 RPCIF_DIRMAP_SIZE macro
Date: Tue, 16 Nov 2021 11:31:05 +0100
Message-Id: <163705866144.26823.8540217279898779126.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211025205631.21151-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211025205631.21151-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_023149_785738_37D10C52 
X-CRM114-Status: GOOD (  11.24  )
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

On Mon, 25 Oct 2021 21:56:30 +0100, Lad Prabhakar wrote:
> RPCIF_DIRMAP_SIZE may differ on various SoC's. Instead of using
> RPCIF_DIRMAP_SIZE macro use resource size to get dirmap size
> which is already part of struct rpcif.
> 
> 

Applied, thanks!

[6/7] memory: renesas-rpc-if: Drop usage of RPCIF_DIRMAP_SIZE macro
      commit: 5da9b59b23d8112709034a07338e03dcc65fa11f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
