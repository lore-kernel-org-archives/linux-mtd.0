Return-Path: <SRS0=GKVC=I6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3513C433ED
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 16:17:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6966D61379
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 16:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6966D61379
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lnJXJYQ1IzDCv5ZkYZJJIBWQXRNhx3qnMXONaxX+OgM=; b=KdC2Z2HHyzjKk1BEHM41YAx0s
	jCNvh+TgZCzNcoWtGOgomzSUeq/SCFeeEHEkVdZzTuwlkxU+QRfEpHgYHyh1KrGNcx9E5sR+Q44gX
	nbf/ICrx759WKyW1W1gbIKK3LeTseRf9ef142Wk84UEy1acJ+3cmC4O/d+93dbLTbioaKToDHm8yp
	icjYaykCZGwA5OoZP/G6fveY5p6SmWkmkhYOb5nmUW8YVUYRfk8CUTBT51P+afxtzkxJKc6s7JOfv
	MCj0MJh8lyZFrGMWIWEFTpCX6BLvQHI044BQ9XcLYAb4XQhse6oKywGypy39Mb54Pb38v/oCHHCya
	wVYW9lc+Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRzzF-00ADXQ-F8; Thu, 01 Apr 2021 16:16:01 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRzeK-00A6QN-GX
 for linux-mtd@lists.infradead.org; Thu, 01 Apr 2021 15:54:29 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 909F01F46850;
 Thu,  1 Apr 2021 16:54:23 +0100 (BST)
Date: Thu, 1 Apr 2021 17:54:21 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org
Subject: Re: [PATCH v10 3/4] mtd: rawnand: Add support for secure regions in
 NAND memory
Message-ID: <20210401175421.65db63bf@collabora.com>
In-Reply-To: <20210401151955.143817-4-manivannan.sadhasivam@linaro.org>
References: <20210401151955.143817-1-manivannan.sadhasivam@linaro.org>
 <20210401151955.143817-4-manivannan.sadhasivam@linaro.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_165425_658417_23399F90 
X-CRM114-Status: GOOD (  11.10  )
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

On Thu,  1 Apr 2021 20:49:54 +0530
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:

> @@ -565,6 +608,11 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
>  
>  	if (!chip->bbt)
>  		return 0;
> +
> +	/* Check if the region is secured */
> +	if (nand_region_is_secured(chip, ofs, 0))
> +		return -EIO;

That would is still wrong, you should never pass a 0 size to
nand_region_is_secured().


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
