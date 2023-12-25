Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746BCC3DA6E
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Dec 2023 07:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nrA/gSnwp8A1tKMJvM6E1YsuhXVnRq0oOzfdr9NAXJk=; b=fxDeofiR/NhpZT
	ns4KwqQYLIGfaFuyTRaYNjfxA+NfyPfIbyzb+JpeNSntKM91AGt6aQYPBWq4OLG3zmBO0Z3myitJ5
	MTbeWJDLh0Bib3y9I8ajk/557IS8+GCrvPrym9rIzemEjYgl5JX68fLa6Bgix6uPVQ2HSdN9vS2Xo
	ii8QFqTMseHVdKNfkTrT0syWyQGaEZ0bBxUVyfuSO9eRUcbsIc8e6Zo5X/K0awms6qWW1ROek+PMw
	5DjvZHtZ/dfi/HMme1zF7j/IlM8XATsmP8LsmU8slIIGR5dRPtrRiitw3sTHz2clUCg6gMmKWDkqd
	RmwPR0Ywica9yYwt6wQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHfF3-00AKsy-2E;
	Mon, 25 Dec 2023 07:19:13 +0000
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rHfF0-00AKsg-0j;
	Mon, 25 Dec 2023 07:19:10 +0000
Message-ID: <3464b187-d280-4b7f-8187-123dc51ad0c3@infradead.org>
Date: Sun, 24 Dec 2023 23:19:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] ubi: Use the fault injection framework to enhance
 the fault injection capability
Content-Language: en-US
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, richard@nod.at,
 miquel.raynal@bootlin.com, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 chengzhihao1@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com
References: <20231225071055.1721000-1-wangzhaolong1@huawei.com>
 <20231225071055.1721000-2-wangzhaolong1@huawei.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231225071055.1721000-2-wangzhaolong1@huawei.com>
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

Hi--

On 12/24/23 23:10, ZhaoLong Wang wrote:
> diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
> index 2ed77b7b3fcb..138fae7e8f96 100644
> --- a/drivers/mtd/ubi/Kconfig
> +++ b/drivers/mtd/ubi/Kconfig
> @@ -104,4 +104,13 @@ config MTD_UBI_BLOCK
>  
>  	   If in doubt, say "N".
>  
> +config MTD_UBI_FAULT_INJECTION
> +	bool "Fault injection capability of UBI device"
> +	default n
> +	depends on FAULT_INJECTION_DEBUG_FS
> +	help
> +	   this option enable fault-injection support for UBI devices for

	   This option enables

> +	   testing purposes.
> +
> +	   If in doubt, say "N".

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
