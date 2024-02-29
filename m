Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5234C48BF6
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Feb 2024 06:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLh8NPPJY6LnDSZXBYWIRcAApBmoJFC6FzIqIXHXuqA=; b=3x+OTZ6K57Pz5w
	GyBwFrIt6qErLETof2Gn8R3hGHOTuVRijsAccAlGo3EkDOdbRuctDtzEJ3jQZ53ZPNqmlIiYWwJ1d
	hLcoYgWgO8VlO7N5kQ+H5qF64oiFc8pVVPCtqy3RuHXDaCEJCQINstxjM2Mt+IDTlBJXLEvau/dKW
	VdJ97dIODABZoaSfrNd1VBGRFSrSdoKAQdng4nCqp9e2q0+G4BguIOzLtlHPHy/RpUhJsy0Xa0kuy
	KmqW5EcvqlmSJCpxrskvtyjvBg2dQyyaY6xfzoRRao4kKtKto0+F/QeIN8DbrZECCLtILoCOvJi7a
	yQ4M2w+5InGONFiyyy3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfZTs-0000000CE9s-3RyA;
	Thu, 29 Feb 2024 06:01:20 +0000
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfZTo-0000000CE9N-28XB;
	Thu, 29 Feb 2024 06:01:16 +0000
Message-ID: <d47a817f-11c0-429c-8e9c-9ab0dfa17388@infradead.org>
Date: Wed, 28 Feb 2024 22:01:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mtd: ubi: fix NVMEM over UBI volumes on 32-bit systems
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Richard Weinberger
 <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <ff29447dcee834c17e4e1e99725b9454c90136ca.1709178325.git.daniel@makrotopia.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ff29447dcee834c17e4e1e99725b9454c90136ca.1709178325.git.daniel@makrotopia.org>
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



On 2/28/24 19:47, Daniel Golle wrote:
> A compiler warning related to sizeof(int) != 8 when calling do_div()
> is triggered when building on 32-bit platforms.
> Address this by using integer types having a well-defined size.
> 
> Fixes: 3ce485803da1 ("mtd: ubi: provide NVMEM layer over UBI volumes")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v3: use size_t also for 'to_read' variable to avoid truncation
>     (no problem in practise beyond the compiler warning)
> v2: use size_t for 'bytes_left' variable to match parameter type
> 
>  drivers/mtd/ubi/nvmem.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Works for me. Thanks.

Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
#Randy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
