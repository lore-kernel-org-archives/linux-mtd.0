Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F266FC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 10:33:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7F4761BE6
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 10:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7F4761BE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsIdV8nAfv/jJKdohrrdqLZzIZ+2BDiP7vmudOyqK24=; b=AUsXf6YLy1imZh
	mFm+ljYJL6IJhzZCWA4bEIqlxvNYHqtlg8GSGtx9q2i3F28a5dl9G4vshbTFy2R7I7DrMotN5Jb3u
	X07v+XtQ8pQ2pm5KE2evPN/r71+H5X6EHm882utARrLCzN/x8xXrRQ+6h+QJLad7W9EyCxZFP0d4v
	zP4ZxGmYAOCX0MGIihgrCoiXnZMeyovrJwYuCWLtnAFrQnBpkQapY6YjFQ7cL7dfWjrHVDzU8g8RG
	vqCtjc1a/ywPIjpz9yCJRVF3o7pHJ8CmQwlSb/v9qBdofuBXgZhI/F+uKG+yk1/dcsIHUSFhzmhvM
	bBrsRhd32meVVIkErnxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmvmD-001DBt-1g; Tue, 16 Nov 2021 10:33:21 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmvm4-001D90-SU
 for linux-mtd@lists.infradead.org; Tue, 16 Nov 2021 10:33:16 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 45C093F1AD
 for <linux-mtd@lists.infradead.org>; Tue, 16 Nov 2021 10:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637058787;
 bh=9Le9vThg2zYYZ4FT+Lsh8JZmnjsCqwGI+kiP40c27ZQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=R+54iYerD3XUe0bho3L2AEPDUBTwpTJsRvL6Z6hVfdLPKVFfNNx+nwjDgYZ8qqF51
 C/t2i2mIeYEdtMDPfn8RSPLirEuDuWpMH8NDwLVfy5ruPaWMJkFZCaqEl1ZnDxQEmI
 DFrEt+qf7QxWGzp9Lq8TMgyplU/0q/CJPxU5UxX4Pn1wGow1Wg8ga+HKcogj1g8592
 h3hQET6ea2/zIHQmZFI8ovCP3lMdkkqMNplheIUiEselpNUHUAqOduSkeA4HN6F2oe
 yNefAGATRZgQSG0X8i8JbDmn4DM1lbBKy9d2LqrNGWqoF0jRNk9iGsdBhCRkd+cQ+I
 ulzqdtH+P7FWw==
Received: by mail-lf1-f69.google.com with SMTP id
 c15-20020a05651200cf00b0040524451deeso3573877lfp.20
 for <linux-mtd@lists.infradead.org>; Tue, 16 Nov 2021 02:33:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9Le9vThg2zYYZ4FT+Lsh8JZmnjsCqwGI+kiP40c27ZQ=;
 b=Uqt5lZ9bURnX3i2i+dr3qdGzl2yWVp/5uN4KqNaqBdZ5QEG7qt0SBe4NE2dTwdATdV
 XcjnnDEt1YHPsa2ab5x5LsLqLoTk9bHYu4JnN04RYqMWfdc0094gHNUg6rRlw3vzoHS4
 V5jvBm0DUfGt9mxc3HwNftA1f/InXR9/eJBqjsid5UiOvktDYHdFqLgpxhNIjO1KmnQ1
 vxZ1tTepa/Xh2HHNcjLRkDTgDrrZrVRpJbRFEgvmV50sukVOV1AJvhNmtVhTngoUJwqW
 uUwtrIt5fFwXMu1tMqpTF0+3O4TnUgAOCN/9g8Fmh2/5h9xAPjxZqGKvX4V+FJp09qtK
 GH8g==
X-Gm-Message-State: AOAM531n5Js1Uyslv7IHRH75txHGKJKRszmsdCDJmAvj6Hxf4GBH6upG
 ad5Wk/UI5YMNy1Y6cMiVZMcXqUVxWIO1MuuaiZ4fjjrKtr2J6XKaxCKKbYA3LjxmYeC0ZGjhY44
 kAQM/CrNSvTkLtft5pd4DPElRhYte4WI4szYErVT9GPc=
X-Received: by 2002:ac2:5dc2:: with SMTP id x2mr5601484lfq.228.1637058786583; 
 Tue, 16 Nov 2021 02:33:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPHWqAmG6+W2LmzevHiirWdaFqHMhmEygAsdCaVQYS7N7sZyD1DqEoJyS2ahO2I8igQ/Bl5w==
X-Received: by 2002:ac2:5dc2:: with SMTP id x2mr5601460lfq.228.1637058786409; 
 Tue, 16 Nov 2021 02:33:06 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 p3sm1717385lft.66.2021.11.16.02.33.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 02:33:06 -0800 (PST)
Message-ID: <a8b126e6-62e7-7979-01cb-b7a1ce4ae8d1@canonical.com>
Date: Tue, 16 Nov 2021 11:33:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 0/7] Add SPI Multi I/O Bus Controller support for RZ/G2L
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_023313_143855_FF3F266E 
X-CRM114-Status: GOOD (  18.01  )
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

On 25/10/2021 22:56, Lad Prabhakar wrote:
> Hi All,
> 
> This patch series adds a couple of fixes for rpc-if driver and
> adds support for RZ/G2L SoC, where the SPI Multi I/O Bus Controller
> is identical to the RPC-IF block found on R-Car Gen3 SoC's.
> 
> Cheers,
> Prabhakar
> 
> Changes for v2:
> * Rebased the patches on linux-next
> * Split patch 5 from v1
> * Included RB tags
> * Fixed review comments pointed by Wolfram
> 
> v1:
> https://patchwork.kernel.org/project/linux-renesas-soc/cover/
> 20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> Lad Prabhakar (7):
>   dt-bindings: memory: renesas,rpc-if: Add support for the R9A07G044
>   dt-bindings: memory: renesas,rpc-if: Add optional interrupts property
>   spi: spi-rpc-if: Check return value of rpcif_sw_init()
>   mtd: hyperbus: rpc-if: Check return value of rpcif_sw_init()
>   memory: renesas-rpc-if: Return error in case devm_ioremap_resource()
>     fails
>   memory: renesas-rpc-if: Drop usage of RPCIF_DIRMAP_SIZE macro
>   memory: renesas-rpc-if: Add support for RZ/G2L
> 

Applied parts 1, 2, 5 and 6. I think 7 is going to have a new version
due to Wolfram's comments?


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
