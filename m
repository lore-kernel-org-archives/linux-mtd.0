Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_ADSP_ALL,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0677C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 22:29:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B2952077B
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 22:29:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Prakzetk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="q2qYkkPT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B2952077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ef/V0WKypsJH6yCJEm1/WrfToTcYun0GdkQqNI+ndD4=; b=PrakzetksZonVU
	Xk/L+IU2ODvsep8R07KHvIXC0UtaOdCxdkQxfgoAj4rjR7KYBgZ4KYmSil9l7gxPv4FqVZCjAHhDW
	sWlJD3ffypCBFtmbvBpAl/EbExYt2bATgjJGzPf1GcMqF5lk4VkdiWYd5eYsqtO+n7nGD5YJVBmYn
	ib/wC3uRQgS+iHcOCmTWXYgeWHfDMAc30pdDDVkTRT4b3fMNyUV2tXq3WeCPD7Ac38BxgOULUt2Qg
	fsB3YiTbkOneJwjPTA5LRLBa4pvZ2XTouTejZdU8+C6UDBzz11VoPSgaaGA4M6E6sQmFL5F2qaKP9
	fSo4IVX7N1eoy+39DQrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr9DQ-0008U6-Bo; Tue, 05 Feb 2019 22:29:16 +0000
Received: from smtp-fw-9101.amazon.com ([207.171.184.25])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr9DH-0008Ek-8v
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 22:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1549405747; x=1580941747;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rr6CC+Hrts3G9hUS+X5B8K994y9vEmdnUo7Xt/xUcf4=;
 b=q2qYkkPTR1/sEOvqsYGNjI+In87bRS7D8HEZuNYKGOeKHLikTgw090nP
 dhV9gR3TyMgYJbDbBx1Ii2kSbFeCIHgeJKBobWtvqihY4/0KcD2gT1PUq
 JQ7dSzKAad+0RxcmpqY2QJYmZqwvMix0BZDrIO76G6y6/DgRytTs3/mgq 0=;
X-IronPort-AV: E=Sophos;i="5.58,337,1544486400"; d="scan'208";a="785870197"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 05 Feb 2019 22:28:46 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id A4DC5A2487; Tue,  5 Feb 2019 22:28:45 +0000 (UTC)
Received: from EX13D07UWA001.ant.amazon.com (10.43.160.145) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 5 Feb 2019 22:28:45 +0000
Received: from EX13D07UWA001.ant.amazon.com (10.43.160.145) by
 EX13D07UWA001.ant.amazon.com (10.43.160.145) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 5 Feb 2019 22:28:44 +0000
Received: from EX13D07UWA001.ant.amazon.com ([10.43.160.145]) by
 EX13D07UWA001.ant.amazon.com ([10.43.160.145]) with mapi id 15.00.1367.000;
 Tue, 5 Feb 2019 22:28:44 +0000
From: "Sobon, Przemyslaw" <psobon@amazon.com>
To: Boris Brezillon <bbrezillon@kernel.org>, Liu Jian <liujian56@huawei.com>, 
 "ikegami@allied-telesis.co.jp" <ikegami@allied-telesis.co.jp>
Subject: RE: [PATCH] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
Thread-Topic: [PATCH] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
Thread-Index: AQHUu5pgPuG2fN5WMEykck2gQhFtIaXNv4mAgAQNLxA=
Date: Tue, 5 Feb 2019 22:28:44 +0000
Message-ID: <acd16b85676e4d1d89f3acfbeda30107@EX13D07UWA001.ant.amazon.com>
References: <1548977439-318904-1-git-send-email-liujian56@huawei.com>
 <20190203092645.18d1495b@bbrezillon> <20190203093509.269bf1e1@bbrezillon>
In-Reply-To: <20190203093509.269bf1e1@bbrezillon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.162.180]
MIME-Version: 1.0
Precedence: Bulk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_142907_514544_58B225E3 
X-CRM114-Status: GOOD (  20.55  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "keescook@chromium.org" <keescook@chromium.org>,
 "joakim.tjernlund@infinera.com" <joakim.tjernlund@infinera.com>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> From: Boris Brezillon <bbrezillon@kernel.org> 
> Sent: Sunday, February 3, 2019 12:35 AM
> > +Przemyslaw
> > 
> > On Fri, 1 Feb 2019 07:30:39 +0800
> > Liu Jian <liujian56@huawei.com> wrote:
> > 
> > > In function do_write_buffer(), in the for loop, there is a case
> > > chip_ready() returns 1 while chip_good() returns 0, so it never 
> > > break the loop.
> > > To fix this, chip_good() is enough and it should timeout if it stay 
> > > bad for a while.
> > 
> > Looks like Przemyslaw reported and fixed the same problem.
> > 
> > > 
> > > Fixes: dfeae1073583(mtd: cfi_cmdset_0002: Change write buffer to 
> > > check correct value)
> > 
> > Can you put the Fixes tag on a single, and the format is
> > 
> > Fixes: <hash> ("message")
> > 
> > > Signed-off-by: Yi Huaijie <yihuaijie@huawei.com>
> > > Signed-off-by: Liu Jian <liujian56@huawei.com>
> > 
> > [1]http://patchwork.ozlabs.org/patch/1025566/
> > 
> > > ---
> > >  drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c 
> > > b/drivers/mtd/chips/cfi_cmdset_0002.c
> > > index 72428b6..818e94b 100644
> > > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > > @@ -1876,14 +1876,14 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
> > >  			continue;
> > >  		}
> > >  
> > > -		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
> > > -			break;
> > > -
> > >  		if (chip_good(map, adr, datum)) {
> > >  			xip_enable(map, chip, adr);
> > >  			goto op_done;
> > >  		}
> > >  
> > > +		if (time_after(jiffies, timeo))
> > > +			break;
> > > +
> > >  		/* Latency issues. Drop the lock, wait a while and retry */
> > >  		UDELAY(map, chip, adr, 1);
> > >  	}
> > 
> 
> BTW, the patch itself looks good to me. Ikegami, can you confirm it does the right thing?
> 
> Thanks,
> 
> Boris
> 

One comment to this patch. If value is written incorrectly quickly we will be
stuck in the loop even though nothing is going to change. For example a value was
written incorrectly after 1us, the loop was set to 1ms, function will return
after 1ms, this solution is not optimized for performance. I considered same
when working on this change and decided to do it different way.

Regards,
Przemek

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
