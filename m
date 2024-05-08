Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A96C19F4F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2024 14:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+hG5VPJcEkl2C3tKKTv8yqEyuAHtiB2EKzumhQofWn8=; b=pJfARDVgbWu4pe
	olDmq+9AyhSHtMbDxQ7I36eq0l1YoARS8ApCu7Zos/So6y0xnZCNFMq6Zn+OeNLegAcAlWNqikvdM
	XYsztAcINPl/SmzghFQtDlPa31ohA3cPnvpEF6tYPDnHuyEEbs6km94Qhd63ppm3ggZMcJr8m/i5a
	/oB9qmwNjHxFu26UbO6eOjOjwZ28SA6qP2prH4wlgIW2ocHwgQzxAzT73eDx50RunuoqWqt2X22tL
	oHH93YgcjEYPF5Ij0HSXR9sO87bjtJhDlg8rK+L+8RMewefbCZCYOOwidNhSaC4dbFoAnTtkbUhxM
	5D8JsY1CpPHf4+gJvt5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4hz4-0000000FnRI-0f3r;
	Wed, 08 May 2024 14:09:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4hyv-0000000FnOq-2NKK;
	Wed, 08 May 2024 14:09:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 31151CE12EA;
	Wed,  8 May 2024 14:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E100C113CC;
	Wed,  8 May 2024 14:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715177353;
	bh=VZyUtgn7CSrqZqD2WXaMMzb6R5zKmx5KV+opHAphR2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfK55lXIxxm/5TEJWNmw3vYYan6hnJpce8FOxpJnul6TMsmsdOk7CmNCaHYXaOobc
	 pa5rpx0Jd0c5mg/SyIYRivD8ofsnFlUBpyE2Va4NH7ZxymuNaGhwpUxSZYfB2RJ7sI
	 KbvYvutvUYdtmv3zLRpKMUjZ1/X17Sm5tqd9VhkCKU0tiUJF6o8N+yIDi1t8q1a48O
	 51vQYjhGDcswN4zd/4iBPrFuD5lQb/DSm0ULYs9ytwRvV1f7S9cAmunIAilmKkYN3s
	 8/aDsad/YDxVTA4PmV5g3jydDY5244NkvnQdQAeWt2kv+k8lGqmPn5/9E5NPaqdong
	 avbGNizqPHUMQ==
Date: Wed, 8 May 2024 09:09:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, oxffffaa@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, kernel@sberdevices.ru,
	Jerome Brunet <jbrunet@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
Message-ID: <171517732606.1572649.16193191353725811830.robh@kernel.org>
References: <20240507230903.3399594-1-avkrasnov@salutedevices.com>
 <20240507230903.3399594-2-avkrasnov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240507230903.3399594-2-avkrasnov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_070917_811571_005BA983 
X-CRM114-Status: GOOD (  14.32  )
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


On Wed, 08 May 2024 02:09:01 +0300, Arseniy Krasnov wrote:
> Boot ROM code on Meson requires that some pages on NAND must be written
> in special mode: "short" ECC mode where each block is 384 bytes and
> scrambling mode is on. Such pages are located on the chip in the
> following way (for example):
> 
> [ p0 ][ p1 ][ p2 ][ p3 ][ p4 ][ p5 ][ p6 ][ p7 ] ... [ pN ]
>   ^           ^           ^           ^
> 
> pX is page number "X". "^" means "special" page used by boot ROM - e.g.
> every 2nd page in the range of [0, 7]. Step (2 in example is set by
> 'amlogic,boot-page-step' field. Last page in range (7 in example) is
> set by 'amlogic,boot-pages' field.
> 
> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
> ---
>  .../bindings/mtd/amlogic,meson-nand.yaml       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
