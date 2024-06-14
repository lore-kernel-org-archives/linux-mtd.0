Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F325C27C6E
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jun 2024 20:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUc2hAy/i7cGAVWTU58gagZSdWU+wU/63YAS3ltJlig=; b=Smpk3zgGlWgXOO
	SfHJnIeRaTS3FWKXrjihfP+Tdj9AsyVV6b1m1Kyc/DOVEGUqZ+HwA+FAADNYZHBTPXWs56pZE1MFY
	luHRwoMbtk+1JIwKSMZQ6JfDbz30Q2ok9DasZ6rMSW+FW8KLnyhHlCHQHQ8TxywU+lpcaM0u+hB/8
	EUa+3oP890VyNoC1lYYjXUF3w3NgM0o5TRQvTj/k/NZlZNAUhurE6kn/ydg2/dkpA8PpBVEMHTOPd
	hvyFjHvPFrh/moU7Yx1KT0ZcHyBoeiibnmyZD55hjvB04j7SiwG8gC7Ow6TBU0a5hEq2B4gsIVH2e
	ICHcRRoi3nErYri7576w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIDBy-00000003wbg-38o6;
	Fri, 14 Jun 2024 20:06:34 +0000
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIDBt-00000003wbD-12Dh;
	Fri, 14 Jun 2024 20:06:29 +0000
Message-ID: <65e8b991-84cb-4ff6-8daf-943ed0b5daa4@infradead.org>
Date: Fri, 14 Jun 2024 13:06:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: Remove unused "spia_*" kernel parameters
To: Thomas Huth <thuth@redhat.com>, linux-doc@vger.kernel.org,
 Alexander Shiyan <shc_work@mail.ru>, Olof Johansson <olof@lixom.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-mtd@lists.infradead.org
References: <20240614184041.601056-1-thuth@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240614184041.601056-1-thuth@redhat.com>
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



On 6/14/24 11:40 AM, Thomas Huth wrote:
> The kernel module parameters "spia_io_base", "spia_fio_base",
> "spia_pedr" and "spia_peddr" have been removed via commit e377ca1e32f6
> ("ARM: clps711x: p720t: Special driver for handling NAND memory is removed").
> Time to remove them from the documentation now, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/admin-guide/kernel-parameters.txt | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index ff02e1a02e12..dd8436c98735 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6273,11 +6273,6 @@
>  			Not specifying this option is equivalent to
>  			spec_store_bypass_disable=auto.
>  
> -	spia_io_base=	[HW,MTD]
> -	spia_fio_base=
> -	spia_pedr=
> -	spia_peddr=
> -
>  	split_lock_detect=
>  			[X86] Enable split lock detection or bus lock detection
>  

-- 
~Randy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
