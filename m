Return-Path: <SRS0=3Meg=3L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEB1C2D0CE
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 00:30:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B113C217F4
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 00:30:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lHsTsXv2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qUmyGZfk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B113C217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YDfyHYneRomml3Tf7SzIIqsWsWq8r2VtfAzJbhYRpPc=; b=lHsTsXv2BrWLra
	H6f+F4AWzUB0u1YsqejeSAWzMe5X0oC7V+dgo4Rk6RvKr85wR8D6TmSuTlPzhvSN4nGwI5L28b8Tb
	BraVMM22xEpAplFkd1s6Rh8ozS1SVygl7ID8edFusosU+edOuWznYSIBvAJGmuAQulJ9m4quk5G8W
	KBnjUwsMILIh5EZ+XLhygGf0EVizlpe0Yp2NfGMc1RL1OPb6ydwUWj2YSoSZ91cp/ptNYmnzMiJxQ
	HjFsFetDhP4Zc4CoLWmLvZ0Y2J/aEx4gc6wj7fKXObOB5/GE2mkrTH6Yeg46qwqNeLTMZ/X6yZxSI
	OYXFoq+uLjnl+YL3ZV8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iu3uW-0006C4-CG; Wed, 22 Jan 2020 00:30:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iu3uT-0006Be-I4
 for linux-mtd@lists.infradead.org; Wed, 22 Jan 2020 00:30:18 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D435217F4;
 Wed, 22 Jan 2020 00:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579653016;
 bh=H/qN5wQT4EZ5hYKWGp7yIkcoOLzjrk0gNanXBpiBRnI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qUmyGZfkQoEjSKG30mFMzVYmysM/ifNtNxjkA1RSMGQ7a09pMTLRQ51CbJ/WSqYbJ
 3X6LIerTmDJS8K4r629U6pRTw5tK+OB60JON9E76MkrGSspGCJVKneBB0fF2UOY/z7
 5i6O013odo5e0N2RxkVk+0bwfG0RbjP7IfDQNb50=
Date: Tue, 21 Jan 2020 16:30:15 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v5 4/6] ubifs: don't trigger assertion on invalid no-key
 filename
Message-ID: <20200122003014.GA180824@gmail.com>
References: <20200120223201.241390-1-ebiggers@kernel.org>
 <20200120223201.241390-5-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120223201.241390-5-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_163017_618553_7FE5FA5C 
X-CRM114-Status: UNSURE (   9.91  )
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
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jan 20, 2020 at 02:31:59PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> If userspace provides an invalid fscrypt no-key filename which encodes a
> hash value with any of the UBIFS node type bits set (i.e. the high 3
> bits), gracefully report ENOENT rather than triggering ubifs_assert().
> 
> Test case with kvm-xfstests shell:
> 
>     . fs/ubifs/config
>     . ~/xfstests/common/encrypt
>     dev=$(__blkdev_to_ubi_volume /dev/vdc)
>     ubiupdatevol $dev -t
>     mount $dev /mnt -t ubifs
>     mkdir /mnt/edir
>     xfs_io -c set_encpolicy /mnt/edir
>     rm /mnt/edir/_,,,,,DAAAAAAAAAAAAAAAAAAAAAAAAAA
> 
> With the bug, the following assertion fails on the 'rm' command:
> 
>     [   19.066048] UBIFS error (ubi0:0 pid 379): ubifs_assert_failed: UBIFS assert failed: !(hash & ~UBIFS_S_KEY_HASH_MASK), in fs/ubifs/key.h:170
> 
> Fixes: f4f61d2cc6d8 ("ubifs: Implement encrypted filenames")
> Cc: <stable@vger.kernel.org> # v4.10+
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Richard, can you review the two UBIFS patches in this series, and if you're okay
with them, provide Acked-by's so that we can take them through the fscrypt tree?
They don't conflict with anything currently in the UBIFS tree.

Thanks!

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
