Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470F1C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 18:31:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BCE261381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 18:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BCE261381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UDgPvfMGgXh3TFi/ZU4/No34j7dwAV6RzCuNK3aIRqA=; b=45cmX0nl+pdEKm
	P+4VvoQufEtV2QDvcpjzcCMcxul9jIiFBYAwnnAtiDSd67l+v4Hbn2SxYd1tl4vOPXn8RdHlBJeXP
	DtpixLTF7PYj1BT/devMRtDgVSNU+GfJ3WaoLq/mCwcg05Sr8rl2MjgVYDnEeUD/5dI2PjONF/FKv
	fLxEtuYzlYtwYjHxq/pgBxTwrDt3kOqiA1d5bJVSetJ6iCpxZtlDLs13PdKs+299jIsjlG7chfTGe
	tgnoKGuWOoiA3hKnZ9Jht7VdjZS0jo6CLiAiQMHi92O43P+6EHuP9CJQcBCBuJVeze2FEqRF7BM4d
	04e7eon7+bb12W7uZuvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXSjY-007gcN-K8; Mon, 04 Oct 2021 18:30:40 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXSjV-007gb8-6n
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 18:30:38 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so22761359otq.7
 for <linux-mtd@lists.infradead.org>; Mon, 04 Oct 2021 11:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EgPusyLa/5AAFYa6yY1gZl5N0nwwIA+sqa/A5TmSbTw=;
 b=wzF5sBN+m4vPhm9VpTy00SNHKRcdIti5cztTGZOD5Zu17+iyfHFury+RmT0+vVI8Li
 nD5zdeOuloaTOmt/GmiP0aDkwBOMoGeWE0qa+mgxg/vL86bx0oWAnbGIc8+ytlbdcm0U
 cu0dMooJlJoPkKhYplyiNeXwiGhUxDfvf8ZdSmp84/x7F/7XLSVCHpMhNxI0SZbjPflV
 Ruz4DD3cb2E4AAOJOHDWlNwImFqzGRCgv/Cb84s+GDf1czYKNh0SkIF111HbJU5qtnmM
 sZJMCp4OpgJB5hVeQsFo/YHSV/c+5S5J6Ljlmb4E0QTthp6uAX+3TPLY2Ql3ENWnKVZR
 6PBw==
X-Gm-Message-State: AOAM533ZQoM7wKB311pcvy+5cLRYU/Wou15JkP2F9hokgNvHBaM5pr6x
 G1a+J2p7fIEfY/qmSyD0vw==
X-Google-Smtp-Source: ABdhPJylK2zM8ZBzjb/VuvgJd36umt1ITGM8Rr7KONWnz1nplFDn8bbEertxC5/oBScOiB5/auclxw==
X-Received: by 2002:a05:6830:1514:: with SMTP id
 k20mr10340844otp.44.1633372236265; 
 Mon, 04 Oct 2021 11:30:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s189sm2284253oif.14.2021.10.04.11.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 11:30:35 -0700 (PDT)
Received: (nullmailer pid 1615750 invoked by uid 1000);
 Mon, 04 Oct 2021 18:30:33 -0000
Date: Mon, 4 Oct 2021 13:30:33 -0500
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-spi@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 2/6] dt-bindings: memory: renesas,rpc-if: Add optional
 interrupts property
Message-ID: <YVtISflCYbhKZzdJ@robh.at.kernel.org>
References: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210928140721.8805-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928140721.8805-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_113037_288063_692ED1A7 
X-CRM114-Status: UNSURE (   9.88  )
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

On Tue, 28 Sep 2021 15:07:17 +0100, Lad Prabhakar wrote:
> For completeness add optional interrupts property.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../devicetree/bindings/memory-controllers/renesas,rpc-if.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
