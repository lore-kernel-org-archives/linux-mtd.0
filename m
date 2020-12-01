Return-Path: <SRS0=jbuo=FF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB6AC64E7A
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 23:01:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 817D12080A
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 23:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 817D12080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aivnf4o5QNhyBbux7pIgmNFpLjZJxdim6ZrSe0xpWFE=; b=IPaeHiaP+rFjphCWZq/wpNrhG
	rUxExqfdB4HR3u9U2e+u44dGWWYwOOQAGjCDk9TXVAA4otztcQQdvOxwvTm2Z5ihzxs7kMQFsYlKl
	51pFh70twZBtOmKyDaXzp5HwU66Pq/9rizbJCCpPOpf++8guc/01J2OoXwDUSawaiyauokQjWZUmv
	7LXTjsfBtSaudECBCWLZvL08ObxjBeUnvbk5J3tZdeQJov8l6zCYhRo+s0S/4zzDNDOXJuaWXMp/5
	5cBmbTMiWGkxYvVeWXWcvZg754Ywh+11300YjJe8YZZ62/VVw0GR8/xYlQLNhbGjjyB+JxpgH+Pqk
	m48oMCN0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkEd2-0002U6-LZ; Tue, 01 Dec 2020 23:00:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkEd0-0002TY-E5
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2020 23:00:11 +0000
Date: Tue, 1 Dec 2020 15:00:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606863608;
 bh=UfPQWdK3xBzO1ApIT0Gn7pd2KneFS4j8rVtIyl7vrbg=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=MfiWeMWuaKPYMaaNv9SarNLRpZv08vfHzR572Es3sRYwsmPjO71SF5djmfQppon1c
 D6snuuoylEaT+4eMUrBNlzy1IIRX679LmvlxeGbnhmZknXKzg8u4+teHK7CsizAs+6
 ge14TfRlVCJUZjbOHdANYPfd3CGZTIgupPhJoVtU=
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Subject: Re: [PATCH 2/9] f2fs: remove f2fs_dir_open()
Message-ID: <X8bK9l/9N03++CYM@sol.localdomain>
References: <20201125002336.274045-1-ebiggers@kernel.org>
 <20201125002336.274045-3-ebiggers@kernel.org>
 <9522461b-b854-76ac-29c7-160f0f078823@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9522461b-b854-76ac-29c7-160f0f078823@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_180010_658522_56BAD7C7 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Nov 26, 2020 at 03:04:55PM +0800, Chao Yu wrote:
> On 2020/11/25 8:23, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Since encrypted directories can be opened without their encryption key
> > being available, and each readdir tries to set up the key, trying to set
> 
> readdir -> readdir/lookup?

Yes, ->lookup() tries to set up the key too.  It's different because ->lookup()
doesn't require that the directory be open.  But I suppose that's another reason
why setting up the directory's key in ->open() isn't useful.

I'll add something about that.

- Eric

> 
> > up the key in ->open() too isn't really useful.
> > 
> > Just remove it so that directories don't need an ->open() method
> > anymore, and so that we eliminate a use of fscrypt_get_encryption_info()
> > (which I'd like to stop exporting to filesystems).
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
