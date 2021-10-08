Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B08C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 17:51:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94C8E61019
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 17:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94C8E61019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6xJQbM4OxF9x01t5aUy/O0GwxGxa5LDLdlFTNVv/Yv8=; b=XlCIMzZGWuZkr3
	MY2D1XVQqXlkeQsOZMcinuZzpt2YHcyADoUBbQ4zX6ZMcJ6DT1S7ww5Yx9kXni9ikp7oa5AZT++8O
	EBEQt7ba/7M1/CwkWJx3h9mNRlPyk5+1VVy/lzO112tqEyhYMVnwAK5ach2/t6umFIoD78a+Z65tS
	X60+uc6UqSieXsqP2fXJPkT5KzKYv7LmILUZh5ZwnPeEfpHLmyyoCUst3KSPRk4H5h9PXju3oG8sn
	ul4rsM3n/sHRQjcOcvAmC3IFSpsa7wyELH1SinUG/LbUkkTIRryW7jQKxwdHXBtzIwNk1fLPh6Go1
	/s1N+fGAxRa6PBjcPh3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYu0w-003k8F-F8; Fri, 08 Oct 2021 17:50:34 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYu0t-003k7c-HZ
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 17:50:33 +0000
Received: from skn-laptop (_gateway [172.25.0.1])
 by first.geanix.com (Postfix) with ESMTPSA id AA81DC3B66;
 Fri,  8 Oct 2021 17:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1633715429; bh=EawVE9wODTtRpHeuB7Eov1BPNVWZvN+3ycWO3+Qq5Ik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=BTDhV3GPGw27VB/2hapBnyYk1chXXjVdCVirjFEFDGtRf0W8pO1UD36H32kmq+Bj4
 haVBHrq57ONgAl0nr/4wpe4geGBg3TohmcMJodCHTvFID594CEORDtPbORAdmDfjUp
 GvdZNgFTC41UhOMQpqsSGUcPmnbvqg2GkTVk4JBZ+uNtCvUymMi2BHrV2FQnRIMEWG
 hddjjO5EqzQHjZaYTHktlRnKp53Y6VpPz4+pnRE91ZszIUNJG6aNgBo0FAaaoEgYax
 QytNexE71RwdkhjewxvuzPkgdjFVrD8PL+gNT01h/68M15z53OHYzBiORvkA/SZ9W5
 u/S2BnFVFsOSg==
Date: Fri, 8 Oct 2021 19:50:27 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] mtd: core: protect access to mtd devices while
 in suspend
Message-ID: <20211008175027.4eg4qsrcu7nxwplv@skn-laptop>
References: <20211008141524.20ca8219@collabora.com>
 <20211008143825.3717116-1-sean@geanix.com>
 <20211008173526.19745a10@xps13>
 <20211008180811.36c371f5@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211008180811.36c371f5@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_105031_762912_177277CE 
X-CRM114-Status: GOOD (  18.44  )
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

On Fri, Oct 08, 2021 at 06:08:11PM +0200, Boris Brezillon wrote:
> On Fri, 8 Oct 2021 17:35:26 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > > into suspend. But it's actually "mtd: rawnand: Simplify the locking" that
> > > allows it to return errors rather than locking, before that commit it would
> > > have waited for the rawnand device to resume.  
> > 
> > I don't think so, I believe it was broken in the same way but was just
> > not returning errors.
> 
> Actually I was wrong, 013e6292aaf5 ("mtd: rawnand: Simplify the
> locking") removed the blocking wait (returning -EBUSY when the device
> is suspended instead of putting the thread on a waitqueue). At that
> time, I assumed all threads would be paused when the device is
> suspended, which appeared to be incorrect. So I guess the Fixes tag
> should remain, and we might want to consider backporting a less
> invasive patch to stable releases (one touching only the raw NAND
> layer).

Thanks Miquel add Reviewed-By you on the second patch.

I'll remove the mentioning of commit ef347c0cfd61
("mtd: rawnand: gpmi: Implement exec_op") in this commit msg.

Is it possible to backport another(less invasive) patch to stable
releases? I thought only upstream commits could be backported.

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
