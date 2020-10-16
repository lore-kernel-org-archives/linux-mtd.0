Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7667C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 06:36:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38EC5207C4
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 06:36:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pdiHZUBG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SBWbXHnw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38EC5207C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fmXPWYSOdFLteLTjrGSglTtFBqUKXx1TaJa/vLPQZAw=; b=pdiHZUBGtikfunCGt8ochFy70
	d0S2fyGlLhoM7D95eq7xkKwVxUv6m6FsF5ivvbLmCN1Eu/uaGQgBtWtqkXyIkihKN+FNlOp0u6hgN
	2+pFqvZw1TrA+XXCSxVIrBa/LsDCG3CieSnGt7S6auoZNTWM9p1f++HfFG+DH7O4Dr1QXgw5abZHN
	kCpFX0PHxnaWdbKi1an2HJr/35e7l7qBz+rbGjFU/M9vHbkDkCNYOtwC2J+Mrt1cWSGSygDvStWxe
	19tYJXThvhCApMsEjAhbbPpVDcdCdQl1PNfOzkgLMQ8pKuQSbAckB8hIWyqDBXpzJ/l0NqUW2vlhd
	c+sdCfPBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTJLC-00089D-RR; Fri, 16 Oct 2020 06:35:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTJLA-00088n-RD; Fri, 16 Oct 2020 06:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=eAA1eJndUJazjd9wD1gXENLx75tdwnXKcLKd7pL1gTU=; b=SBWbXHnwsC7WyfY9k/gweEYk5A
 p+2fGdIWIVbT7n9C1xTGSaGtmyZHzjIApovUpFs3FufX4XdbGFnHU75YYi+FL0hcvw3i3u16C115J
 vBIBNtCO07eyGfiLvCyk/WBfHjfSjVgCLpEOQ7wnWZ8GEoyBAj9psYz6+FTNojyIXPKbj6fBUPuk0
 zVWH6r2qB41hpph2TFteLdPL3avD3zzvX1Xi6yRJXcEccBlOV0jh+OOtS58d2jEesSCt4agpAfL7C
 KsoAEaxAJk/5vbf1akWUscAxYxQjQY3spErwPnoC4n1qtlyzfcn0RaaErSNQgIVsGk30H4ziVJgZ0
 Cv2kunvQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kTJL8-0001O0-W2; Fri, 16 Oct 2020 06:35:47 +0000
Date: Fri, 16 Oct 2020 07:35:46 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 16/16] iomap: Make readpage synchronous
Message-ID: <20201016063546.GA4808@infradead.org>
References: <20201009143104.22673-1-willy@infradead.org>
 <20201009143104.22673-17-willy@infradead.org>
 <20201015094203.GA21420@infradead.org>
 <20201015164333.GA20115@casper.infradead.org>
 <20201015175848.GA4145@infradead.org>
 <20201015190312.GB20115@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015190312.GB20115@casper.infradead.org>
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
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Oct 15, 2020 at 08:03:12PM +0100, Matthew Wilcox wrote:
> I honestly don't see the problem.  We have to assign the status
> conditionally anyway so we don't overwrite an error with a subsequent
> success.

Yes, but having a potential NULL pointer to a common structure is just
waiting for trouble.

> 
> > True.  I'd still prefer the AOP_UPDATED_PAGE as the fallthrough case
> > and an explicit goto out_unlock, though.
> 
> So this?
> 
>         if (ctx.bio) {
>                 submit_bio(ctx.bio);
>                 wait_for_completion(&ctx.done);
>                 if (ret < 0)
>                         goto err;
>                 ret = blk_status_to_errno(ctx.status);
>         }
> 
>         if (ret < 0)
>                 goto err;
>         return AOP_UPDATED_PAGE;
> err:
>         unlock_page(page);
>         return ret;
> 

Looks good.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
