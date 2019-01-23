Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB01AC282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 09:53:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 866F020861
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 09:53:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="heh3IsoO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAOQb4aL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 866F020861
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9HQheIzEb5KGqkNs01EUBWrHXMK6eFSuKa8XU90fc8=; b=heh3IsoOVexOyN
	NnC8L5RTNUWQ0zkBasSjC8ldbr85jPYB6M2abkFR3XhOfFWhBPavh8AfKDwfVdNhwNJ1fbQY8Sggg
	fgBOm+fZBHsmSbHsLXJjx4i5JN4S3s66aKsBLayzg51Ak2hcdVpPndkxHBaDgCrUIwCWoTfWVi6h6
	dp5R0AXTtoLSRNboslCaLopgUmiSuXvZSMdfC3i9RCcClasn90NbpX1g/NbvcXU7qiFH8VUHSKXo7
	qVCNNLFZ+WKGpyRm9N3r7RUOFYeGeM+E7KUVGpsHGXszH8/WnhAPUVZhoAII1MoFjVIKjADSfkRaF
	fb0b1VF14MTv3uCCjtMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmFDV-000380-O0; Wed, 23 Jan 2019 09:53:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmFDT-00037K-1s
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 09:53:04 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D22220861;
 Wed, 23 Jan 2019 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548237182;
 bh=HF9eJMFJxhcLLoRHjywiWFMXig3DHPntZ6ReryupSo4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AAOQb4aL46H8730kX9v8dQYrlcrWKckmvMVuCxONgxV1uj7voN9aChjhPj3+lsUKS
 c+wSCwluwefmmiIER48K8je53BT9nk+1LXOmQ+YoV6k3eyWxDPyeIuniZ1KKpNS/ts
 B/7H/E0voNVMlPBfZe44gXjjtd+wgPXFklpfEP+g=
Date: Wed, 23 Jan 2019 10:52:53 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] mtd: docg3: Fix passing zero to 'PTR_ERR' warning
 in doc_probe_device
Message-ID: <20190123105253.1f4487f2@bbrezillon>
In-Reply-To: <86533285-e800-5cc0-f495-88fff8326b5a@huawei.com>
References: <20190123065827.16748-1-yuehaibing@huawei.com>
 <20190123101253.243add9d@bbrezillon>
 <86533285-e800-5cc0-f495-88fff8326b5a@huawei.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_015303_108983_7864D36C 
X-CRM114-Status: GOOD (  15.54  )
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
Cc: robert.jarzmik@free.fr, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, richard@nod.at, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 23 Jan 2019 17:43:58 +0800
YueHaibing <yuehaibing@huawei.com> wrote:

> On 2019/1/23 17:12, Boris Brezillon wrote:
> > On Wed, 23 Jan 2019 14:58:27 +0800
> > YueHaibing <yuehaibing@huawei.com> wrote:
> >   
> >> Fix a static code checker warning:
> >> drivers/mtd/devices/docg3.c:1875
> >>  doc_probe_device() warn: passing zero to 'ERR_PTR'
> >>
> >> Fixes: ae9d4934b2d7 ("mtd: docg3: add multiple floor support")
> >> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> >> ---
> >>  drivers/mtd/devices/docg3.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> >> index 4c94fc0..60ddc38 100644
> >> --- a/drivers/mtd/devices/docg3.c
> >> +++ b/drivers/mtd/devices/docg3.c
> >> @@ -1872,7 +1872,7 @@ doc_probe_device(struct docg3_cascade *cascade, int floor, struct device *dev)
> >>  nomem2:
> >>  	kfree(docg3);
> >>  nomem1:
> >> -	return ERR_PTR(ret);
> >> +	return ret ? ERR_PTR(ret) : NULL;
> >>  }
> >>    
> > 
> > This is not the right fix, you should instead set ret to -EINVAL:  
> 
> Thanks , will fix it in v2.
> 
> And seems doc_probe_device cannot return NULL. The NULL check of doc_probe_device
> in docg3_probe also can been removed, right?

Hm, looks like the ret = 0 was intentional (to identify when ID is
invalid). Let's just keep your initial patch.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
