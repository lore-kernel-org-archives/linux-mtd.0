Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F94FC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 10:32:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 074C161AF0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 10:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 074C161AF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYOPZK/ZTRFDraoSANQfxmEeYXTdDdlo5zBQR0HScOs=; b=AEFHr3dNkLmn4g
	6zRTDPgO3+NzZKyVKrcjuUb4uUJY9f29wRzCzytHINceNUP7Q1FAsJ8C39J+X5s6bUsRcxal3VBVN
	HUNMwE4I7xHoe7vFhL0ur3um1a08GhJl1TEDDI82h4r4QKzsau54/9r5z9x8T3uRxWPopWkS9wPZU
	33RYk0hM0oRidpNUyb3HsOi6YewEnUvMwYWBjKbdyC+Oa2WU/MULxHyFQovFI6S4hz5Chnjz4jAni
	WLo24t4LikaPnuUtd0TPLe6KQypRk12kRRCfCs3WzpvV34BngJUNOwt4wv7sE+qdEKEPu1+e6JPpC
	8B8it9tqTwxSoLZGCVDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmvki-001Cmk-Bz; Tue, 16 Nov 2021 10:31:48 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmvke-001ClE-KX
 for linux-mtd@lists.infradead.org; Tue, 16 Nov 2021 10:31:46 +0000
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3D1BA405F5
 for <linux-mtd@lists.infradead.org>; Tue, 16 Nov 2021 10:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637058703;
 bh=z+K3n14wNxyJpFthL4d/JKrdOFIgfqkYidh/vwHh0o8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=Se1cPDujcfh+xmtclW5H1YWTw/u8W21jJim8WQFKyovTVAWBfep4ko14C3/EW/Y7V
 kGLyuA3AHRTcgJMR7cFit2M42pS+/8DG696TvqLyAGCRETrujvI9nglhsRmxu/b0HP
 KGuFOgJGbrYBnOeGtFneMtEK00gbRoWP/afc7TPPBaX4uCod6pOJvpf8yOSxWLEozC
 76hopsUzc3Mcbiq7YD9ydV4R/82g/6Go3AEl8YIkOdjgCrzFY/nItO2rOipssX8Sc6
 HzI1BvpKQT6NjEJvap38KWmdk6savcCzfN7ah2L8pF9aidrmK6GcO7SJV1AMq9xsX8
 FNzgxpYT4Zy3Q==
Received: by mail-lj1-f198.google.com with SMTP id
 83-20020a2e0556000000b00218db3260bdso6048581ljf.9
 for <linux-mtd@lists.infradead.org>; Tue, 16 Nov 2021 02:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z+K3n14wNxyJpFthL4d/JKrdOFIgfqkYidh/vwHh0o8=;
 b=OV9K0Od3x56ZkfLAiJAElIaea0LRr5AVypVWZrZYAebLr7bhPgZIOXZg2CSZBiDvGh
 Kpid+5rAN127Of5DYZSBbzZTIFIzJcQNjwbCQcIjnmPb0TWKh/Se1ypF0/6wR136XCqn
 yt7n3fq9Wy3XMLdPvOIPuyj4oHyKcKEZLz09AxCUe67gr7679AF7CfR3VfV05l6djbMZ
 k9xZP/mQxOPvdcuggfKbqfjWtt4QxOqzMZrzdmHL4y3CuC+WBfE8+aAol9qfCi7Rf1e5
 2zXbXATGa88iWXD0YCWmak0d2Dy7QK55UYHxTXd7uEA2YE7l4Vr6/MiU8m38wuUoVIYw
 82pg==
X-Gm-Message-State: AOAM533E105HFVoi9m5vgJB7bm/OUM+YO7/caWCeyKdnU1Sr/SUWu9I0
 oz6GZaA/wixA1TuIZUbyFHfzjyY4kWRsCvbbmyPaIDdZbXnRtDOXbJDu5RH9Jw3vNNNsrr9IGHi
 UWV+w+/xa7jo7VzTLpPpSF0F05k1vIT4wCnYog62QPpc=
X-Received: by 2002:a05:6512:2601:: with SMTP id
 bt1mr5653781lfb.147.1637058702684; 
 Tue, 16 Nov 2021 02:31:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVpknv8td/Cxpbi8ipZR258BpylSboXrsot6U5M9i5s8+zkf0/9R+6Q6RjQtFYrAR4CqJBFg==
X-Received: by 2002:a05:6512:2601:: with SMTP id
 bt1mr5653761lfb.147.1637058702540; 
 Tue, 16 Nov 2021 02:31:42 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl.
 [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id j5sm1114418lfe.219.2021.11.16.02.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 02:31:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/7] dt-bindings: memory: renesas,
 rpc-if: Add support for the R9A07G044
Date: Tue, 16 Nov 2021 11:31:02 +0100
Message-Id: <163705866144.26823.6564269821681639208.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211025205631.21151-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211025205631.21151-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_023144_842333_5870B161 
X-CRM114-Status: GOOD (  13.77  )
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

On Mon, 25 Oct 2021 21:56:25 +0100, Lad Prabhakar wrote:
> SPI Multi I/O Bus Controller on RZ/G2L SoC is almost identical to
> the RPC-IF interface found on R-Car Gen3 SoC's.
> 
> This patch adds a new compatible string to identify the RZ/G2L family
> so that the timing values on RZ/G2L can be adjusted.
> 
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: memory: renesas,rpc-if: Add support for the R9A07G044
      commit: c271aa1f73515bcb35f977f30825832d41a2f504

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
