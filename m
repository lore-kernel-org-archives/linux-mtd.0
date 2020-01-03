Return-Path: <SRS0=eEUd=2Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DF2C2D0C2
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jan 2020 17:09:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1749020866
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jan 2020 17:09:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RNl+P7Sy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wUIyx+9b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1749020866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0Tijav0VZYxX+GzhCIcq3vgysYRAafJ4SnqNAVomKM=; b=RNl+P7SyBm5xaq
	SySi9AFqi/j5icx2XS8yt2wA+ut4pEQMZIS9fGhwIxj1B93bk7KqmAPaa8SRHYgln79hOaw0yGARn
	oB1OVj81KkQKbcxfLuFFGPt8B8p9GzZxARscHTpNZlCowrE2CVgmlcs25YrpUja+LTjfg9rKA93ss
	pqLItr304Ywm3bXruhQoKRVKYCPzwmD+zJ9JN4ko7OP8CzkHxjZuylimrZdQWBdy+ygawCLjl+MIq
	A+4R3aLAk4Kj/ux4Uf6Fd3PvjMv6N6juY2+piWqFu3HYnA8oCrJ73s6kp2+JNiwmSKfYaT9P3AGjO
	xiAFDAVPXwe3b6f0AlHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inQS5-0007OJ-0P; Fri, 03 Jan 2020 17:09:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inQS2-0007N9-BL
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2020 17:09:31 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E446C20866;
 Fri,  3 Jan 2020 17:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578071370;
 bh=/w7qV6vGafRI8Bm52uoZr3tM+ATD+r4xbclSLdlWkgU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wUIyx+9baPXtBb2sY3SwZEdn58USbFg1gyCThz9D5raQaIyY6CnecVjdvQJshNUV9
 FqTp9DNdx1eAfzeICb1kWbPFCT6UE2rhQdpKe6AAnc0tUS+K3QsYKvEWCamI6hBLAD
 EQyQEt/flNKl2Y1oaaPdQqHgPxiqumWtDqy6Q5GQ=
Date: Fri, 3 Jan 2020 09:09:28 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ubifs: use IS_ENCRYPTED() instead of
 ubifs_crypt_is_encrypted()
Message-ID: <20200103170927.GO19521@gmail.com>
References: <20191209212721.244396-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209212721.244396-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200103_090930_407348_FE26D6DC 
X-CRM114-Status: GOOD (  11.25  )
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
Cc: linux-fscrypt@vger.kernel.org,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Dec 09, 2019 at 01:27:21PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> There's no need for the ubifs_crypt_is_encrypted() function anymore.
> Just use IS_ENCRYPTED() instead, like ext4 and f2fs do.  IS_ENCRYPTED()
> checks the VFS-level flag instead of the UBIFS-specific flag, but it
> shouldn't change any behavior since the flags are kept in sync.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/ubifs/dir.c     | 8 ++++----
>  fs/ubifs/file.c    | 4 ++--
>  fs/ubifs/journal.c | 6 +++---
>  fs/ubifs/ubifs.h   | 7 -------
>  4 files changed, 9 insertions(+), 16 deletions(-)

Richard, can you consider applying this to the UBIFS tree for 5.6?

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
