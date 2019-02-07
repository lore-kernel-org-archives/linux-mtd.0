Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_ADSP_ALL,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D442C282C4
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 23:50:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4846421917
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 23:50:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OcFYthjN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="G/h5QGKZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4846421917
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=quOdXllCLbWezGSwQ9qW1SBtt/fZJT63wzmKjQY65M8=; b=OcFYthjNoLOe4Q
	j+1sMt2AFQ+g9ON1qiI47kaOWk9veUNqt5TlKiK7BdSEmEQ0s5Vw40nMCV+XRYEBu7vyV3sbxsW1Q
	NmSyhJDaiwOjpwOf815jiyUyTiTbjwZdPrvhQNGjZ9wv7o7FUcex5Z9802OE7FgiNRdB0hhjQxuxv
	Nit5+7J5FDGXIiZO7Ipgc4FDK0UGvqyayHr8Esb9w4gh720NZZSRDt51PiWXD+wl5N1bnDy9bOu94
	FPp/1+LruWQOQrwKvwRgqGtAIAPBsPSkLNE8waanT/waiA3wRO5WNqrGXwoKREfVxlkNTvtrk2H5G
	zZLfafuAEMtxvcU8NkyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grtRR-0001y5-Nq; Thu, 07 Feb 2019 23:50:49 +0000
