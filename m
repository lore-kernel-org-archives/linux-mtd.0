Return-Path: <SRS0=FSZL=DT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D24C43467
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 06:57:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 026EA206E5
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 06:57:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fM3jvOvh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 026EA206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kZnGhGIFx2Gkr/ZGQ+zhjrG+mr0Yc/mo7wi0sWhIq+Y=; b=fM3jvOvhHSrVwXyJLQljK3o0j
	vdOc+1TJNKUDVqhFe//H0GSoNUk7t9mbfbNhMng6vncQbqVrwJGXosYDkaoOPcAdc7l87cQoGPBg7
	GnlPDZfQ+fdGimcN8tHt4bUQ+2PRQWrYJiZAwnmvaXZEAfEZT7hBO0VL6Hrj6tBPEIn2KnhOnGAnR
	iNI5H3yFisDhk10adUZCNpqPK5iUDOQz9eUsO84QChbEgDFbOlUpEY+imMqlmr3z2KD1Jr6b+WLma
	l5v8fzJwttx8tD+ep21a9JBEMq1+CFkXat6qUapZKV7cvI8/dJMJ/D9ovH/MlOIBOhCwb/SFjNtZq
	o8iBPTVuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRrlF-0000s0-Pw; Mon, 12 Oct 2020 06:56:45 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRrlB-0000qQ-HN; Mon, 12 Oct 2020 06:56:42 +0000
IronPort-SDR: sw0VR2K93W8ldurLm7ERELDt/QZEFTI8JAOpIxYfqJrHoL/wYtaRcSoGb7SXpXXYFduhh0hUG3
 erY0gbEmo19A==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="145019452"
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="145019452"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 23:56:37 -0700
IronPort-SDR: DSpSIoZKV7KPLq4zxFvBA+ZLKNkpgmuUQCwMmUi8wsqk6OFxxWBKXoVpyUUZRY9EN2DChpPczf
 4EPhWIQlBVGQ==
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="529842687"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 23:56:35 -0700
Date: Sun, 11 Oct 2020 23:56:35 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH RFC PKS/PMEM 22/58] fs/f2fs: Utilize new kmap_thread()
Message-ID: <20201012065635.GB2046448@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-23-ira.weiny@intel.com>
 <20201009213434.GA839@sol.localdomain>
 <20201010003954.GW20115@casper.infradead.org>
 <20201010013036.GD1122@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201010013036.GD1122@sol.localdomain>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_025641_727006_9A66DED5 
X-CRM114-Status: GOOD (  25.85  )
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, Ingo Molnar <mingo@redhat.com>,
 intel-wired-lan@lists.osuosl.org, kexec@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 bpf@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Fenghua Yu <fenghua.yu@intel.com>, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, io-uring@vger.kernel.org, linux-cachefs@redhat.com,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 09, 2020 at 06:30:36PM -0700, Eric Biggers wrote:
> On Sat, Oct 10, 2020 at 01:39:54AM +0100, Matthew Wilcox wrote:
> > On Fri, Oct 09, 2020 at 02:34:34PM -0700, Eric Biggers wrote:
> > > On Fri, Oct 09, 2020 at 12:49:57PM -0700, ira.weiny@intel.com wrote:
> > > > The kmap() calls in this FS are localized to a single thread.  To avoid
> > > > the over head of global PKRS updates use the new kmap_thread() call.
> > > >
> > > > @@ -2410,12 +2410,12 @@ static inline struct page *f2fs_pagecache_get_page(
> > > >  
> > > >  static inline void f2fs_copy_page(struct page *src, struct page *dst)
> > > >  {
> > > > -	char *src_kaddr = kmap(src);
> > > > -	char *dst_kaddr = kmap(dst);
> > > > +	char *src_kaddr = kmap_thread(src);
> > > > +	char *dst_kaddr = kmap_thread(dst);
> > > >  
> > > >  	memcpy(dst_kaddr, src_kaddr, PAGE_SIZE);
> > > > -	kunmap(dst);
> > > > -	kunmap(src);
> > > > +	kunmap_thread(dst);
> > > > +	kunmap_thread(src);
> > > >  }
> > > 
> > > Wouldn't it make more sense to switch cases like this to kmap_atomic()?
> > > The pages are only mapped to do a memcpy(), then they're immediately unmapped.
> > 
> > Maybe you missed the earlier thread from Thomas trying to do something
> > similar for rather different reasons ...
> > 
> > https://lore.kernel.org/lkml/20200919091751.011116649@linutronix.de/
> 
> I did miss it.  I'm not subscribed to any of the mailing lists it was sent to.
> 
> Anyway, it shouldn't matter.  Patchsets should be standalone, and not require
> reading random prior threads on linux-kernel to understand.

Sorry, but I did not think that the discussion above was directly related.  If
I'm not mistaken, Thomas' work was directed at relaxing kmap_atomic() into
kmap_thread() calls.  While interesting, it is not the point of this series.  I
want to restrict kmap() callers into kmap_thread().

For this series it was considered to change the kmap_thread() call sites to
kmap_atomic().  But like I said in the cover letter kmap_atomic() is not the
same semantic.  It is too strict.  Perhaps I should have expanded that
explanation.

> 
> And I still don't really understand.  After this patchset, there is still code
> nearly identical to the above (doing a temporary mapping just for a memcpy) that
> would still be using kmap_atomic().

I don't understand.  You mean there would be other call sites calling:

kmap_atomic()
memcpy()
kunmap_atomic()

?

> Is the idea that later, such code will be
> converted to use kmap_thread() instead?  If not, why use one over the other?
 

The reason for the new call is that with PKS added behind kmap we have 3 levels
of mapping we want.

global kmap (can span threads and sleep)
'thread' kmap (can sleep but not span threads)
'atomic' kmap (can't sleep nor span threads [by definition])

As Matthew said perhaps 'global kmaps' may be best changed to vmaps?  I just
don't know the details of every call site.

And since I don't know the call site details if there are kmap_thread() calls
which are better off as kmap_atomic() calls I think it is worth converting
them.  But I made the assumption that kmap users would already be calling
kmap_atomic() if they could (because it is more efficient).

Ira

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
