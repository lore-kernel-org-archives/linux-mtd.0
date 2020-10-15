Return-Path: <SRS0=04ME=DW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1BAC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 19:04:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B6B3218AC
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 19:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uGnC4+lD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NX+4sGxW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B6B3218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lNl2nfrw7K6zmtiYySf8Q8txAzimWPyzuaGzXDGVWVg=; b=uGnC4+lD28Yb/PerDMA+0C3/M
	IEAj5WI5jA08sK2RsZGG165q9hnyvBnFMubAioRV86YdG4ye2GqaYJWLYooKOZr/QdPGdfZ9HnRfY
	7KP5pmtK/XX2gahdK+dAYg4cS23/PDYhenX2LmxDd+PM2rV+nK9LyXdPLtpyo7WrYeBJYjdeoMUmN
	4kHghHpVkp9KoNgstxK5T1Jm3QAvHcHPlnRpJYwv0I4UKlAqmm2V4djjdgcoOjgSoDlglDO2mJtoz
	T6MSDcQXIj95+nRWLTEBCZ1ODmgbpWDWWGASNuReYtnkr5sSz8kmAetn2ZJGoAg1dCzmbidefay3l
	sXO1J5GPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT8Wz-0001jL-PC; Thu, 15 Oct 2020 19:03:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT8Wx-0001iv-3N; Thu, 15 Oct 2020 19:03:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=oNJXIe6ApwnR4LV/FIl4/BNaWNi8NSTj4mgOrmFnzuk=; b=NX+4sGxWbcObdfGwkGyOjAO42I
 RwmquKATXBHbPE8QSMBRvqg3SOeDdcTChlMCCwoXnLis0DLRnkhZ9SBCeMdxlmrOEU5T31XnSKdna
 8BJnB9a8evpDeuTlBno2NyNtBFQ3rhK5+DQAIo0aSwxVOlbPXbe1xBNJP+/BLP07zrDu8t86RMeAH
 /PjljktE1B37EED9rYHkhPumMrgN299CGCffnkM19ZidMR2ViOe3nCfbLb380F9gIBfoc1CJNWBEM
 pVilSrRr9k6B9lRS2zCnqwquGo2pBX6mLt0eMBFVmNSqr+ihKMHE6zdFkrlbS40ju3J1wa+nt0m9O
 xHvnTZKg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kT8Wu-00055X-Dw; Thu, 15 Oct 2020 19:03:12 +0000
Date: Thu, 15 Oct 2020 20:03:12 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 16/16] iomap: Make readpage synchronous
Message-ID: <20201015190312.GB20115@casper.infradead.org>
References: <20201009143104.22673-1-willy@infradead.org>
 <20201009143104.22673-17-willy@infradead.org>
 <20201015094203.GA21420@infradead.org>
 <20201015164333.GA20115@casper.infradead.org>
 <20201015175848.GA4145@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015175848.GA4145@infradead.org>
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

On Thu, Oct 15, 2020 at 06:58:48PM +0100, Christoph Hellwig wrote:
> On Thu, Oct 15, 2020 at 05:43:33PM +0100, Matthew Wilcox wrote:
> > I prefer assigning ctx conditionally to propagating the knowledge
> > that !rac means synchronous.  I've gone with this:
> 
> And I really hate these kinds of conditional assignments.  If the
> ->rac check is too raw please just add an explicit
> 
> 	bool synchronous : 1;
> 
> flag.

I honestly don't see the problem.  We have to assign the status
conditionally anyway so we don't overwrite an error with a subsequent
success.

> True.  I'd still prefer the AOP_UPDATED_PAGE as the fallthrough case
> and an explicit goto out_unlock, though.

So this?

        if (ctx.bio) {
                submit_bio(ctx.bio);
                wait_for_completion(&ctx.done);
                if (ret < 0)
                        goto err;
                ret = blk_status_to_errno(ctx.status);
        }

        if (ret < 0)
                goto err;
        return AOP_UPDATED_PAGE;
err:
        unlock_page(page);
        return ret;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