Received: from smtp-fw-9102.amazon.com ([207.171.184.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grtRN-0001x7-TC
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 23:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1549583445; x=1581119445;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ejLmcIlfLO0Ssh23QOb4ogmjBngZo6L2DAcjdrS9wDQ=;
 b=G/h5QGKZcSvYHJ0W6ERgU8hO3N0TRuBgMimUnNTDI2lVdCh+npxgHIir
 F7ZewMag/R7mezK6JwR+8cQNgjJf0R3DB1YNdtCtDgJEBxN8Rb8qUv4y9
 EA9TUIuCl5JilzQX6wij1BbfkgESyCI6ZuzuHOJdp/EO7lJwludnhlK0f Y=;
X-IronPort-AV: E=Sophos;i="5.58,345,1544486400"; d="scan'208";a="658326734"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 07 Feb 2019 23:50:39 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id DF3D2A20B6; Thu,  7 Feb 2019 23:50:35 +0000 (UTC)
Received: from EX13D07UWA003.ant.amazon.com (10.43.160.35) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 7 Feb 2019 23:50:35 +0000
Received: from EX13D07UWA001.ant.amazon.com (10.43.160.145) by
 EX13D07UWA003.ant.amazon.com (10.43.160.35) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 7 Feb 2019 23:50:34 +0000
Received: from EX13D07UWA001.ant.amazon.com ([10.43.160.145]) by
 EX13D07UWA001.ant.amazon.com ([10.43.160.145]) with mapi id 15.00.1367.000;
 Thu, 7 Feb 2019 23:50:34 +0000
From: "Sobon, Przemyslaw" <psobon@amazon.com>
To: "ikegami_to@yahoo.co.jp" <ikegami_to@yahoo.co.jp>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: RE: Re: [PATCH] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
Thread-Topic: Re: [PATCH] cfi: fix deadloop in cfi_cmdset_0002.c
 do_write_buffer
Thread-Index: AQHUu5pgPuG2fN5WMEykck2gQhFtIaXNv4mAgAQNLxCAAkIwgIAA64iAgAALp4A=
Date: Thu, 7 Feb 2019 23:50:34 +0000
Message-ID: <632ed76bd3844ceab75066d1f30a7115@EX13D07UWA001.ant.amazon.com>
References: <1548977439-318904-1-git-send-email-liujian56@huawei.com>
 <20190203092645.18d1495b@bbrezillon> <20190203093509.269bf1e1@bbrezillon>
 <acd16b85676e4d1d89f3acfbeda30107@EX13D07UWA001.ant.amazon.com>
 <20190207095635.0fc3b411@kernel.org>
 <193621849.44066.1549580387922.JavaMail.yahoo@mail.yahoo.co.jp>
In-Reply-To: <193621849.44066.1549580387922.JavaMail.yahoo@mail.yahoo.co.jp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.161.164]
MIME-Version: 1.0
Precedence: Bulk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_155046_038338_4E93DDCA 
X-CRM114-Status: GOOD (  30.79  )
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
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "ikegami@allied-telesis.co.jp" <ikegami@allied-telesis.co.jp>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "joakim.tjernlund@infinera.com" <joakim.tjernlund@infinera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, Liu Jian <liujian56@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Ikegami,

I have seen a case myself where a value was written, chip changed
state to "ready" but when I was reading the value was incorrect.
This can happen as result of intermittent issue with flash. It is
hard to fall into scenario when testing on limited number of devices
but with large enough population you can see that. Another situation
is when a flash chip reaches its maximum number of writes. So for
example a chip is designed for 100k writes to a page. Once you 
reach that number of writes you can have invalid data written to
flash but chip itself reports everything was good and switches to
"ready" state.

Hope this explanation is clear. Please let me know.

Regards,
Przemek

> -----Original Message-----
> From: ikegami_to@yahoo.co.jp <ikegami_to@yahoo.co.jp> 
> Sent: Thursday, February 7, 2019 3:00 PM
> 
> Hi Przemek-san,
> 
> Could you please explain the case detail that the value is written incorrectly?
> I think that the value is only written correctly except a bug.
> 
> Regards,
> Ikegami
> 
> --- boris.brezillon@collabora.com wrote --- :
> > Hi Sobon,
> > 
> > On Tue, 5 Feb 2019 22:28:44 +0000
> > "Sobon, Przemyslaw" <psobon@amazon.com> wrote:
> > 
> > > > From: Boris Brezillon <bbrezillon@kernel.org>
> > > > Sent: Sunday, February 3, 2019 12:35 AM
> > > > > +Przemyslaw
> > > > > 
> > > > > On Fri, 1 Feb 2019 07:30:39 +0800 Liu Jian 
> > > > > <liujian56@huawei.com> wrote:
> > > > >   
> > > > > > In function do_write_buffer(), in the for loop, there is a 
> > > > > > case
> > > > > > chip_ready() returns 1 while chip_good() returns 0, so it 
> > > > > > never break the loop.
> > > > > > To fix this, chip_good() is enough and it should timeout if it 
> > > > > > stay bad for a while.
> > > > > 
> > > > > Looks like Przemyslaw reported and fixed the same problem.
> > > > >   
> > > > > > 
> > > > > > Fixes: dfeae1073583(mtd: cfi_cmdset_0002: Change write buffer 
> > > > > > to check correct value)
> > > > > 
> > > > > Can you put the Fixes tag on a single, and the format is
> > > > > 
> > > > > Fixes: <hash> ("message")
> > > > >   
> > > > > > Signed-off-by: Yi Huaijie <yihuaijie@huawei.com>
> > > > > > Signed-off-by: Liu Jian <liujian56@huawei.com>
> > > > > 
> > > > > [1]http://patchwork.ozlabs.org/patch/1025566/
> > > > >   
> > > > > > ---
> > > > > >  drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
> > > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > > > b/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > > > index 72428b6..818e94b 100644
> > > > > > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > > > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > > > @@ -1876,14 +1876,14 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
> > > > > >              continue;
> > > > > >          }
> > > > > >  
> > > > > > -        if (time_after(jiffies, timeo) && !chip_ready(map, adr))
> > > > > > -            break;
> > > > > > -
> > > > > >          if (chip_good(map, adr, datum)) {
> > > > > >              xip_enable(map, chip, adr);
> > > > > >              goto op_done;
> > > > > >          }
> > > > > >  
> > > > > > +        if (time_after(jiffies, timeo))
> > > > > > +            break;
> > > > > > +
> > > > > >          /* Latency issues. Drop the lock, wait a while and retry */
> > > > > >          UDELAY(map, chip, adr, 1);
> > > > > >      }
> > > > >   
> > > > 
> > > > BTW, the patch itself looks good to me. Ikegami, can you confirm it does the right thing?
> > > > 
> > > > Thanks,
> > > > 
> > > > Boris
> > > >   
> > > 
> > > One comment to this patch. If value is written incorrectly quickly 
> > > we will be stuck in the loop even though nothing is going to change. 
> > > For example a value was written incorrectly after 1us, the loop was 
> > > set to 1ms, function will return after 1ms, this solution is not 
> > > optimized for performance. I considered same when working on this change and decided to do it different way.
> > 
> > Seems like you're right if we assume that checking for GOOD state does 
> > not require a delay after the READY check, but if that's not the case 
> > and an extra delay is actually required, you might end up with a BAD 
> > status while it could have turned GOOD at some point with the 'check 
> > only for GOOD state until we timeout' approach.
> > 
> > TBH, I don't know how CFI flashes work, so I'll let you guys sort this 
> > out.
> > 
> > Regards,
> > 
> > Boris
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > 
> 
>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
