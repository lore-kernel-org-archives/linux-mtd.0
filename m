Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1603EC87FD2
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 13:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSUpw5iE482uTQLyT1EDbufvK1Ux8uLqXu8ZWShut4w=; b=VyrEjMGtgZIN9/
	HBag7F43CeSi2MYbFLIYSqYXh2TZ2R6dP++eLMK9KKwgEj2owuAXfbcvWrwV2amX5Q0f+9N4EadlC
	lbwWBw1DXv3R31O+lFBCCd0mAsoQlmVwjdiNDy+mVbtl5meDv0QZj7ova9LPr3F4uws1Q01mj3Uw6
	WDJPBN5w453/0fsJCUjtJUpvFfSSlXqRsPvXEdei5qqmQ+8RRyqpVXdVkE/nyXWOIwCkFK/DECIQ/
	vlY+JH8yQfyQlS+fuEvIsb6Av7BssYEKd80oJDCy9vVh4YgK1FSDVTCniNLzDRMWQJm6ISxzNNr38
	6Kdcu+coUctO9Wqixwmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSgx-00000007qMR-2Hh4;
	Mon, 11 Aug 2025 13:35:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSgU-00000007qEI-1H9E
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 13:35:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B001C45357;
	Mon, 11 Aug 2025 13:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E39DC4CEED;
	Mon, 11 Aug 2025 13:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754919329;
	bh=JU+C8jrRoBvIHpuTBFOVPaJSBYeLJuKp6ZRbyTV8tUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QanpJ1FFAEOTenI/ZExSMKMWz/vWwwP0RGPtT6qjmkKBX4nap9yqO0U3SmhN0mft7
	 0XEsDyKzmiQ3MPArUXx7Xibr1PndFK+QUTgL3JK9LaIVUhTreuZbdIBreTgk2CfMxQ
	 Gm8/UGW+xYIDrCTnXv0I60EocErHUvb+5Kqq7DSDZ/mQ7zNKRfJUzcxUkMhzug1uD1
	 8bh6XQagbanat13424yqY1iXeT3fLg0pvOpA0uXXnszQuwLw3dGXGt6BbyRF22ekUs
	 JmUCratJjiyWB9323y6oClHqu5I+dElILQ4KxZ59JBn8QQ28Rbay5gQFZ4RXLQSWSB
	 iV0FOE4Xqmf/Q==
Date: Mon, 11 Aug 2025 15:35:25 +0200
From: Christian Brauner <brauner@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, linux-fscrypt@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org, 
	ceph-devel@vger.kernel.org
Subject: Re: [PATCH v5 00/13] Move fscrypt and fsverity info out of struct
 inode
Message-ID: <20250811-weismachen-anhieb-987a766c8e6e@brauner>
References: <20250810075706.172910-1-ebiggers@kernel.org>
 <aJixkUfWPo5t8Ron@infradead.org>
 <20250810170311.GA16624@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250810170311.GA16624@sol>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_063530_353064_53BD9E38 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
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

> The fs-specific field solution from this patchset is much more efficient
> than the rhashtable: efficient enough that we don't really have to worry
> about it, regardless of fscrypt or fsverity.  So I think it's a good
> middle ground, and I'd like to just do it this way.

I agree.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
