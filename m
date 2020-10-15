Return-Path: <SRS0=04ME=DW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17ABFC433E7
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 09:09:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6411D2222E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 09:09:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A+my5E1D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YDzw0FIa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6411D2222E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m6LyfGRemM0WKRkhNK+aqnTsun2gddSIJelReRKKdjk=; b=A+my5E1DVNEqLlR8Q1Jz5Jj2i
	X7k7Qn08+nWKm7mIa/njawM9aHOlItaoS5loqkt9lIT+wlmMWBcxeNbDtZAGOQfhrLwTcHYBSSIN9
	Y/bGeqFe8JjFjAosXYBsYexqaNWNDhUNinv043j18bbATIitmqpW/QYJEpJ3J6hJbqOY0G3lSTs5q
	Yzh7YXWNBbm+NBTKwMq80xFIEZnIgqL0OVlPvPDvnuGmVMffjWnB7eTwm8lxbOxjGpFFAHzUBfEny
	bgcztXCzLbfpGFxXvFDp9AODSXHKoAidWfZdAj/l6ve3lihPmDKL+qoExXMsiqjA7WZD8g5AVe7xY
	3HJ/YIE+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSzFh-0003op-QI; Thu, 15 Oct 2020 09:08:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSzFe-0003nf-Rb; Thu, 15 Oct 2020 09:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=l2WBiCb5duYJRA9nKpihqrJOH1Qjg6utSrFiu8qAdtc=; b=YDzw0FIaN7/YFvR16XfiWofJuH
 nBmfIWvm4JMJjj7K9G5HeNS1Z/YDuhO0g0YvmnniYO+A5pRgJH0EQ00QRifWQ7/wFuOK66kQ+CHbl
 VmHNK4vhJ2UeayscpW4LECX05RTGJY5IkFz+pz9nwSFIXfkyRPCrxcfeeKjpEbU9zcegEqPcECjRP
 HqUXdlzRteT43Md67LRNqe+y+f4ibfLBMdmYo4nA2bw2pBrFMiIY+xhWHorLEVmlUHpngejo++Dr8
 NFbDLjJ1gIQ7zhvChfWzoMnUsQjy8srPiPNP/XClAfLq47c8PtZaWykDYnT5T0gMHL7PfYb7kzf6Y
 qzk2bIBA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kSzFd-0003sL-RM; Thu, 15 Oct 2020 09:08:45 +0000
Date: Thu, 15 Oct 2020 10:08:45 +0100
From: Christoph Hellwig <hch@infradead.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH v2 15/16] iomap: Inline iomap_iop_set_range_uptodate into
 its one caller
Message-ID: <20201015090845.GD12879@infradead.org>
References: <20201009143104.22673-1-willy@infradead.org>
 <20201009143104.22673-16-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009143104.22673-16-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
