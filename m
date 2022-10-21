Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DFBC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 08:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAYA0iaKRLpoXwAUNsVbRjvbsL4g9XSkhmCEo83R8hM=; b=HF9KwHZvfFxybN
	0OQRmLtdCc7xKEncqf5NJcCLJxZZIFBnt7GFtoePtNXdpgnKbWNkTF8uq/t9UodcdQ5MMuVIVzNTF
	6Jn07OPwOLTqe/eT898o33E5jL97aOVieiLxEiNb7qowuXgBFjqyeAVYV1SmpmoyxUgLbQ5m9111q
	dtFPGKwsRwEh/XkjQUyAIFMwy8miHzKRKjMfv/nbnrdf4IgF+2vHG30S8eqf3U7RaQIj5EsMzgocJ
	mQLUsSg1yLZd4vkwiAwSD1D/VwYGkgy8TiTEiN/d7LAB9J2Xf0o9ulMvc+RE+nlJdEOU7SJsQDOIF
	7hWoaWhvNOPKHXmY5wgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnCk-006HHM-79; Fri, 21 Oct 2022 08:16:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnCg-006HEP-Pw
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 08:16:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D8AF61DF6;
	Fri, 21 Oct 2022 08:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 512F7C433D7;
	Fri, 21 Oct 2022 08:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666340188;
	bh=nDtywa6mieJPfGn7a73ycNgAHcz816CMD4ioaA/ZgqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lO82TxFXbxQ1cn2DOqHCEKyNscPmKusZYKwJGtS1W9wHd/+uOdMexrwxM5m/eoZGP
	 ixuN1pMyIVVKVRufxw1DnKqd7DCICC9i7tVNcPFmRr0aUFAthWwsrDgNS/LTSDl6lj
	 lH2fmm/4fi6QX2qSDaq/NHngB7BNdQ/cZRRC7bts=
Date: Fri, 21 Oct 2022 10:16:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>, linux-kernel@vger.kernel.org,
	qemu-devel@nongnu.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com,
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org,
	rafael@kernel.org, somlo@cmu.edu, mst@redhat.com,
	jaegeuk@kernel.org, chao@kernel.org, hsiangkao@linux.alibaba.com,
	huangjianan@oppo.com, mark@fasheh.com, jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com, akpm@linux-foundation.org,
	alexander.deucher@amd.com, richard@nod.at, liushixin2@huawei.com
Subject: Re: [PATCH 01/11] kset: fix documentation for kset_register()
Message-ID: <Y1JVWsLs0EQ3dtxM@kroah.com>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <20221021022102.2231464-2-yangyingliang@huawei.com>
 <eb0f1459-7980-4a7b-58f9-652eeccc357e@amd.com>
 <10d887c4-7db0-8958-f661-bd52e6c8b4af@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10d887c4-7db0-8958-f661-bd52e6c8b4af@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_011630_948768_D487BFDC 
X-CRM114-Status: GOOD (  30.17  )
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

On Fri, Oct 21, 2022 at 04:05:18PM +0800, Yang Yingliang wrote:
> 
> On 2022/10/21 13:34, Luben Tuikov wrote:
> > On 2022-10-20 22:20, Yang Yingliang wrote:
> > > kset_register() is currently used in some places without calling
> > > kset_put() in error path, because the callers think it should be
> > > kset internal thing to do, but the driver core can not know what
> > > caller doing with that memory at times. The memory could be freed
> > > both in kset_put() and error path of caller, if it is called in
> > > kset_register().
> > > 
> > > So make the function documentation more explicit about calling
> > > kset_put() in the error path of caller.
> > > 
> > > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > > ---
> > >   lib/kobject.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/lib/kobject.c b/lib/kobject.c
> > > index a0b2dbfcfa23..6da04353d974 100644
> > > --- a/lib/kobject.c
> > > +++ b/lib/kobject.c
> > > @@ -834,6 +834,9 @@ EXPORT_SYMBOL_GPL(kobj_sysfs_ops);
> > >   /**
> > >    * kset_register() - Initialize and add a kset.
> > >    * @k: kset.
> > > + *
> > > + * If this function returns an error, kset_put() must be called to
> > > + * properly clean up the memory associated with the object.
> > >    */
> > And I'd continue the sentence, with " ... with the object,
> > for instance the memory for the kset.kobj.name when kobj_set_name(&kset.kobj, format, ...)
> > was called before calling kset_register()."
> kobject_cleanup() not only frees name, but aslo calls ->release() to free
> another resources.

Yes, but it's the kobject of the kset, which does need to have it's name
cleaned up, but that kobject should NOT be freeing any larger structures
that the kset might be embedded in, right?

> > This makes it clear what we want to make sure is freed, in case of an early error
> > from kset_register().
> 
> How about like this:
> 
> If this function returns an error, kset_put() must be called to clean up the name of
> kset object and other memory associated with the object.

Again, I think we can fix this up to not be needed.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
