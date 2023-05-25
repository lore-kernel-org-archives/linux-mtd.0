Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C734EC77B7A
	for <linux-mtd@archiver.kernel.org>; Thu, 25 May 2023 09:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Okkn0Ien/TJJUIndXras/JrKiF7svHWL0kvdqrwIByc=; b=TFkDz4wjKfQ7HZ
	sBP6wLLBxqsSNFJw8IhHiN1srEoZVrtox4Np28FYPaiRsaxpcAJzuyswqr1r+FGpo8GZy69gbZJPg
	gbFSsiJCjlqvsi3eQSjl8/NerkkDI+XusG6GNpCSnhLCTD2//4SWONUatHG9AwjXYWeHffH3BPZRu
	ZolS5lVleDixVhdS/4SjfvQH9bb+2iV6i6UKpp1QDQClQwtRrVWf70RqolpxebFMsYXiIQAKliD/e
	n3Vy7ZaTPtW7OiBjw+XawuhtkU/ntiqS1lwhwNET9apTA2icLCWaqaFElka4+bZwTZ3ieGoD+Ijse
	FFOaU65ToqtCn54W8HxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q27bn-00GBnS-03;
	Thu, 25 May 2023 09:50:11 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1q27bj-00GBmU-0Z;
	Thu, 25 May 2023 09:50:07 +0000
Date: Thu, 25 May 2023 02:50:07 -0700
From: "hch@infradead.org" <hch@infradead.org>
To: Vincent Whitchurch <Vincent.Whitchurch@axis.com>
Cc: "hch@infradead.org" <hch@infradead.org>, kernel <kernel@axis.com>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"richard@nod.at" <richard@nod.at>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/2] ubi: block: Fix deadlock on remove
Message-ID: <ZG8vT8f0mTjTpNgP@infradead.org>
References: <20230523-ubiblock-remove-v1-0-240bed75849b@axis.com>
 <20230523-ubiblock-remove-v1-2-240bed75849b@axis.com>
 <ZG2o4rrfqWGbYziq@infradead.org>
 <fa2a06491cf2d90eb35c95042f888cd49df119fe.camel@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa2a06491cf2d90eb35c95042f888cd49df119fe.camel@axis.com>
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

On Wed, May 24, 2023 at 01:36:39PM +0000, Vincent Whitchurch wrote:
> On Tue, 2023-05-23 at 23:04 -0700, Christoph Hellwig wrote:
> > If you imlement ->free_disk, the list_del and kfree can move into
> > that, and we don't really care if a new opener raced with the delete.
> 
> Moving the kfree() to ->free_disk() works, but the list_del() still
> needs to be in ubiblock_remove() since otherwise ubiblock_remove() could
> attempt to remove the same device twice.

Or we'd still need your removed flag..

> I assumed the current code really wanted to prevent new openers racing
> with delete, but if that is not needed, yes, we don't need to add a
> ->removing flag if we move the kfree() to ->free_disk().  I'll re-spin
> this based on your suggestions.  Thanks.

I think in the past we always had to protect against removals of live
devices because handling of hot removes sucked so bad, both in drivers
and in the block layer itself.  With some newer infrastructure including
the ->free_disk method this can now be handled sanely.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
