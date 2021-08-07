Return-Path: <SRS0=iVWO=M6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB1FC4338F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 06:31:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C528A600D4
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 06:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C528A600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQ2gpVawvR2ydjGNpUTlsl+MuxIbq1okUf0ASvHGL64=; b=mn9UXwy3Xdc60S
	wLiYyKIE5/31dJ3GKfw1vISBVToTtrDGlvYoOLBSUOxPs+2KGtUJivXXg9OKku6XUlMPgnoaeWRby
	8Z884sDkSVnj/qkiArT0o86f3r7+vAEWSgY3gEs+EVXHFWLyRWYpA3nBD82+YyWzBsyl+dRp0fMfe
	7IhxT5d3j0qkAtcD3ZF9gBroFCpa/C0a9YjLTHQA/UXIreUQvZ+WAZnyVgIMmO99Q5iRJ72Vr99hi
	PEVSW9jSWVnRteQmJDO34mfXfPwLqJbgR6o8CDlSK8+rCcyhA9VMflMSzK1tXT/HG0uWUOwOR7M/L
	N6bK1q7btOE31XphLyoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCFrE-00EFEl-OL; Sat, 07 Aug 2021 06:30:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCFrC-00EFEE-9v
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 06:30:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8596360EEA;
 Sat,  7 Aug 2021 06:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628317851;
 bh=gqBbm7RQvMmGiA3+sO0OFu5gS/QfanB2nByt2Gwpxgs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FZIE/jRKv7kWLZA2wXSQwDq9hr6eB0pk/cWpEoy68ubzTdGleeflaGLAnR7YPhFKH
 fjQtBQpnH57rlyH4JfTw92i9rJFlpocxI9GSQCXA9Vn8cbuTlVI3ySZxs+CEa5SsHZ
 p6/415HlU/z8Kcz7SzW20AX8rNnWIWbPYW9qFMtS1czQu/dIKlFJ4KnhW/XOhMp9ZG
 M1z3QVHPSISdZAmyuYYuwedK+JGKGZyyGWWPrRT5lma/KI0UOi7iymhtrQE8a66d9f
 MH/Y4WCM3hPn4dMkOvPdWReMFiaBl9CqMcZg6eDLFKgNjTg6Wj8BXsz4VK4K67PenR
 Wsakcx87MBmCQ==
Date: Fri, 6 Aug 2021 23:30:49 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH] fscrypt: document struct fscrypt_operations
Message-ID: <YQ4omeTN73JFZQY+@sol.localdomain>
References: <20210729043728.18480-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210729043728.18480-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_233054_406841_EB158143 
X-CRM114-Status: UNSURE (   7.87  )
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

On Wed, Jul 28, 2021 at 09:37:28PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Document all fields of struct fscrypt_operations so that it's more clear
> what filesystems that use (or plan to use) fs/crypto/ need to implement.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  include/linux/fscrypt.h | 109 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 105 insertions(+), 4 deletions(-)

Applied to fscrypt.git#master for 5.15.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
