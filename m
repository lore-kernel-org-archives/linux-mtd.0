Return-Path: <SRS0=cnOS=DR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21EF5C433DF
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2020 02:54:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEF7F2076C
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2020 02:54:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pVA5/SBg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="edx7xet+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEF7F2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QgP+RY0mIta8AZptqjtZtAXVKC4E3i7fvJ5HdaxnX7k=; b=pVA5/SBg2g19xh7sLKf/whz2a
	qwZLR+EnDm6PFqfBQpBjodUniMr4uaDVbYLl/tJ65/8HA16PkK2+oq4j6WhAhlMiZP4YG/yckMcPy
	wFZcOtpqDR/kYVw1huKMYXPpbSnh2HrgdI8fZCL6a0iP77tPtpK8BFiKIlEiw4IQWLBn0bPVkv3Em
	NGyCY7OOMBgxcZJsXFFBG91HtOXYHEcgDBlNiDJnXraqK6v/vVuKbmxdu3yMxfzKo/1no4u+/bhDC
	cLLZSXrxlInToYUHnkeMYFrJ7InjyW7b1kHhbW8s+9+hjcSZ7duuyGHOldjBALG0+WD6S12rl+/Vd
	G16iGSo8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kR50Z-0007Be-5i; Sat, 10 Oct 2020 02:53:19 +0000
Received: from hqnvemgate24.nvidia.com ([216.228.121.143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kR50U-00078y-Gh; Sat, 10 Oct 2020 02:53:17 +0000
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f8121a50000>; Fri, 09 Oct 2020 19:51:17 -0700
Received: from [10.2.51.144] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 10 Oct
 2020 02:53:07 +0000
Subject: Re: [PATCH RFC PKS/PMEM 57/58] nvdimm/pmem: Stray access protection
 for pmem->virt_addr
To: <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-58-ira.weiny@intel.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <bd3f5ece-0e7b-4c15-abbc-1b3b943334dc@nvidia.com>
Date: Fri, 9 Oct 2020 19:53:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201009195033.3208459-58-ira.weiny@intel.com>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602298277; bh=hKwlK3WolBLUufkeWDHCi6j+X4NXa8gQFiKyGjbOY3s=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=edx7xet+HWktPTMH7LfazMaeZj84i5/Le7BE3m/9xNKYA9bmh246jZEvn48F/uMcW
 RRn8BggXdwK6EgYw84fvX6LW3WH/wQjijcVtcfekd8K6KkJdzgyiWWhhWRHsAgsUWu
 ErO3rgTi0L/NWozRhmjxim3aejVQ7k0j+Xmczu6ahvjgHQEdG1f6IxukspiHHh4eDZ
 vXW13vRjbU9kKvq3xSMRRweChxuwg1Gt9UWgcBiwICYzh7lbhEKe0zR7+e8y/8iSgu
 9o2Hr0ioZGbS1OLU7+SDtKlkAPg/fZiUxFefl5DnOwU2H5+VRhK6GCiKvAXlVbpTMd
 H8SS1utYxNiTQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_225314_649177_3DBE6235 
X-CRM114-Status: GOOD (  17.75  )
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
 linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
 samba-technical@lists.samba.org, ceph-devel@vger.kernel.org,
 drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 linux-afs@lists.infradead.org, cluster-devel@redhat.com,
 linux-cachefs@redhat.com, intel-wired-lan@lists.osuosl.org,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, linux-um@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, io-uring@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/9/20 12:50 PM, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> The pmem driver uses a cached virtual address to access its memory
> directly.  Because the nvdimm driver is well aware of the special
> protections it has mapped memory with, we call dev_access_[en|dis]able()
> around the direct pmem->virt_addr (pmem_addr) usage instead of the
> unnecessary overhead of trying to get a page to kmap.
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> ---
>   drivers/nvdimm/pmem.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> index fab29b514372..e4dc1ae990fc 100644
> --- a/drivers/nvdimm/pmem.c
> +++ b/drivers/nvdimm/pmem.c
> @@ -148,7 +148,9 @@ static blk_status_t pmem_do_read(struct pmem_device *pmem,
>   	if (unlikely(is_bad_pmem(&pmem->bb, sector, len)))
>   		return BLK_STS_IOERR;
>   
> +	dev_access_enable(false);
>   	rc = read_pmem(page, page_off, pmem_addr, len);
> +	dev_access_disable(false);

Hi Ira!

The APIs should be tweaked to use a symbol (GLOBAL, PER_THREAD), instead of
true/false. Try reading the above and you'll see that it sounds like it's
doing the opposite of what it is ("enable_this(false)" sounds like a clumsy
API design to *disable*, right?). And there is no hint about the scope.

And it *could* be so much more readable like this:

     dev_access_enable(DEV_ACCESS_THIS_THREAD);



thanks,
-- 
John Hubbard
NVIDIA

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
