Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C19C54E8D
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 15:38:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F0BE206E6
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 15:38:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E14CLNGD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F0BE206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yv2VR9pNokG/yQb1hbVSVXjbuzWAnAplEHmsjasLjUk=; b=E14CLNGD3U0FmI
	g1l42pFZyiYvduleBcj0YvAOFaGfhZw/uHyg6zFpyAc96hhtyP46SIef/KU8JMtisLBHFT8LxpRMT
	aEqTMzq0bcRasqQEea5MhOgjydDpCnFIL/Rr3iiA2WK78lm+jQdgDv9g78yP7kMxnT4xjZxauiQQW
	cd78A7Pb8KeIo1Tm2DmWu+L3nypsZH2q5noNUnRcA1OvXQ0druB4Rgn1xoa78INDFeZRz7wShhljx
	x5HM+Po04MBVh9Ku10LipHWjUaZQyOnhiEaYfDhxMAtVyG/pLzmK/O6YYLZ3ISeSPmp8jp/aUGBcq
	3n7FOnlmgL1nESnYJPGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYAVn-00021R-6x; Mon, 11 May 2020 15:38:35 +0000
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYAVl-000217-Mp; Mon, 11 May 2020 15:38:33 +0000
Subject: Re: [PATCH v7 11/18] pstore/zone,blk: Add console frontend support
To: Kees Cook <keescook@chromium.org>,
 WeiXiong Liao <liaoweixiong@allwinnertech.com>
References: <20200510202436.63222-1-keescook@chromium.org>
 <20200510202436.63222-12-keescook@chromium.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <db0ae27c-8e96-9b85-9526-920800da4755@infradead.org>
Date: Mon, 11 May 2020 08:38:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200510202436.63222-12-keescook@chromium.org>
Content-Language: en-US
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Colin Cross <ccross@android.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 5/10/20 1:24 PM, Kees Cook wrote:
> diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
> index f18cd126d83f..f1484f751c5e 100644
> --- a/fs/pstore/Kconfig
> +++ b/fs/pstore/Kconfig
> @@ -236,3 +236,15 @@ config PSTORE_BLK_PMSG_SIZE
>  
>  	  NOTE that, both Kconfig and module parameters can configure
>  	  pstore/blk, but module parameters have priority over Kconfig.
> +
> +config PSTORE_BLK_CONSOLE_SIZE
> +	int "Size in Kbytes of console to store"

maybe	                    of console log to store"

since my console size is not measured in Kbytes.

> +	depends on PSTORE_BLK
> +	depends on PSTORE_CONSOLE
> +	default 64
> +	help
> +	  This just sets size of console (console_size) for pstore/blk. The

	                         console log

> +	  size is in KB and must be a multiple of 4.
> +
> +	  NOTE that, both Kconfig and module parameters can configure
> +	  pstore/blk, but module parameters have priority over Kconfig.


-- 
~Randy


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
