Return-Path: <SRS0=R+0z=OL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38131C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 03:18:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E46DA61100
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 03:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E46DA61100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bl00Y1BuuC7qGWkrdRXKobaXE1ifaBqFP3JUedWIRvg=; b=QXO0nDV7Ugm8ni
	Wbc2nj4SJdozn2gkTTJknA/QH4yAI5NYGguTERYZm4OryIaj/XGIV1QdqsrnZ5dj+3Vxu2SHRf26Z
	eirg/pw/mDLXsCoNeh4DVkGzMt26eU+kEdQEiaN+v7ppayaxTQwDn7QQVXbq9JTEEYzQgrDRmcvtQ
	/SBI/eCqu/XDiUfTYzTxXyNjtW1SAd+q8atdQBN++fvXDNbHrnmZ+psU4ONQ9KkE3pOpnTtOmGs7A
	ihTygPVDox2NzPQ7bvSFc+eMrxXRzVlDhq6JuQoRUSM3NU11k6QyODvQSrYuT6TIdDWnejopH6ug+
	Oso9MipRQAjFvl57mToQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSWI1-003X9H-BN; Tue, 21 Sep 2021 03:17:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSWHw-003X8m-Hp
 for linux-mtd@lists.infradead.org; Tue, 21 Sep 2021 03:17:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C10B560FA0;
 Tue, 21 Sep 2021 03:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632194263;
 bh=1z2WAjQcgYOvO1mOy7tZvGYG0cWDjea2L4QGJOBqXAc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jfAHRu31KG3TG0GFmYsYqIynz89ivQwawvig6FqG9mFfDKclwPC2tAqXg+XxwC510
 dKhH5VQdRP5cnl7yeHUPIgYKDkbLyXwADJ9kY7dOYreG8CkkiTStmaAY/0bNMnHkn6
 n5npjmo00AqREwTfwH9XqKpNRcuErmIxqdJxqfQ6UetUWz6wgbILr/UMu6pAAYQJrc
 zgoWhIY/wM6NKkoZbQutvcFtqjFBu9cu7WZta6glZmqJONVdv3+/Xho71IQziIbc5E
 JB+aSx88i6VDIWdXvcUlmrHgoHlbmwgyBdKWLLPocqN+hHdwBrtFY1bUpf2a2EIIAo
 2uEQgbIWVPLDg==
Date: Mon, 20 Sep 2021 20:17:42 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH] fscrypt: remove fscrypt_operations::max_namelen
Message-ID: <YUlO1vmMXRaHHpTK@sol.localdomain>
References: <20210909184513.139281-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210909184513.139281-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_201744_652211_CD3E5C20 
X-CRM114-Status: GOOD (  10.74  )
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

On Thu, Sep 09, 2021 at 11:45:13AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> The max_namelen field is unnecessary, as it is set to 255 (NAME_MAX) on
> all filesystems that support fscrypt (or plan to support fscrypt).  For
> simplicity, just use NAME_MAX directly instead.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/crypto/fname.c       | 3 +--
>  fs/ext4/super.c         | 1 -
>  fs/f2fs/super.c         | 1 -
>  fs/ubifs/crypto.c       | 1 -
>  include/linux/fscrypt.h | 3 ---
>  5 files changed, 1 insertion(+), 8 deletions(-)

Applied to fscrypt.git#master for 5.16.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
