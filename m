Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1690C48BDF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 21:11:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 420CC613DD
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 21:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 420CC613DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5DGeMpM6e0oPd2YJxmJVpTDmpT8aRU+H2SOe6t40YSg=; b=ypJCjcHmKIm919
	pROF9xUxVneMnNMXaLExj7eZuacIxRQzECTg9wBUE11OtSQflIfHS/8yJEqtWoN2+tYnxK6DsEgpB
	094vGCfrVori9x2hKVTU/iFARMb3lv97KDFqQmbNh/BG9yOqsktTl0mp06C9zO57VjHqQAIZBiLIm
	UYGC7L26wfEuxmCEBagFobhlCI3YQhk3DsHnVMW1KMFxMoZWzbsEAzDIvY8m0ER2BGlmHFhFFKkm0
	5awQWFvXeHVjfHeLAUH7LmWm28SMHOjKtNQauPjJCgxaUze1tBllKiVAuDTdJZJobqTJdnBJEBmfO
	NRLUY4iYQ/BOSaGMe+xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrRwC-002VRF-GD; Thu, 10 Jun 2021 21:10:04 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrRvs-002VKh-Kv
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 21:09:45 +0000
Received: from mail-wr1-f72.google.com ([209.85.221.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lrRvp-00061q-PQ
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 21:09:41 +0000
Received: by mail-wr1-f72.google.com with SMTP id
 n4-20020a5d42040000b0290119fef97609so1531751wrq.18
 for <linux-mtd@lists.infradead.org>; Thu, 10 Jun 2021 14:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R7dHhHk/1VSEHnHckunpoSrx9SQZwojTmGD0AVXpAUY=;
 b=rZIAEsk00uvrQH+v8BM8YKjRcAyYEi2qxtuSUPBjeh+mokrRqoc+6LIR1mbnlITze1
 GkR3wWT4Bl+1/Tg7znNfPy/jz+d8sNlnsp2w4jR8smOg0Zky2+2VWdkCuqFHX5lhDss7
 mtvLv6mpFnK046f5spmJlvd+y9CuTSQM8J860Jms2YSUb5YsnHPh7UKUBkc9/NvDYndr
 Cvf5Xd269PuUiavmzdklBE7w7uUVkjvC+3vu9N5Nq45pgUCrhZJy06JYs/kcM4JbItez
 NE5Ppc43Y8DHha0QxUaABg5YjQMSzMgjP6PfW/TObFbaL8dxTPU1eHfkZNG2gsVyh/Ws
 XeXg==
X-Gm-Message-State: AOAM533ScuXImU1q+887f6Ev3wdJ6P7KeAff9ZycKVj6TDeRnnTJaBcy
 HHp5hzH9Kgx6HgbqbTynYMrkg0/YTyJ2TXCSetZHpiQ1SJnyE8OyCnFQF/rmSFRB0PkV8PqlxfY
 NKmkI3+mnNmLvzqEMpoQDhREdquXFPG0szFkwD/nrbpA=
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr16882068wmj.25.1623359381494; 
 Thu, 10 Jun 2021 14:09:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwuBYl5ka+FTgmYctjFQ69Ays85JexobkPCaXjfZdlopIM7Ho2aBDPnhA9G0ICv+aj0gxbTQ==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr16882058wmj.25.1623359381310; 
 Thu, 10 Jun 2021 14:09:41 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id q5sm4914800wrm.15.2021.06.10.14.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:09:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Michal Simek <monstr@monstr.eu>, Srinivas Goud <sgoud@xilinx.com>,
 linux-arm-kernel@lists.infradead.org,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>, helmut.grohne@intenta.de,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v23 00/18] ARM Primecell PL35x support
Date: Thu, 10 Jun 2021 23:09:38 +0200
Message-Id: <162335936799.3768.17631711223949577836.b4-ty@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210610082040.2075611-1-miquel.raynal@bootlin.com>
References: <20210610082040.2075611-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_140944_707958_40E7BA60 
X-CRM114-Status: GOOD (  10.48  )
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

On Thu, 10 Jun 2021 10:20:22 +0200, Miquel Raynal wrote:
> I am taking over Naga's series, here are the major changes:
> * Cleaning of the SMC bus binding file (and yaml conversion)
> * Superficial cleaning and great simplification of the SMC bus driver
> * Addition of a yaml file describing the NAND controller
> * Full rework of the NAND controller driver. JFFS2 and UBIFS not tested
>   yet, only bare test tools have been used to proove basic correctness
>   of the helpers.
> * Addition of a couple of MAINTAINERS entries.
> 
> [...]

Applied, thanks!

[09/18] dt-binding: memory: pl353-smc: Convert to yaml
        commit: d3d0e1e857110a2f8147b1aa3a045b1fccc1e7c3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
