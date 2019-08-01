Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6BFC19759
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 18:47:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E67D620838
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 18:47:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qb6DE/mS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tDGbqBQl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E67D620838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPFpFqml4U8F8IBCacRsS2jPBa1vk6+hJiQbT8b5ahg=; b=qb6DE/mSvqIv55
	EUbDr1cuNetkG0wvE/cUSbovSxwJLS5k/izUi6zyEqoVfwSc/z7lRoLcc1plESlmUMiuZzKHT4sqq
	nkRYKD0DnkIGmivK6hAOKFBMby4AU0LPmVnjGo2DbU23NI5Vfy6id8NP6ZBkTkdA86SSq32RaXl7Y
	VjzMqbJkoyT/i1VZYZ8BkSyVjpNpgWUI33hhNCfCxGu6a++ajIiu9n0Vknz4QaqyXfoR//+vmmRwa
	AzUHq0UYDGpXdZ9NGiYTibofFzWD6w364d6/I42d8WTyTT9b/0Uw/ESuOg032VZdPoULwp5QT5rIT
	KV6soAjDLu5UQ5osZ27Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htG6G-0002E8-OZ; Thu, 01 Aug 2019 18:46:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htG6D-0002BG-Tt
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 18:46:51 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA65E20838;
 Thu,  1 Aug 2019 18:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564685209;
 bh=HMNsHRyxcs/N2sdOx2bRjvS77biGEkdk37DWtJon/S0=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=tDGbqBQlpjlVxdQKRs9tN4nVl/E4GGr1HJxRUhFbutz827naxP1URsY0gzumfiEBK
 E0HljneDOE5HI2QdvN0gsxf1i2d19g3e0tki+KzfatAQYi5mDw0/7nsoANX+631D6z
 6mJLUifplnQHO4me1nYIjGVkW06ZrEAqmFiUJkE8=
Date: Thu, 1 Aug 2019 11:46:47 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>, Satya Tangirala <satyat@google.com>
Subject: Re: [PATCH v7 07/16] fscrypt: add FS_IOC_REMOVE_ENCRYPTION_KEY ioctl
Message-ID: <20190801184646.GB223822@gmail.com>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>,
 Satya Tangirala <satyat@google.com>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-8-ebiggers@kernel.org>
 <20190728192417.GG6088@mit.edu> <20190729195827.GF169027@gmail.com>
 <20190731183802.GA687@sol.localdomain>
 <20190731233843.GA2769@mit.edu>
 <20190801011140.GB687@sol.localdomain>
 <20190801053108.GD2769@mit.edu> <20190801183554.GA223822@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801183554.GA223822@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_114650_013306_24874A5F 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Aug 01, 2019 at 11:35:56AM -0700, Eric Biggers wrote:
> 
> "fscrypt lock" actually doesn't exist yet; it's a missing feature.  My patch to
> the fscrypt tool adds it.  So we get to decide on the semantics.  We don't want
> to require root, though; so for v2 policy keys, the real semantics have to be
> that "fscrypt lock" registers the key for the user, and "fscrypt unlock"
> unregisters it for the user.
> 

I meant the other way around, of course: "fscrypt unlock" registers the key for
the user, and "fscrypt lock" unregisters it for the user.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
