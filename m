Return-Path: <SRS0=j3xG=SL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F759C10F0E
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 09:55:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E21520830
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 09:55:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D3U8s+Q2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E21520830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YtlwTXh1GE1nSJJg6gJ6LidPJaNP5CRsluGNiwbZ3c0=; b=D3U8s+Q2BJTB9Q
	z+7+A7yvihIdUeiVv1OQ/SBx7Vkt1WYdvTaFswLpsEqVcNFZU427APYCLQVnwnvS3rLaDAI933Yr8
	VkqPH7KRy2l8Gyfzz6XBL345X2nMVzCBSH8ILFMOxpCZQn/zOEHy4n89f9veNXVlCUZYMFky8CMok
	HB/9fQB9nHnnXZmJRiJFb9lzKKrhtVFuyMrNdnP06ALjlVJQSmjtDaYb/YvBKft5Stkd9kLMdgtpn
	Gn3EbZWoE7wlQIaaWqYb/URkrV32IodAfZMj4phMJ1HmFo5hWzX1P4PticmT+gmVITiwdAOayYmV8
	yHiSw3RlLeg6vpiJDRtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDnT1-0003gb-ID; Tue, 09 Apr 2019 09:54:59 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDnSK-0002jS-NG
 for linux-mtd@lists.infradead.org; Tue, 09 Apr 2019 09:54:20 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3B8092820D9;
 Tue,  9 Apr 2019 10:54:15 +0100 (BST)
Date: Tue, 9 Apr 2019 11:54:12 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mtd: rawnand: constify elements of
 NAND_OP_PARSER(_PATTERN)
Message-ID: <20190409115412.48c758d3@collabora.com>
In-Reply-To: <20190409045332.5452-1-yamada.masahiro@socionext.com>
References: <20190409045332.5452-1-yamada.masahiro@socionext.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_025417_189719_50DA30A0 
X-CRM114-Status: GOOD (  16.42  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue,  9 Apr 2019 13:53:32 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Currently, drivers are able to constify a nand_op_parser array,
> but not nand_op_parser_pattern and nand_op_parser_pattern_elem
> since they are instantiated by using the NAND_OP_PARSER(_PATTERN).
> 
> Add 'const' to them in order to move more driver data from .data to
> .rodata section.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
> 
>  include/linux/mtd/rawnand.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index b7445a44a814..ebde52088e4d 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -805,7 +805,7 @@ struct nand_op_parser_pattern {
>  #define NAND_OP_PARSER_PATTERN(_exec, ...)							\
>  	{											\
>  		.exec = _exec,									\
> -		.elems = (struct nand_op_parser_pattern_elem[]) { __VA_ARGS__ },		\
> +		.elems = (const struct nand_op_parser_pattern_elem[]) { __VA_ARGS__ },		\
>  		.nelems = sizeof((struct nand_op_parser_pattern_elem[]) { __VA_ARGS__ }) /	\
>  			  sizeof(struct nand_op_parser_pattern_elem),				\
>  	}
> @@ -831,7 +831,7 @@ struct nand_op_parser {
>  
>  #define NAND_OP_PARSER(...)									\
>  	{											\
> -		.patterns = (struct nand_op_parser_pattern[]) { __VA_ARGS__ },			\
> +		.patterns = (const struct nand_op_parser_pattern[]) { __VA_ARGS__ },		\
>  		.npatterns = sizeof((struct nand_op_parser_pattern[]) { __VA_ARGS__ }) /	\
>  			     sizeof(struct nand_op_parser_pattern),				\
>  	}


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
