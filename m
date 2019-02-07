Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6E5C282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 08:56:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B75F20818
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 08:56:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X90AEKF/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B75F20818
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYOiRtX5tXTPFqO5f+ICTfIni2Ybxzt1llSR1aM2RQQ=; b=X90AEKF/6uYlt8
	2v9LlBCklsS2g28g06kvAdrHEubgA1/hIYdgs03Bjk7cby5vSz5Rd75G2Ncmd4hrjp2jtkixV+JrM
	T4Nrj/SQG93L6HLDm1TuaiuogwzUAy3JvYYrrulCdgP63FHQJcQJpKueyCJO1NJ5DYfiF9JL5KPoS
	cI1BIaFz5G6OVlzDZS41dk/VxO+Qh7vCwE2Zrts0/kvH/2UrSoWDOfRQIStnZsFn85/5dlLKG7z4t
	Jx8J8o5FIZRne51S8hjNWjEeNdCRM3vX39ybCu/IPDSsm1vt2hsnniPbXbs7+3joZxAxb51Hvz6y1
	5Ve0N5D4HPMah4D+h7Hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grfUM-0004n4-DW; Thu, 07 Feb 2019 08:56:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grfUJ-0004mW-TS
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 08:56:53 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1BB2227DFBF;
 Thu,  7 Feb 2019 08:56:50 +0000 (GMT)
Date: Thu, 7 Feb 2019 09:56:47 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Sobon, Przemyslaw" <psobon@amazon.com>
Subject: Re: [PATCH] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
Message-ID: <20190207095635.0fc3b411@kernel.org>
In-Reply-To: <acd16b85676e4d1d89f3acfbeda30107@EX13D07UWA001.ant.amazon.com>
References: <1548977439-318904-1-git-send-email-liujian56@huawei.com>
 <20190203092645.18d1495b@bbrezillon>
 <20190203093509.269bf1e1@bbrezillon>
 <acd16b85676e4d1d89f3acfbeda30107@EX13D07UWA001.ant.amazon.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_005652_216337_97506487 
X-CRM114-Status: GOOD (  26.73  )
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
Cc: "keescook@chromium.org" <keescook@chromium.org>,
 "joakim.tjernlund@infinera.com" <joakim.tjernlund@infinera.com>,
 "ikegami@allied-telesis.co.jp" <ikegami@allied-telesis.co.jp>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, Liu Jian <liujian56@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sobon,

On Tue, 5 Feb 2019 22:28:44 +0000
"Sobon, Przemyslaw" <psobon@amazon.com> wrote:

> > From: Boris Brezillon <bbrezillon@kernel.org> 
> > Sent: Sunday, February 3, 2019 12:35 AM  
> > > +Przemyslaw
> > > 
> > > On Fri, 1 Feb 2019 07:30:39 +0800
> > > Liu Jian <liujian56@huawei.com> wrote:
> > >   
> > > > In function do_write_buffer(), in the for loop, there is a case
> > > > chip_ready() returns 1 while chip_good() returns 0, so it never 
> > > > break the loop.
> > > > To fix this, chip_good() is enough and it should timeout if it stay 
> > > > bad for a while.  
> > > 
> > > Looks like Przemyslaw reported and fixed the same problem.
> > >   
> > > > 
> > > > Fixes: dfeae1073583(mtd: cfi_cmdset_0002: Change write buffer to 
> > > > check correct value)  
> > > 
> > > Can you put the Fixes tag on a single, and the format is
> > > 
> > > Fixes: <hash> ("message")
> > >   
> > > > Signed-off-by: Yi Huaijie <yihuaijie@huawei.com>
> > > > Signed-off-by: Liu Jian <liujian56@huawei.com>  
> > > 
> > > [1]http://patchwork.ozlabs.org/patch/1025566/
> > >   
> > > > ---
> > > >  drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c 
> > > > b/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > index 72428b6..818e94b 100644
> > > > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > @@ -1876,14 +1876,14 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
> > > >  			continue;
> > > >  		}
> > > >  
> > > > -		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
> > > > -			break;
> > > > -
> > > >  		if (chip_good(map, adr, datum)) {
> > > >  			xip_enable(map, chip, adr);
> > > >  			goto op_done;
> > > >  		}
> > > >  
> > > > +		if (time_after(jiffies, timeo))
> > > > +			break;
> > > > +
> > > >  		/* Latency issues. Drop the lock, wait a while and retry */
> > > >  		UDELAY(map, chip, adr, 1);
> > > >  	}  
> > >   
> > 
> > BTW, the patch itself looks good to me. Ikegami, can you confirm it does the right thing?
> > 
> > Thanks,
> > 
> > Boris
> >   
> 
> One comment to this patch. If value is written incorrectly quickly we will be
> stuck in the loop even though nothing is going to change. For example a value was
> written incorrectly after 1us, the loop was set to 1ms, function will return
> after 1ms, this solution is not optimized for performance. I considered same
> when working on this change and decided to do it different way.

Seems like you're right if we assume that checking for GOOD state does
not require a delay after the READY check, but if that's not the case
and an extra delay is actually required, you might end up with a BAD
status while it could have turned GOOD at some point with the 'check
only for GOOD state until we timeout' approach.

TBH, I don't know how CFI flashes work, so I'll let you guys sort this
out.

Regards,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
