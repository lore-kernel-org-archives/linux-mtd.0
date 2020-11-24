Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C783C2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:54:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 194BF2076E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:54:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3gSjFiEM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uFy7Ttpe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 194BF2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+nqNy2Nto5n1MFKDf/Lzkaby5MOrZaSn4u+ua4h0yUU=; b=3gSjFiEMRr4SqiljPDxQiPWug
	45sge9YmhacU2jOrUFfsKZJwuTlWHt4R7omY7ZAF6GHy4wEmWTk+2oKGiYXwtdlXBzf58kIbmsK95
	jI/8wED/4LvkWgMfdknC08dWHSOueXUuzsdvmRnc4pPGhSDMCJDPKSwaoce44TTWb7Y7ZiMRmYFXa
	BHjFO5WjrTaw1MYF6cvPyWy9TVbP+5bCcGUIQ7VUbmMbSU67DzyHj5/Z9Hl7tXNzHGEOnLlf7r8aQ
	2Pt2jPUKzlbrLc1SI6tphiHKpDRSYBBLx9LHMbNRsqA/3O+tIFZjAzme2wIQQXWVSk8Jmm9GAzqsK
	TbaXuV5Hg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYl5-0007rc-4v; Tue, 24 Nov 2020 13:53:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYku-0007mr-MM
 for linux-mtd@merlin.infradead.org; Tue, 24 Nov 2020 13:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZXWWj8sGpheRB/oPAny/oeYYPMI5xkrPoBeF/PO6t/I=; b=uFy7Ttpe28lYbENky3PW90QaTq
 xG4wEg+wloh0hNvJWawTJQg7XQAS91A4oAPYqDqFFgSWTUjyMdGkcvWeSWNAAcnJJnpdJMC7Jm0Jq
 M95Jiv0GtCKP7Jwi7y4hV5eX/5ntAWKqVIIOuyD36/oMrxKN+22zQUxm/erDkZPH5EFs5kxiNk/qX
 fbYUgHkg+8QptScbUSZ6yFCMWEuoNILFEypZ+PtlRUpUS1f/iW3EWfM0Vm7XWaklqtf+Jppv9QouI
 MA/OL8tDwMa4wuUd7DIRsV4kdVDn9/qL5FTWuQlH76deZdi3dut2mc+76r0aL8ewuSlgqLBT+dwl6
 clkzRyQg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1khYkr-00014M-IZ; Tue, 24 Nov 2020 13:53:13 +0000
Date: Tue, 24 Nov 2020 13:53:13 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/45] filemap: consistently use ->f_mapping over
 ->i_mapping
Message-ID: <20201124135313.GA4327@casper.infradead.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-3-hch@lst.de>
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
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 02:27:08PM +0100, Christoph Hellwig wrote:
> Use file->f_mapping in all remaining places that have a struct file
> available to properly handle the case where inode->i_mapping !=
> file_inode(file)->i_mapping.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
