Return-Path: <SRS0=FSZL=DT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED59C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 05:53:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19DF520714
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 05:53:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NgaG14lC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19DF520714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E3fkedhSOB8pn7/qzNg3ymq0mR5uON848gyIC0uHSSk=; b=NgaG14lCmD6pYnxZtJvruev8N
	JoJvNAVBX2ZYLtd6CNEt6SHeF3hsoTJdkdgDmq0I3yhjEyz32wI7qTCYSKwnSSQyVX/cNai72IeIe
	LGJ8gwgtO2ZA5uh+ien+3donazldeDAa3HG7kP27UxtoNHJ9uO5A+qe4bR8Be6oO06SgyhYFIlDBG
	2LCHN2Lf6O3r8LEdrw55hxMEbkjWimCbps9bLmgbNvXOCJuQR2FohxIluOEYoeKrrCOiuCW+M+XTr
	surCDHO2XvRV5+ks7zt7fd0ERPtzaARQQ6BTy+b6txnlBU/W0eLl49lhoiJgo+VeZLim7geIAjZTm
	SX4Uw6PXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRql2-0001VF-6g; Mon, 12 Oct 2020 05:52:28 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRqky-0001SH-3B; Mon, 12 Oct 2020 05:52:25 +0000
IronPort-SDR: c0IZ9Sp1bny8CHn4XP+GPUox0ICERcAAfnoO1R7XfKOeWa2uLDIwvUfuPH/37TiSPmPe9TEAfc
 BdFAIeZJHtVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="165805943"
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; d="scan'208";a="165805943"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 22:52:20 -0700
IronPort-SDR: Ya9EDAn3SOMd08SCKVKBtueoni+yyq9EF8H8N9tr+YE/IrdFHweYy6SREcwPgxnde0DbbLRvxa
 rOKYCbITG9ew==
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; d="scan'208";a="520573207"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 22:52:19 -0700
Date: Sun, 11 Oct 2020 22:52:19 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH RFC PKS/PMEM 57/58] nvdimm/pmem: Stray access protection
 for pmem->virt_addr
Message-ID: <20201012055218.GA2046448@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-58-ira.weiny@intel.com>
 <bd3f5ece-0e7b-4c15-abbc-1b3b943334dc@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd3f5ece-0e7b-4c15-abbc-1b3b943334dc@nvidia.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_015224_249584_AF7DDD63 
X-CRM114-Status: GOOD (  23.10  )
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
 linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
 Thomas Gleixner <tglx@linutronix.de>, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 ceph-devel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 io-uring@vger.kernel.org, cluster-devel@redhat.com,
 Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, linux-afs@lists.infradead.org,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-cachefs@redhat.com,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 09, 2020 at 07:53:07PM -0700, John Hubbard wrote:
> On 10/9/20 12:50 PM, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > The pmem driver uses a cached virtual address to access its memory
> > directly.  Because the nvdimm driver is well aware of the special
> > protections it has mapped memory with, we call dev_access_[en|dis]able()
> > around the direct pmem->virt_addr (pmem_addr) usage instead of the
> > unnecessary overhead of trying to get a page to kmap.
> > 
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > ---
> >   drivers/nvdimm/pmem.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> > index fab29b514372..e4dc1ae990fc 100644
> > --- a/drivers/nvdimm/pmem.c
> > +++ b/drivers/nvdimm/pmem.c
> > @@ -148,7 +148,9 @@ static blk_status_t pmem_do_read(struct pmem_device *pmem,
> >   	if (unlikely(is_bad_pmem(&pmem->bb, sector, len)))
> >   		return BLK_STS_IOERR;
> > +	dev_access_enable(false);
> >   	rc = read_pmem(page, page_off, pmem_addr, len);
> > +	dev_access_disable(false);
> 
> Hi Ira!
> 
> The APIs should be tweaked to use a symbol (GLOBAL, PER_THREAD), instead of
> true/false. Try reading the above and you'll see that it sounds like it's
> doing the opposite of what it is ("enable_this(false)" sounds like a clumsy
> API design to *disable*, right?). And there is no hint about the scope.

Sounds reasonable.

> 
> And it *could* be so much more readable like this:
> 
>     dev_access_enable(DEV_ACCESS_THIS_THREAD);

I'll think about the flag name.  I'm not liking 'this thread'.

Maybe DEV_ACCESS_[GLOBAL|THREAD]

Ira


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
