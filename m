Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A81C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 11:12:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D480C61A38
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 11:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D480C61A38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMDcJel5K8XD+j706jGYC8ipp1OgUBQpEGR841YUJZY=; b=udPIjP+HciG6z6
	8JlmZW6R+uQ1Cjc9fm3trqjMPe8iZgz1Sq0/VA8tC/4CoegbICjkFJQvTUhmEJeM+AN/NfaCse/5A
	PgiEuyyJ3dD1NOR8w22otoUvj6B1kNPVwAdbisy82l1seEoj7LleOmS21jQJeX4rrYJf8mGGn+GkY
	r500Fdm7Mkv4FFs/IJ98chlxo6YLYSnY8XOtLA/3YGE8GeBaFhNsGfVci0EtIAPz40KB58R5SiMur
	Q0Tw9GlSYqxvYr49og1vhhtcGXprdqFzlqTz3Fi03PcaIc61YiEIL4B94Lcx3x9ErmfAEf5t9t+0r
	LXC/C6RZ/VHsL5ESKjlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmwNf-001Li6-QR; Tue, 16 Nov 2021 11:12:03 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmwNc-001Lgu-Me
 for linux-mtd@lists.infradead.org; Tue, 16 Nov 2021 11:12:02 +0000
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4168240015
 for <linux-mtd@lists.infradead.org>; Tue, 16 Nov 2021 11:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637061119;
 bh=nrGxaoqv3fyhOTJzGXUVPLJO6wTEQyr0HU27b7o02x0=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=hbrn1t+18qDJd0Ge/O1xdaWLb9IKKjALuvT4agR0ZAbYAZ320fKpc/6tiuFH1WgVN
 Fjx8oVunKf1wT25WlWK75vvbxCR8F8t54rOHyJLFC2ymud2kT6LJ4G9tHYWZN0Igof
 N20C5SkcSRJj/QhHpzzUCATRrQivYg2Sqs2mGjontn5bMzeXDb9uHrbjift/BM3muS
 Rzg3x67vaYb7k8B0CMZA+PgCXdLTWFWq1IYA7jJMEsj8ChTlWdxU2rEK87fNnZxb6+
 duy+C0Ja/sW+pSzPYYMdCXfT4EXFgzocfBU9lHmLzGkAUHGWGZCfmMAgAPDvuKuz7t
 CjjyGh5tvMvTA==
Received: by mail-lj1-f200.google.com with SMTP id
 bn14-20020a05651c178e00b002164a557684so6121765ljb.6
 for <linux-mtd@lists.infradead.org>; Tue, 16 Nov 2021 03:11:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nrGxaoqv3fyhOTJzGXUVPLJO6wTEQyr0HU27b7o02x0=;
 b=sIKaATnSsY0GeFv64a7TUdFGAKRj/d9SRTRTDjCtePvgogWdANpZynx/oArBsZGdHX
 c3OrTJH7a3MhmReh0fbHlhGz7zwjfRxXz15L/thHi00Boje4mL/VbwqYA5PXtNrA6cGt
 8dI7OcQfIwaGVHbws1YGdyt1e2MvW6ptw0vUfcQYkB3lWGXi86buVIK3UtIqrfvX3ICG
 77mq3kpk0MjAkcR/oaHVy+QNGq0x5yjhqVGCs+0/hI/SOwFb6ScRb2D0QvJ9TeVNBRj6
 i/uKbHsnawIH/uISQix23CDPNwMOPU2+KHjYpm/ByLlRr6zCftnsyGqnlV6xUDku8kCw
 O4Ig==
X-Gm-Message-State: AOAM5335Hl77xVO2n/l83GdHO/ZHDnFbYVhkZ08yXdgPPCzIHDsooQ8S
 5I+aUtwZ7tcdEavNv86W3U8ZwpJso/Phh095uSXTCo2URsWSkdARkODD8D/4fwqi1278PNQLYNI
 jKOo6Q6/MauW2G/dpkQ+oP1+kNpVVPTaX7YKULu0ESaE=
X-Received: by 2002:ac2:55a5:: with SMTP id y5mr5719677lfg.468.1637061118566; 
 Tue, 16 Nov 2021 03:11:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFB8CGB99pv7Z7UsgUdq1tSHOm4adL/MVMH5OYqBZECJqMcRYQf5zZBqfhkDpckCfM0VsW7A==
X-Received: by 2002:ac2:55a5:: with SMTP id y5mr5719653lfg.468.1637061118424; 
 Tue, 16 Nov 2021 03:11:58 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl.
 [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id m8sm1724540lfq.27.2021.11.16.03.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:11:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Richard Weinberger <richard@nod.at>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Prabhakar <prabhakar.csengg@gmail.com>, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 7/7] memory: renesas-rpc-if: Add support for
 RZ/G2L
Date: Tue, 16 Nov 2021 12:11:21 +0100
Message-Id: <163706107706.69862.835899154165201477.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211025205631.21151-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211025205631.21151-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_031200_915635_46934BFB 
X-CRM114-Status: GOOD (  13.64  )
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

On Mon, 25 Oct 2021 21:56:31 +0100, Lad Prabhakar wrote:
> SPI Multi I/O Bus Controller on RZ/G2L SoC is almost identical to
> the RPC-IF interface found on R-Car Gen3 SoC's.
> 
> This patch adds a new compatible string for the RZ/G2L family so
> that the timing values on RZ/G2L can be adjusted.
> 
> 
> [...]

Applied, thanks!

[7/7] memory: renesas-rpc-if: Add support for RZ/G2L
      commit: b04cc0d912eb80d3c438b11d96ca847c3e77e8ab

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
