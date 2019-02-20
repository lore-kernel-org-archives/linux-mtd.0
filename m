Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF35AC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 08:03:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B95FA2146E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 08:03:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ttDaQggS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B95FA2146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U8Oh4uj3dCgcqy7J5aJ/5UTJJu70Bm6Q25Rwf0PpM8M=; b=ttDaQggSCN6qer
	A9T2tNoyLfqPgpR00AaebSv/Qme7WkcTMGndqF5vqWhDd+ull7OgJ3v3jNpHN0AQRgV05U/aT9NoY
	Kyqg9czYK2p4DnOBC+1iWX4a9z1kMJEc8Ycteo/WgWMUmt8Y9mxSsS5OUKghzqDH2E31zb1C+TVgI
	ERPoQJxxIYVuNrCqFEj2sdP7ZrC0oDrbfDQB0JS9P2NeUa5r3kqCy6i1B/AF9BeeK2G9GF3EiU3Qq
	wrKvcnONcdGsG4fqzDD98t9oMwspVZ+jNRJWyEQJ6odSv12Pe27Uu/y+ypPv5Vnj9Pj0KbdDU4JVe
	POXMsLfwENGL4gu9eiUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwMqn-0004s6-Mj; Wed, 20 Feb 2019 08:03:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwMqk-0004rO-8n
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 08:03:27 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E1E1C260F7F;
 Wed, 20 Feb 2019 08:03:23 +0000 (GMT)
Date: Wed, 20 Feb 2019 09:03:20 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>
Subject: Re: mtd: cfi: Fixed endless loop problem in CFI when value was
 written but corrupted.
Message-ID: <20190220090320.01aa2357@collabora.com>
In-Reply-To: <f5d597dd-d09d-b8f8-a800-756a23954164@alliedtelesis.co.nz>
References: <20190207235806.GA39580@dev-dsk-psobon-2c-1dd9f399.us-west-2.amazon.com>
 <e945b943b2204d4d927391ffd068491d@svr-chch-ex1.atlnz.lc>
 <20190219085946.64a1bd39@kernel.org>
 <f5d597dd-d09d-b8f8-a800-756a23954164@alliedtelesis.co.nz>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_000326_441009_B250C1A3 
X-CRM114-Status: GOOD (  18.09  )
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
 Przemyslaw Sobon <psobon@amazon.com>,
 Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "liujian56@huawei.com" <liujian56@huawei.com>,
 "fbettoni@gmail.com" <fbettoni@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 19 Feb 2019 20:02:37 +0000
Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz> wrote:

> On 19/02/19 9:00 PM, Boris Brezillon wrote:
> > On Thu, 14 Feb 2019 00:39:09 +0000
> > Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:
> >  
> >> Hi All,
> >>
> >> On 8/02/19 12:58 PM, Przemyslaw Sobon wrote:  
> >>> Fixes: dfeae1073583(mtd: cfi_cmdset_0002: Change write buffer to
> >>>          check correct value)
> >>>
> >>> There was an endless loop in CFI Flash driver when a value was written
> >>> incorrectly. In such case chip_ready returns true but chip_good returns
> >>> false and we never get out of the loop.
> >>>
> >>> The solution was to break the loop in 2 cases, either device is ready or
> >>> device is not ready and timeout elapsed. The correctness of the write is
> >>> checked after the loop ended. That way we ensure the loop always ends.
> >>>
> >>> Signed-off-by: Przemyslaw Sobon <psobon@amazon.com>  
> >> Mark (cc'd) has done some testing here, and assuming he's happy with the
> >> forgery.
> >>
> >> Tested-by: Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>  
> > I'm a bit lost. Ikegami told us that checking for chip_ready() was not
> > enough and chip_good() could return true after a few tests even though
> > it initially returned false.
> >
> > I'd really like to get that fixed, but it looks like you haven't reached
> > a consensus on what the appropriate fix is :-/.  
> I have done some further testing and this patch doesn't work 100%. It
> appears at least some flash chips do not start toggling immediately, and
> therefore chip_ready() can return true early. A timeout is reported,
> even though that isn't what happened.
> 
> chip_good() makes an additional check over chip_ready() and is the call
> I believe we should be using. I will submit a new patch which should fix
> the infinite loop as well as not mis-reporting errors.

No, please, don't do that. We already have 3 versions of the same fix
floating around (one from Ikegami, one from Liu Jian and another one
from Przemyslaw). Can you please sync and submit a single patch that
all of you agree on?


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
