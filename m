Return-Path: <SRS0=jA3O=QR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3300CC282C2
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Feb 2019 12:56:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB33621841
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Feb 2019 12:56:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BLbCTMLA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB33621841
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4cO9n5d1YCBct9iZLXftQ5RfIkB4TEfmVZIHQKHSLtQ=; b=BLbCTMLAutqAeo
	hAkSIiG+p0S2nGfywp7XyEQ0DihvdXNqw3y8UUEyYkVyK5ylDkzd+Nvcdu/6iD1bpMAeW6JLZXPgX
	YhtZEGGEW5v2YYUpJw19eixkzca+33LYvNwQLSSoaAPryTkDykpMfDjFHQKhe9XPslCVP4UpLTLiw
	uk0LO13I3Kyzf5ep9HdYZ/gNR0PmSPFt38pKj+9I/5DOyOzDDki6nB38Dd9gamBz3DG8WxSdn939y
	qKC10aYrdgIRw5Epc5Drn9Ywga2JhTZurTfl/F92nBEafXK2QA2biwBex+lAoi3dMW3OoCoklTUCN
	lSNRI1PLy8cjWT57TyqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsoeh-0000uV-9b; Sun, 10 Feb 2019 12:56:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsoeS-0000u3-E4
 for linux-mtd@lists.infradead.org; Sun, 10 Feb 2019 12:56:06 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D3B062779F0;
 Sun, 10 Feb 2019 12:55:56 +0000 (GMT)
Date: Sun, 10 Feb 2019 13:55:52 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] drivers/mtd: Use mtd->name when registering
 nvmem device
Message-ID: <20190210135552.65f532bb@collabora.com>
In-Reply-To: <20190208151419.1800-1-aneesh.kumar@linux.ibm.com>
References: <20190208151419.1800-1-aneesh.kumar@linux.ibm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190210_045604_612937_0B095410 
X-CRM114-Status: GOOD (  15.11  )
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
Cc: linuxppc-dev@lists.ozlabs.org, Alban Bedel <albeu@free.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Aneesh,

On Fri,  8 Feb 2019 20:44:18 +0530
"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> With this patch, we use the mtd->name instead of concatenating the name with '0'
> 
> Fixes: c4dfa25ab307 ("mtd: add support for reading MTD devices via the nvmem API")
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

You forgot to Cc the MTD ML and maintainers. Can you please send a new
version?

Thanks,

Boris

> ---
>  drivers/mtd/mtdcore.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 999b705769a8..3ef01baef9b6 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -507,6 +507,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>  {
>  	struct nvmem_config config = {};
>  
> +	config.id = -1;
>  	config.dev = &mtd->dev;
>  	config.name = mtd->name;
>  	config.owner = THIS_MODULE;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
