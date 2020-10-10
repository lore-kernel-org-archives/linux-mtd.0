Return-Path: <SRS0=cnOS=DR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40778C433DF
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2020 02:44:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCF842075E
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2020 02:44:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zh/Qb27q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="IKFTIVFz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="BgjiTham"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCF842075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+fafGKK1KladDJvTReQ4kC8q33Ko/WagwIsfwHdroB0=; b=zh/Qb27q7S8SkOpH+dj/0YDD5
	7m1HoG3BqQjkoSigzirfIMZ09C/KomhD6pAD5inOC0pvTV1CB3xh46GdrvfwewBKMC4uPDkvzzHTb
	ZgPU2JyttWZYE3kVHumNQ08g9SvqLGPMgNMOdT7boUpj6HG7T+4YRSb2CSB6I5o2h05Hovyxwpm67
	q3XtMpuJQLzHydRgWrPfK73E8RY3kBKwga6z5JqoLo90TrwuhBACnsywJQjCkYTqhJFLr5WSnARqZ
	wdAMpZmSxvxcqOYbmH6EauSLiEQjBSTJMIYz3CtoHau6umoUkvJHT/q1yiuDV5J1cLQJE9jCzKANi
	J29jM3omQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kR4r0-0006ic-Cv; Sat, 10 Oct 2020 02:43:26 +0000
Received: from bedivere.hansenpartnership.com ([66.63.167.143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kR4qx-0006gu-Ju; Sat, 10 Oct 2020 02:43:24 +0000
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 2492A8EE25D;
 Fri,  9 Oct 2020 19:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1602297797;
 bh=H8TP93foEqN1ktQ8Zvn50X/i2mF1Mo+G3bAPl3laMS8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=IKFTIVFzGPRTOXbvF4guFV0idy0d2c5GY0pNpauMNCD265o/8xML504AQiHNNKINI
 03VTbsdpTlx1IvRxmapAuFqbOyRLRkynjYBLceWgnAFSazyacAGjs/kfFiiin3dxCG
 9/K3u5C/d7R0kHrIFRdMX77E7sQ6OOI7DSaYWfn4=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id 3vw63n_vJBCB; Fri,  9 Oct 2020 19:43:16 -0700 (PDT)
Received: from jarvis (c-73-35-198-56.hsd1.wa.comcast.net [73.35.198.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 0DE4F8EE120;
 Fri,  9 Oct 2020 19:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1602297796;
 bh=H8TP93foEqN1ktQ8Zvn50X/i2mF1Mo+G3bAPl3laMS8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=BgjiThamK3sRChTIWem3VqlcTVcZOY3Z2GNJyIwpezgtDJLGW3IszUxOTE+yoCAWv
 V48K29iXWIdEyZfVjEsU0FSlh3cTrvJt0EqAPo1Ll9Jsfhk5OlUorelNGWOoKpuPOj
 SS1Y94jSiSEug+8lBRnZGZxsf1hZ1ZG8/+ovIeYw=
Message-ID: <95d137992900152a0453f7ba37771cb9025121fa.camel@HansenPartnership.com>
Subject: Re: [PATCH RFC PKS/PMEM 22/58] fs/f2fs: Utilize new kmap_thread()
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Eric Biggers <ebiggers@kernel.org>, ira.weiny@intel.com
Date: Fri, 09 Oct 2020 19:43:13 -0700
In-Reply-To: <20201009213434.GA839@sol.localdomain>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-23-ira.weiny@intel.com>
 <20201009213434.GA839@sol.localdomain>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_224323_759347_9251AE84 
X-CRM114-Status: GOOD (  22.76  )
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
 linux-kselftest@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 linux-afs@lists.infradead.org, cluster-devel@redhat.com,
 Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
 kexec@lists.infradead.org, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, bpf@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-um@lists.infradead.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-cachefs@redhat.com, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-09 at 14:34 -0700, Eric Biggers wrote:
> On Fri, Oct 09, 2020 at 12:49:57PM -0700, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > The kmap() calls in this FS are localized to a single thread.  To
> > avoid the over head of global PKRS updates use the new
> > kmap_thread() call.
> > 
> > Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> > Cc: Chao Yu <chao@kernel.org>
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > ---
> >  fs/f2fs/f2fs.h | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index d9e52a7f3702..ff72a45a577e 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -2410,12 +2410,12 @@ static inline struct page
> > *f2fs_pagecache_get_page(
> >  
> >  static inline void f2fs_copy_page(struct page *src, struct page
> > *dst)
> >  {
> > -	char *src_kaddr = kmap(src);
> > -	char *dst_kaddr = kmap(dst);
> > +	char *src_kaddr = kmap_thread(src);
> > +	char *dst_kaddr = kmap_thread(dst);
> >  
> >  	memcpy(dst_kaddr, src_kaddr, PAGE_SIZE);
> > -	kunmap(dst);
> > -	kunmap(src);
> > +	kunmap_thread(dst);
> > +	kunmap_thread(src);
> >  }
> 
> Wouldn't it make more sense to switch cases like this to
> kmap_atomic()?
> The pages are only mapped to do a memcpy(), then they're immediately
> unmapped.

On a VIPT/VIVT architecture, this is horrendously wasteful.  You're
taking something that was mapped at colour c_src mapping it to a new
address src_kaddr, which is likely a different colour and necessitates
flushing the original c_src, then you copy it to dst_kaddr, which is
also likely a different colour from c_dst, so dst_kaddr has to be
flushed on kunmap and c_dst has to be invalidated on kmap.  What we
should have is an architectural primitive for doing this, something
like kmemcopy_arch(dst, src).  PIPT architectures can implement it as
the above (possibly losing kmap if they don't need it) but VIPT/VIVT
architectures can set up a correctly coloured mapping so they can
simply copy from c_src to c_dst without any need to flush and the data
arrives cache hot at c_dst.

James



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
