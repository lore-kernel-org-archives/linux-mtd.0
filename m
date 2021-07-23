Return-Path: <SRS0=yo9c=MP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F180BC4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jul 2021 06:28:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0C6660ED7
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jul 2021 06:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0C6660ED7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMYRnIDhrF34QvsgqCT9ZdpVMHRo5biRwImqCKO7rmI=; b=0GHhQ2KTwKyfNv
	6i3q57962uLAJEY462x1jdCNxU3dBtsMg8Xskt54V9YzzB8fxCCVGfd+keCV6HFq1lz3IgND8swEq
	NrKcBJfM4W6ntRUtPawz99vT6JV8TDdr7c1U3zJ3hlGXewanfwDuA/OLkUq3p+fGvjMUuilJPTBwu
	XP/8Vhcg1C6BpgNngrkB63gP5+vVDJ9SS8r2WCYLCVNsS8yYZvrzrOTyurrb4Z9vKtetONiGq+7ZA
	noTTWjQkzYq8sV5CUbDWZhtPWlfazXqxuRLXfYeHUuDrdUx5AXxozB4se5pd8QQ5fNys4E4O/6OZE
	4XqaxWaZ8Yrrfi5qMEaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6of5-003YXI-Tx; Fri, 23 Jul 2021 06:27:55 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6of1-003YUn-VA
 for linux-mtd@lists.infradead.org; Fri, 23 Jul 2021 06:27:53 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id EFD463F23A
 for <linux-mtd@lists.infradead.org>; Fri, 23 Jul 2021 06:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1627021662;
 bh=ScM5eUXjBnVPe8LbBTYSW47mZlMEZMzsEaWNVZaNkWQ=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=nsvN0ErA8WaW8/lOXcgd0q8rEbSTVwUA4Tq1e8CLkVWHSi9ztgt7RNj7e+oMzg2RK
 YF4eDjV+resTr3gBQVu8X1O9IW++zISGD6qp9QqB9dN8T0/t846pi2RrcMcPn33J1e
 Zt0eHxC0jWORsANSPjDWp5eOLSBgI88UYuLLjWwhv8eOl+q+xeCAo3sk2OAsDBwyZw
 MK0LgswaY3q/013vmIPCv55k7rTV/2Q8fhuLYMNdDIxD+PpQN9zI/xwnknqzXP6mjq
 lBeooBXCiz/q43F6bMcvXciSj1jTgsZyYtP/Omvzqdj2JQDbh0ACwYKXw2usycYU73
 zx34lpljRomPw==
Received: by mail-ed1-f70.google.com with SMTP id
 d12-20020a50fe8c0000b02903a4b519b413so209891edt.9
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jul 2021 23:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ScM5eUXjBnVPe8LbBTYSW47mZlMEZMzsEaWNVZaNkWQ=;
 b=cbVTtN9+m2LQeFDxzf7D8qsNU2nSZziggGYOGFsz0wJjjKmF2mx+ACFBvTyEybHoaT
 VyZvbUHDl3NU9eY9HUw/sffm7mZ13My83vH2CPekXW5IfIn1wCMy/xizkiZECt4E6siV
 5C0DJK+1mNJCsFdpSTBm9GH/ZYfn0uOLV7+qlfPjnzbA1KUw6xXrDGJXqpnf5fSve5aW
 Qc+QGLlpmBx8tpXAPKpcRiI1QZVXXZ2vYXT2EDeu02gtXgryJpEYW0jzE2FTc6yP2DkX
 FDxdaaR599SgbInfb9ABnc+9Y9h1D1O+c0isXJVHN3J+ToCoJcvFwiRc7d7pwS8813Hh
 0ytw==
X-Gm-Message-State: AOAM531sMRFBLgmU8UhAPWU+4zbvfyu3qFLYUvzr5EwJ0YolajKXFmJt
 HUkIn1CiT5DdgDsu3STWYnbBX7+ykljkm4mpL0Mx+JeaSNKj+RMhRfVt78T1TLd5lWXhOEYjYPX
 sb6+yFybPHzkI3Ab6OuBGzMRQenZrq/ONwTK0Bn65S8Q=
X-Received: by 2002:a17:906:e0e:: with SMTP id
 l14mr3313199eji.501.1627021662762; 
 Thu, 22 Jul 2021 23:27:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ+nyDEENcrVRLwr6YxB1sHYJA1zCxcGsDlpGPB37Ly4NJOfWs4Dn45abWgrRNkKKGjwgnGw==
X-Received: by 2002:a17:906:e0e:: with SMTP id
 l14mr3313181eji.501.1627021662625; 
 Thu, 22 Jul 2021 23:27:42 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
 by smtp.gmail.com with ESMTPSA id u5sm13449844edv.64.2021.07.22.23.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 23:27:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Jean Delvare <jdelvare@suse.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: (subset) [PATCH 00/15] Fix some DT binding references at
 next-20210722
Date: Fri, 23 Jul 2021 08:27:18 +0200
Message-Id: <162702163038.6229.12663832282139727924.b4-ty@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1626947923.git.mchehab+huawei@kernel.org>
References: <cover.1626947923.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_232752_168636_1039B866 
X-CRM114-Status: GOOD (  10.72  )
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

On Thu, 22 Jul 2021 11:59:57 +0200, Mauro Carvalho Chehab wrote:
> Due to DT schema conversion to yaml, several references to dt-bindings got
> broken.
> 
> Update them.
> 
> Mauro Carvalho Chehab (15):
>   dt-bindings: mtd: update mtd-physmap.yaml reference
>   dt-bindings: firmware: update arm,scpi.yaml reference
>   dt-bindings: net: dsa: sja1105: update nxp,sja1105.yaml reference
>   MAINTAINERS: update mtd-physmap.yaml reference
>   MAINTAINERS: update arm,vic.yaml reference
>   MAINTAINERS: update aspeed,i2c.yaml reference
>   MAINTAINERS: update faraday,ftrtc010.yaml reference
>   MAINTAINERS: update fsl,fec.yaml reference
>   MAINTAINERS: update mtd-physmap.yaml reference
>   MAINTAINERS: update ti,am654-hbmc.yaml reference
>   MAINTAINERS: update ti,sci.yaml reference
>   MAINTAINERS: update gpio-zynq.yaml reference
>   MAINTAINERS: update arm,pl353-smc.yaml reference
>   MAINTAINERS: update intel,ixp46x-rng.yaml reference
>   MAINTAINERS: update nxp,imx8-jpeg.yaml reference
> 
> [...]

Applied, thanks!

[13/15] MAINTAINERS: update arm,pl353-smc.yaml reference
        commit: e460a86aab669e00c5952a7643665f3096fbfe27

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
