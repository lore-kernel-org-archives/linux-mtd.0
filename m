Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35FAC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 21:46:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80D76208DB
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 21:46:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="obzUGNt1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80D76208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yl3FXLk7iNE/X7I7TTJYSn+Wecdsr2AHcMH/IGy7HSo=; b=obzUGNt1u13Vus
	TKM3B5itWuZLGlMR6DqBc6CvOQjcvcFNNzLzBehUNOpelL1p5F4D2bLBEOqrHIQ1NWljuG9+6zrYq
	PHMuS+TwsY1Ye/0IsbHkv4F6n3wekic1RVwBLTyc18gimMXey0W/HGGaKOFH7sMjzXr6Y+cf9fIO3
	g9pCAem8S0/tRzkCCr3QeHTTheN2kkfhm+E60xSguT+sgy+VaCO1oyZGOoZ0NOiaijjBxRNDgGqPJ
	/c85TJl8B1GBQ+XlpqDGWPka5w5ynWHJ6J1Tfu576GV8mKrvkhN0imGphycGfkpLqKx/469TsbUpT
	TeyS8/Py0Zv4UwrZp84Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeQLf-0007t3-NV; Thu, 28 May 2020 21:45:59 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeQLS-0007g3-CJ
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 21:45:47 +0000
Received: by mail-io1-f65.google.com with SMTP id q8so124946iow.7
 for <linux-mtd@lists.infradead.org>; Thu, 28 May 2020 14:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=no6HlcdcFcA/a4l7oGUTR6aVzXC2MXn/zYF87og1wYg=;
 b=Uw0AXD9fn5y1FVgnoCisxNbhlKtWK464PIZnPgxu7/C2Fg+3AemnHJhcswP6d7SGPr
 /qCaYAhklG15xm3nshPKiy1Se0jThewQ4R+VVxcHBcGxLnmyNIrxWjEofjJUFYkurEar
 SiB8Bk8tLJPxhDnPHk3VFr1Te9mqzmK2KMal+NGDu52Hb/xqYgBzvd8/SG0+TMpPOfAh
 fefkkaB1jk66mdzY1x95NrMq9qQRLxb+lGAWaUbrXp9kZBURmsEhwktwbgqUUik77Hqz
 HYN1rJ/WbKlOje6rTZkzVTsQ9LrxIU7gAaLGtBxcYZJDmCFk/r9sTRHPUTLB42bdQF7w
 ACDQ==
X-Gm-Message-State: AOAM533U+zbkRs9ENrWMy5FuD7S2Q7tTz12UdG72icw8PMRAyfIi6KbX
 Nh5oBRs2S7sZQiwq7bIC7Q==
X-Google-Smtp-Source: ABdhPJzYXYmo9Aia4JUtPNGct0ALVvFbsn1fqj9BKNroCD9lDsLRuNfCbwzH+Nr0bgOoa2MCjhqxyA==
X-Received: by 2002:a05:6602:2001:: with SMTP id
 y1mr3953649iod.94.1590702345570; 
 Thu, 28 May 2020 14:45:45 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id 129sm2877005ioy.0.2020.05.28.14.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 14:45:45 -0700 (PDT)
Received: (nullmailer pid 739310 invoked by uid 1000);
 Thu, 28 May 2020 21:45:44 -0000
Date: Thu, 28 May 2020 15:45:44 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 3/3] dt-bindings: mtd: Convert ingenic, jz4780-nand.txt
 to YAML
Message-ID: <20200528214544.GA739281@bogus>
References: <20200520002234.418025-1-paul@crapouillou.net>
 <20200520002234.418025-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520002234.418025-3-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_144546_461231_5C0256CE 
X-CRM114-Status: UNSURE (   9.70  )
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
Cc: devicetree@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-gpio@vger.kernel.org, od@zcrc.me, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 20 May 2020 02:22:34 +0200, Paul Cercueil wrote:
> Convert the ingenic,jz4780-nand.txt doc file to ingenic,nand.yaml.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2: - Don't include ingenic,nemc-client.yaml which is gone
>     	- Use 'partitions' property instead of '^partitions$' pattern
> 
>  .../bindings/mtd/ingenic,jz4780-nand.txt      |  92 ------------
>  .../devicetree/bindings/mtd/ingenic,nand.yaml | 132 ++++++++++++++++++
>  2 files changed, 132 insertions(+), 92 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
> 

Applied, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
