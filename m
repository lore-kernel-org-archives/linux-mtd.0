Return-Path: <SRS0=Ei3U=Q2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6CDC43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Feb 2019 08:00:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF53A21903
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Feb 2019 08:00:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XL2JAUvL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF53A21903
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ep8f5QBgKJYshC6toEaBEH2dzwpUkeL0ih/0A8Y6wcE=; b=XL2JAUvLctqgGB
	oZsegLXZIroo3q80YEXa+XFQ74087sAQUuuMggqd0xKWXFW9sfthsQdxnAemF8SsnXVSUhoKGGAp4
	+eHmQjZIMDuv3tYXlGgPaNWJRfI3ApgkU0M8FDW7Cm+QiXKz+oOS/jGaB4jcdvpN2NcSYX/G14l6x
	jRdAS0O8OVoaU/8sAmg74unw+rtLNPVyrxvlsi/exG4sGxzEt7aMhLUO4s15kEHGzuCyW/H0IAQXu
	2b48NhK+MiSurFbx2PJ3Zvq9ZcoYSTmEMaBxOGxbpGmY8oILqaBPUx1iPWv/7wD5n8TVEQG+wLS6e
	JTMRhf9PUwKbzlgL447w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gw0K1-0004Yc-Jv; Tue, 19 Feb 2019 08:00:09 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gw0Jx-0003jj-V8
 for linux-mtd@lists.infradead.org; Tue, 19 Feb 2019 08:00:07 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3CFB426DA90;
 Tue, 19 Feb 2019 08:00:04 +0000 (GMT)
Date: Tue, 19 Feb 2019 09:00:01 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: mtd: cfi: Fixed endless loop problem in CFI when value was
 written but corrupted.
Message-ID: <20190219085946.64a1bd39@kernel.org>
In-Reply-To: <e945b943b2204d4d927391ffd068491d@svr-chch-ex1.atlnz.lc>
References: <20190207235806.GA39580@dev-dsk-psobon-2c-1dd9f399.us-west-2.amazon.com>
 <e945b943b2204d4d927391ffd068491d@svr-chch-ex1.atlnz.lc>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190219_000006_154525_8B2B07C5 
X-CRM114-Status: GOOD (  20.98  )
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
Cc: "Joakim.Tjernlund@infinera.com" <Joakim.Tjernlund@infinera.com>,
 "ikegami@allied-telesis.co.jp" <ikegami@allied-telesis.co.jp>,
 Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>,
 Przemyslaw Sobon <psobon@amazon.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "liujian56@huawei.com" <liujian56@huawei.com>,
 "fbettoni@gmail.com" <fbettoni@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 14 Feb 2019 00:39:09 +0000
Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:

> Hi All,
> 
> On 8/02/19 12:58 PM, Przemyslaw Sobon wrote:
> > Fixes: dfeae1073583(mtd: cfi_cmdset_0002: Change write buffer to
> >         check correct value)
> > 
> > There was an endless loop in CFI Flash driver when a value was written
> > incorrectly. In such case chip_ready returns true but chip_good returns
> > false and we never get out of the loop.
> > 
> > The solution was to break the loop in 2 cases, either device is ready or
> > device is not ready and timeout elapsed. The correctness of the write is
> > checked after the loop ended. That way we ensure the loop always ends.
> > 
> > Signed-off-by: Przemyslaw Sobon <psobon@amazon.com>  
> 
> Mark (cc'd) has done some testing here, and assuming he's happy with the 
> forgery.
> 
> Tested-by: Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>

I'm a bit lost. Ikegami told us that checking for chip_ready() was not
enough and chip_good() could return true after a few tests even though
it initially returned false.

I'd really like to get that fixed, but it looks like you haven't reached
a consensus on what the appropriate fix is :-/.

> 
> > ---
> >   drivers/mtd/chips/cfi_cmdset_0002.c | 11 +++++++----
> >   1 file changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> > index 72428b6bfc47..6cc31d2057e9 100644
> > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > @@ -1879,15 +1879,18 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
> >   		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
> >   			break;
> >   
> > -		if (chip_good(map, adr, datum)) {
> > -			xip_enable(map, chip, adr);
> > -			goto op_done;
> > -		}
> > +		if (chip_ready(map, adr))
> > +			break;
> >   
> >   		/* Latency issues. Drop the lock, wait a while and retry */
> >   		UDELAY(map, chip, adr, 1);
> >   	}
> >   
> > +	if (chip_good(map, adr, datum)) {
> > +		xip_enable(map, chip, adr);
> > +		goto op_done;
> > +	}
> > +
> >   	/*
> >   	 * Recovery from write-buffer programming failures requires
> >   	 * the write-to-buffer-reset sequence.  Since the last part
> >   
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
