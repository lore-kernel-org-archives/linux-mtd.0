Return-Path: <SRS0=/ENy=75=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B2BEC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2020 20:00:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 372C7206F1
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2020 20:00:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TnpCeFU6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="WhqH5S0f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 372C7206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iLVf/r3yc3MlvYP3XjrC8tIc38QeX7pr9Fw3sVg+79U=; b=TnpCeFU6eQHIjo
	8EFEQlafRfSZos/QV82oRI5R8nRsqadcoNxR5orb1kqFjBP0KmNojPkFIxgIaKCVoW7aaB2MI77P3
	IkIyVTp8bKrTPZ3SACAzijpYdYPSz0ZiDCHiUYDFqHOmon3vTWgxUH+xl5La6PFUhe7egz2Pz3wk/
	BtwM1XGlHrh8whQKsHJXXxg+nB3beJBD2YwB3hCKbepLOdrfaZ9Z1IYzzxPCpwHtVgmQOtUpRIAu4
	AFsY5rjJugOooxD5JnJt+h42Z36IrJHCSALAnkAuNXav7/pxPSL9moZBJidrbo96kfMot0I6BPX4f
	c72yR23ypJlUmngPydIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlHkx-00043a-CW; Tue, 16 Jun 2020 20:00:27 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlHku-000433-CG
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2020 20:00:25 +0000
Received: by mail-lj1-x22f.google.com with SMTP id x18so54808lji.1
 for <linux-mtd@lists.infradead.org>; Tue, 16 Jun 2020 13:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=BmSBD7h3njitpLi5QsmTDnHJWiGkucDb02pMa3UrBRI=;
 b=WhqH5S0fm4kJwR2Us6nTMFyavpr+p2ob9Rh92WurpdcnnW5dg4ylnEawx9M3rYu501
 d4GfjWWMYHeTubZjlkm4f02fv5NNyjqtykLc+PaQIFEYXzuZ8q37LAxd71Yfce3XRm1E
 agmR/gKyan3/H8rWKzJvDHDLW/cDk0Y8E1iguSPdKAECAJgAjD96Xat6TCetvIpDyOJ2
 A9zPP4Gku7Nd4TI4lCddOFavCkmP+z6JUCfXrJbzslogeCEwe5GBtXxDY6835ZdMBZTs
 SmDAl+uMz9DZT0zSNM3bLpOxSwCB2QmprJxY1rhM2mf1RmMGX5voK9sF7YGACEuKmaSj
 T1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=BmSBD7h3njitpLi5QsmTDnHJWiGkucDb02pMa3UrBRI=;
 b=O99lUKumhQRp1hbPxlg8jetXBDJYbdptviyyxvjknKNYu2JJXgPz1fE3vfauZG2XK9
 JjscB8WYr2vhRDSi5OhSWrYFwTIhQ3SoH86q6esm+DkAF+vmJygUIw8DQIsOfQItDBww
 VvV/fPNnEmhuMfHKpsKUqo+8fm73wbSyvL6MIYc4x8mggcjok8FGqcxh4NkAr9ay6fSF
 e+3o/KdNVfpB7AnnqVK8Uki/Nuh5vowlJBiEiCjeNcUHQSyPwWQwmKjFqI8LUyVtoZjZ
 j+njOQuLlFe5G379MlMGYXgLdb6oOjOka2K67WNxiJbLgZCXmgNDLn25ZDt/sdhwQASF
 y2+A==
X-Gm-Message-State: AOAM531kkfkcJVemYE7lw2Zazp6RH/havDAqXNEviieSZWkF0YP5JHmH
 jjtEcgMeKArsYortI6MtNdqf5A==
X-Google-Smtp-Source: ABdhPJy8D91PJpYVXRICr86OQToa9hkNd7RwcHACmvb8FHbjd7ERv0jv9sQ0T5ab4xzjIL4LEGIIZw==
X-Received: by 2002:a2e:a495:: with SMTP id h21mr2286305lji.436.1592337622099; 
 Tue, 16 Jun 2020 13:00:22 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:44fe:a796:a57:d8fd:42a6:762c])
 by smtp.gmail.com with ESMTPSA id b26sm5480405lfp.40.2020.06.16.13.00.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jun 2020 13:00:21 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v5 0/2] Add Renesas RPC-IF support
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Organization: Cogent Embedded
Message-ID: <9969c8a1-e6be-38a9-ced5-ce8c5ff07046@cogentembedded.com>
Date: Tue, 16 Jun 2020 23:00:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_130024_619311_466A07CA 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Mason Yang <masonccyang@mxic.com.tw>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

Here's a set of 2 patches against Linus' repo. Renesas Reduced Pin Count
Interface (RPC-IF) allows a SPI flash or HyperFlash connected to the SoC
to be accessed via the external address space read mode or the manual mode.
The memory controller driver for RPC-IF registers either SPI or HyperFLash
subdevice, depending on the contents of the device tree subnode; it also
provides the abstract "back end" API that can be used by the "front end"
SPI/MTD drivers to talk to the real hardware...

Based on the original patch by Mason Yang <masonccyang@mxic.com.tw>.

[1/2] dt-bindings: memory: document Renesas RPC-IF bindings
[2/2] memory: add Renesas RPC-IF driver

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
