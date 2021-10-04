Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192B6C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 18:31:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D873C61381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 18:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D873C61381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yv0X9CFucTwhNCU614/IwdJ8c2NTgOsS4Dg8CjQEgOg=; b=dG1bHoxiNDE7Mo
	P2nDucupSKKOdAZXufPznF2fcsrVdR3tt3VIiYMGlYoC7biawqLLGTga47wPxU85X3UE13RwmMvG9
	f2OmVujGGxGw5jgcJrjfzZ3IT2agjvceXRVDSql33y7MM9Rq+lM3svPakiejffkUXAO5Y57MOq7KC
	tfiG93XsKhYQIRknvVpsb3eLp7ufjHSOU8GiNCot0e7Sl1fhXPjSpnNWtqDObblk6YRxmo8uCS1fp
	s6w9u/noZMwE9UMdPRyvQ7JUUXxJNfB4rPlsL1rS/pio6s68Ic0VfAjOCByDPDd0fh++8ltbS1GDB
	v2q4Tj0jrN9SaAU/lv+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXSjL-007gYQ-3t; Mon, 04 Oct 2021 18:30:27 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXSjI-007gXW-MA
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 18:30:26 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 d12-20020a05683025cc00b0054d8486c6b8so22849151otu.0
 for <linux-mtd@lists.infradead.org>; Mon, 04 Oct 2021 11:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+Hga8p58pr2bFvROm6q0SXOaz+V7BKKQwphrn3bK5nQ=;
 b=qboJB51IkltQLHEK7y9l9lx9OXyZ4TG/YBn7/CI796VmwxVyKtKuY+jkjH43shPJL4
 Frv2heZjvmANQ85R5BUQ1h21Y0eLMtviHkmG4y6yzcLXDk7Wo8AtM5tldPuasAKlUFkn
 s/Fna4Co+bOd8ZJnVmtOYzOvNEs3RwTaXJCLGvT3g9S3fugzCJCRC0hADCSWnBXc2bSJ
 gGGZvJWKzrLnG6nT+lYFrrjBIOfU/Y6tWcEl7vPubittpihYzqX+vxP+W10Me0ki1DkV
 ZyQFn6xVvU8JcDu95FRGQfa0SvX+lNqo+OHFI0ndtFoEXGagIZVObHmPpvqGwyAFWslo
 l9fw==
X-Gm-Message-State: AOAM530A9SOA57bk6/vFKMjj68iWaijNiEB3V/SbN94Ql/6zn1ftaGgF
 a17V/eubnOQ4iw1RTJop6g==
X-Google-Smtp-Source: ABdhPJwwbNKoiwstW+77MUhfqKv75Q2Zy4WCYXvf8PuP96jj8q/xMG8t7An/cJMI3Fhl9mh1pIsSNg==
X-Received: by 2002:a05:6830:40b0:: with SMTP id
 x48mr10673721ott.246.1633372223776; 
 Mon, 04 Oct 2021 11:30:23 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 17sm2814736ois.45.2021.10.04.11.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 11:30:23 -0700 (PDT)
Received: (nullmailer pid 1615342 invoked by uid 1000);
 Mon, 04 Oct 2021 18:30:22 -0000
Date: Mon, 4 Oct 2021 13:30:22 -0500
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-spi@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Richard Weinberger <richard@nod.at>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 1/6] dt-bindings: memory: renesas, rpc-if: Add support for
 the R9A07G044
Message-ID: <YVtIPqHyi/z03yxS@robh.at.kernel.org>
References: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210928140721.8805-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928140721.8805-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_113024_748789_7B84FE47 
X-CRM114-Status: GOOD (  13.28  )
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

On Tue, 28 Sep 2021 15:07:16 +0100, Lad Prabhakar wrote:
> SPI Multi I/O Bus Controller on RZ/G2L SoC is almost identical to
> the RPC-IF interface found on R-Car Gen3 SoC's.
> 
> This patch adds a new compatible string to identify the RZ/G2L family
> so that the timing values on RZ/G2L can be adjusted.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../memory-controllers/renesas,rpc-if.yaml    | 51 ++++++++++++++-----
>  1 file changed, 37 insertions(+), 14 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
