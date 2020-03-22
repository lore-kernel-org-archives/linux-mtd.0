Return-Path: <SRS0=yNtI=5H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94805C4332D
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 03:31:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6592720637
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 03:31:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Np2XOBmH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wKi+3FlF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6592720637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rx05WIye069F7PPn5gsLO2awYkq0hAGTIrIK20Mb61s=; b=Np2XOBmHct4cop
	kI6N4LthNN/Zqb0Eu1LgPrHn74NuuhaWMPHkvOK6ikQR5LFGZu5Qy1A7waOBpYYd+G6rs/z6YduQ/
	Nlx6T9emjxFMt5rD9gVlwnxgj+9AmihjQPupu1mkrV00oJdJ9l/Eej7U6d8Z4eRjd/UArMTjl/Xvt
	OZX1nqj0x4Tjro+3o9cGNJ1fzmVDc/DHm02BcM8rPSHU3dovLbn39so+uLqUCWbS0VkQTrcdnkR02
	7lSnA+fXKM25+oDg7NvlTjRIe72vE7ygpYabJ/za0gLlZ+wXzg2UuVvELnl/CVS2DZZy1OJ4K9RCc
	zzoQHqRU6SiaJvK3OLBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFrKC-0003KV-Vx; Sun, 22 Mar 2020 03:30:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFrK9-0003JO-6L
 for linux-mtd@lists.infradead.org; Sun, 22 Mar 2020 03:30:54 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C18E420637;
 Sun, 22 Mar 2020 03:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584847852;
 bh=3HjG+LC0YneyZEHxHPIPqf1PbiHJjwqiDhM+dJyev2o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wKi+3FlFpKcm/XbFj/gDG939p2/gnEFz2hyRdrCyommDW0pcnZHUS3j37eD4jiXzO
 NziKuDBMgksbob4GMnetkGP68K0vQbn0X8vU6TbZD3axIyVXdRTYD15/GTTSZJhH7V
 T8+DsXuImYSkuqw3m1AKqdTDACPS6epelrY/Zxdk=
Date: Sat, 21 Mar 2020 20:30:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: Re: [PATCH 0/4] fscrypt: add ioctl to get file's encryption nonce
Message-ID: <20200322033050.GA111151@sol.localdomain>
References: <20200314205052.93294-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200314205052.93294-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200321_203053_256462_24F2057E 
X-CRM114-Status: GOOD (  10.87  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Mar 14, 2020 at 01:50:48PM -0700, Eric Biggers wrote:
> This patchset adds an ioctl FS_IOC_GET_ENCRYPTION_NONCE which retrieves
> the nonce from an encrypted file or directory.
> 
> This is useful for automated ciphertext verification testing.
> 
> See patch #1 for more details.
> 
> Eric Biggers (4):
>   fscrypt: add FS_IOC_GET_ENCRYPTION_NONCE ioctl
>   ext4: wire up FS_IOC_GET_ENCRYPTION_NONCE
>   f2fs: wire up FS_IOC_GET_ENCRYPTION_NONCE
>   ubifs: wire up FS_IOC_GET_ENCRYPTION_NONCE
> 
>  Documentation/filesystems/fscrypt.rst | 11 +++++++++++
>  fs/crypto/fscrypt_private.h           | 20 ++++++++++++++++++++
>  fs/crypto/keysetup.c                  | 16 ++--------------
>  fs/crypto/policy.c                    | 21 ++++++++++++++++++++-
>  fs/ext4/ioctl.c                       |  6 ++++++
>  fs/f2fs/file.c                        | 11 +++++++++++
>  fs/ubifs/ioctl.c                      |  4 ++++
>  include/linux/fscrypt.h               |  6 ++++++
>  include/uapi/linux/fscrypt.h          |  1 +
>  9 files changed, 81 insertions(+), 15 deletions(-)
> 

Applied to fscrypt.git#master for 5.7.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
