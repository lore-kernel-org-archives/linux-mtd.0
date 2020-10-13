Return-Path: <SRS0=Emx/=DU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3594DC433E7
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 18:37:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A412B208D5
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 18:37:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rccett60";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="Epy+q5an";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="v5OoWtfl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A412B208D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tmo0drVpkGjcHihZ09wuirpg/QUEKRRrD7h7rwQytMY=; b=rccett60bPB/DQO2Bcano2Xf6
	BCDjtvSVqU3imtAT0FhhquoqTN2e9PPwrNVIhddSLjt1TVUigxGQn6yZh6Rxq71wTguvZHiiOD2WY
	zv4sNRNQH2a11/7h04MrXxOtcNmJdAR8BGLWOKfXa56WM3MVQimiyh77ccaqZIWga3T3qESbVqp4K
	GX5CvLRiUS8pM9/Ry+OIrRbjoBdrqgjUMNw3CcIOYhfjwo7xmJkdwQevUq0B8CQYInEqUa7big4La
	g5fOzwGgKpIxXyxt3u+/r1fbe5PvfpLdtam2nrCh9g1nwb3pYf4YfwfgQG6gQobUU1VsmuE/aHO5f
	L+dpQnviA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSPAY-0002yA-CO; Tue, 13 Oct 2020 18:37:06 +0000
Received: from pb-sasl-trial2.pobox.com ([64.147.108.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSPAU-0002vy-C8; Tue, 13 Oct 2020 18:37:04 +0000
Received: from pb-sasl-trial2.pobox.com (localhost.local [127.0.0.1])
 by pb-sasl-trial2.pobox.com (Postfix) with ESMTP id B35092F08C;
 Tue, 13 Oct 2020 14:36:58 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=1qdRcPgrMg9PaaTRWeHMHkWBgn4=; b=Epy+q5
 ans9ahJwXxlQvxdjICPrBYTo3ECIn9AzWxzmuo835zX7Go5RA+la+QVdJswbYHqY
 OA9uOWP+RHqwo1f/1Hjwskkbh9itwsmr5IKrZUme2Q4YRp5bQABuumhmd/Yh0NKM
 sMhZUgbkZQs79wJJn2wtIPZ7EN0v5uRSG8bTQ=
Received: from pb-smtp1.nyi.icgroup.com (pb-smtp1.pobox.com [10.90.30.53])
 by pb-sasl-trial2.pobox.com (Postfix) with ESMTP id 7910C2F08B;
 Tue, 13 Oct 2020 14:36:58 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=/xoWviDLFg5PKRQ9rObRWDXVC++pmZtYhfbDb0DFq7E=;
 b=v5OoWtflZD131TYsBl2A9g0L/PCRe2nu6sy2IJY2ys8stI3sGPGydjk9hbVpZeTUKIjemrnRhLwKFlAM+dXEIGXz5t0LfwSiRA8m7hrB4WLH79+9F2ww8ICEhYu0fLjFgoDc1lKWqG4ZKNRDYjtbn/p6CJBipu1Te7ZvLuk/HMw=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id CD98F955F4;
 Tue, 13 Oct 2020 14:36:57 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id CF7492DA0BC7;
 Tue, 13 Oct 2020 14:36:56 -0400 (EDT)
Date: Tue, 13 Oct 2020 14:36:56 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH RFC PKS/PMEM 33/58] fs/cramfs: Utilize new
 kmap_thread()
In-Reply-To: <20201009195033.3208459-34-ira.weiny@intel.com>
Message-ID: <nycvar.YSQ.7.78.906.2010131436200.2184@knanqh.ubzr>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-34-ira.weiny@intel.com>
MIME-Version: 1.0
X-Pobox-Relay-ID: 13301A02-0D83-11EB-84D0-D152C8D8090B-78420484!pb-smtp1.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_143702_464800_A98C7B2F 
X-CRM114-Status: GOOD (  19.84  )
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

On Fri, 9 Oct 2020, ira.weiny@intel.com wrote:

> From: Ira Weiny <ira.weiny@intel.com>
> 
> The kmap() calls in this FS are localized to a single thread.  To avoid
> the over head of global PKRS updates use the new kmap_thread() call.
> 
> Cc: Nicolas Pitre <nico@fluxnic.net>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

Acked-by: Nicolas Pitre <nico@fluxnic.net>

>  fs/cramfs/inode.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> index 912308600d39..003c014a42ed 100644
> --- a/fs/cramfs/inode.c
> +++ b/fs/cramfs/inode.c
> @@ -247,8 +247,8 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
>  		struct page *page = pages[i];
>  
>  		if (page) {
> -			memcpy(data, kmap(page), PAGE_SIZE);
> -			kunmap(page);
> +			memcpy(data, kmap_thread(page), PAGE_SIZE);
> +			kunmap_thread(page);
>  			put_page(page);
>  		} else
>  			memset(data, 0, PAGE_SIZE);
> @@ -826,7 +826,7 @@ static int cramfs_readpage(struct file *file, struct page *page)
>  
>  	maxblock = (inode->i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
>  	bytes_filled = 0;
> -	pgdata = kmap(page);
> +	pgdata = kmap_thread(page);
>  
>  	if (page->index < maxblock) {
>  		struct super_block *sb = inode->i_sb;
> @@ -914,13 +914,13 @@ static int cramfs_readpage(struct file *file, struct page *page)
>  
>  	memset(pgdata + bytes_filled, 0, PAGE_SIZE - bytes_filled);
>  	flush_dcache_page(page);
> -	kunmap(page);
> +	kunmap_thread(page);
>  	SetPageUptodate(page);
>  	unlock_page(page);
>  	return 0;
>  
>  err:
> -	kunmap(page);
> +	kunmap_thread(page);
>  	ClearPageUptodate(page);
>  	SetPageError(page);
>  	unlock_page(page);
> -- 
> 2.28.0.rc0.12.gb6a658bd00c9
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
