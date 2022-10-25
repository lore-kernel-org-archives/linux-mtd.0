Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03728C04A95
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Oct 2022 16:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OlFzy0rt+cOlMmG0UMq2gnRS/H9fXUzWFafJ2f897qc=; b=g0lY+1TGN2hdTT
	4trgvwL3RTX1YlxvNIrxWmzir7t0+x9s+NbHWZPi2dI++mXjGeD6WC/3kpRm2/ZLv6pYwDdF1YlgM
	x6lfDSjZO0+r6jFwwUwrZWuXGHT5z6uTR5fdsuizwdqfMaqBQw74ECRC7t3I0QMDLpiro9tWXNYrl
	WjSZrFohOzSsixA86FeJnPDHoKBhUlk6jhL91vaM9vLtao7Eh9lR13dIIaofXXyZTPYagRBgGx+eq
	HIte4HVYtBqvY7Giy1Fdkm5GtTfMEQIAdhvScq3OFUwyDiaiC+yE/AL3sEOWLigOeXkhIq9l3gNxx
	6ymhE2AsPI2uh2qYlXYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onNFa-006NTy-1L; Tue, 25 Oct 2022 16:58:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onNFX-006NS6-9b
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2022 16:58:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A2DE8B81DB8;
	Tue, 25 Oct 2022 16:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C254DC433D6;
	Tue, 25 Oct 2022 16:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666717074;
	bh=TOr7/IBl9W+Hpc/R8LxJAyq9QpYQbWCv3WJvy2nka0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IuS0pwxkNWhb/Pc3fD1YeILTwYuQDWG7J6hJ35bK6Ucsyh68N7Gpf7db0oIcWSg5J
	 +A52AVp6gq97BqnXsSXSdptDSLkW3H2w/eBLbjyhblutXXWvXsvxCZQTb1o8df8D0g
	 X2/xsNKaI+imRsgqBblFS8hu7gUdhG4pmfgst1Zw=
Date: Tue, 25 Oct 2022 18:57:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com,
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org,
	rafael@kernel.org, somlo@cmu.edu, mst@redhat.com,
	jaegeuk@kernel.org, chao@kernel.org, hsiangkao@linux.alibaba.com,
	huangjianan@oppo.com, mark@fasheh.com, jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com, akpm@linux-foundation.org,
	alexander.deucher@amd.com, luben.tuikov@amd.com, richard@nod.at,
	liushixin2@huawei.com
Subject: Re: [PATCH v3] kset: fix memory leak when kset_register() returns
 error
Message-ID: <Y1gVj6Uq2NDScYdY@kroah.com>
References: <20221025071549.1280528-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221025071549.1280528-1-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_095759_495528_D2094D7B 
X-CRM114-Status: GOOD (  17.07  )
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

On Tue, Oct 25, 2022 at 03:15:49PM +0800, Yang Yingliang wrote:
> Inject fault while loading module, kset_register() may fail.
> If it fails, the kset.kobj.name allocated by kobject_set_name()
> which must be called before a call to kset_register() may be
> leaked, since refcount of kobj was set in kset_init().
> 
> To mitigate this, we free the name in kset_register() when an
> error is encountered, i.e. when kset_register() returns an error.
> 
> A kset may be embedded in a larger structure which may be dynamically
> allocated in callers, it needs to be freed in ktype.release() or error
> path in callers, in this case, we can not call kset_put() in kset_register(),
> or it will cause double free, so just call kfree_const() to free the
> name and set it to NULL to avoid accessing bad pointer in callers.
> 
> With this fix, the callers don't need care about freeing the name
> and may call kset_put() if kset_register() fails.
> 
> Suggested-by: Luben Tuikov <luben.tuikov@amd.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
> v2 -> v3:
>   Update commit message and comment of kset_register().
> 
> v1 -> v2:
>   Free name inside of kset_register() instead of calling kset_put()
>   in drivers.

Thank you for all of this, it's a much nicer and cleaner fix than
forcing all callers to try to handle it instead.

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
