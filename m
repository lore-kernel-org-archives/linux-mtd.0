Return-Path: <SRS0=oU9n=QV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F92CC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 16:19:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C0D020823
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 16:19:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TXsG4OVa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C0D020823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=quPJzdLv/4ONOLHyEAOCxeN774GpsbTvdAfqrjTiAIc=; b=TXsG4OVaHKnpVx
	pM+s43827XeOq3aPLc7682/aYaW57oLY5R89XV/UeZ0UWT/sbxMC0ZcWvLQBx3WGqmDbIsDUar9Ce
	zQ9igwNwSEf1bvyUuNA+4H8J/GvHKPI9isuyzqaKk3a+qCHjUemWn6hDjSnamNY/CwzkjWmtDLLVg
	/uWPpri3UlAiP18vj1sOI2Yi58U3vr/8AwUD7S+6OWcm8e+9agFxtZOcfYQ/jnHWIIHRPZMtpdgLB
	RyD0ASVtk5lOGUyKrgejkf8joYDCcfJkWpG1Qx4O22aQD20GA7uIjqK7p/tNidFrziEbayxC64DDW
	06HkIyheXpvCg6cVsW6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guJjb-0004YJ-TM; Thu, 14 Feb 2019 16:19:35 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guJjW-0004Ws-7n
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2019 16:19:34 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1CDBD608A38C;
 Thu, 14 Feb 2019 17:19:19 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id lU7zeNdkkCqP; Thu, 14 Feb 2019 17:19:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C2195608A390;
 Thu, 14 Feb 2019 17:19:18 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id P3Y0kUFtnXVO; Thu, 14 Feb 2019 17:19:18 +0100 (CET)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 73AEC608A38C;
 Thu, 14 Feb 2019 17:19:18 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Matt Schepers <mschepers@telspandata.com>,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: Re: mtd utilities work but ubi utilities do not?
Date: Thu, 14 Feb 2019 17:19:17 +0100
Message-ID: <20954772.kKhKk3QR9J@blindfold>
In-Reply-To: <DM6PR16MB26650DE0AA34A9F80441B5ECB0670@DM6PR16MB2665.namprd16.prod.outlook.com>
References: <DM6PR16MB266514008732CC2ECF6C5257B0660@DM6PR16MB2665.namprd16.prod.outlook.com>
 <CAFLxGvzeD=zoWWK3tGy8R9=Dkfq+SorMGDn5gNADsHqZmg-2Ow@mail.gmail.com>
 <DM6PR16MB26650DE0AA34A9F80441B5ECB0670@DM6PR16MB2665.namprd16.prod.outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_081931_525443_BB9F9F17 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Matt,

Am Donnerstag, 14. Februar 2019, 16:56:32 CET schrieb Matt Schepers:
> Richard, 
> 
> It could be the case that it is a problem with partial page/reads writes in the driver. Is there a quick way to completely disable this and see? I have already tried setting the VID offset in ubiattach but I get the same error described before.

Yes, set NAND_NO_SUBPAGE_WRITE and make sure that NAND_SUBPAGE_READ is not set.

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
