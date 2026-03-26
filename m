Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5C010A1E62
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Mar 2026 10:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9ecqjCTnhejPHA01wyYLhgPVgQzLS1VP/zqoGh9ppY=; b=r7v1CekmHAemL5
	vLfaONKEvzgBgD/zKoLB/CE8EXubz3FmnoMyYKW8pOzD24yntYTVSjhwERo7N3k0N2ebcOWYhdsqW
	8YMA9AUgn1m/820eVVHB++Yi87OjvLuH+OTBA8T3vrCJeg2zr70lJzQvVE062kmJooLi2yuiEfTvn
	9DvjE1akrEnOJb5czUhVdPHlk/ptYF1WWMcrJ+sROk5CoJwOnXSQkfPKQNRNoBddNBwHoYuQ6sExu
	unhMb8YcLe0lqCJ1+CZYJonJ5XHn0EzdRxUlNGn7mMf6rhRkPc6UI6M5/3DTtOTf4KfY+TFJlW9SN
	S1RbGhN2FxnSi0W+PAYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5iEv-00000005I0J-3wEv;
	Thu, 26 Mar 2026 10:47:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5iEt-00000005HzQ-3OZI;
	Thu, 26 Mar 2026 10:46:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C369960053;
	Thu, 26 Mar 2026 10:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E84C19423;
	Thu, 26 Mar 2026 10:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774522018;
	bh=jz4QKqDvyuc0OVYL41YLkI+2R+GPNLQTDLA2i1KuuD8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uouhDF4Qa318/Z9nX9Ws4mHmW4Xj1lUe3ecVX69vddoTww6TykXBFcfxzgLsjsVUr
	 uKEecElGaHwHYwRB5sfVpD/OA8X8sVBjVkid9cXNQoz/6KSifPhScJyeqBMrEDo8oX
	 kXSsXRIlElj4UylHMzwh3I8/YWYRmOgzn/Fvk8BThWe7Ed5I2HEPkk2q0o6tM260d/
	 VEgQAHNg8pmhJezXZ4OK7g48WOO1fuI9Upi7y7U9026H/AmdcAXA4lLqumD439oT/M
	 Pzl4dym+ApN3Z6gmLabe7ExmLvPanhPpcuvksSt4QNF6HwEvXMWbKjIEqggYMGlpNw
	 iwwZm3ig9pXBA==
Message-ID: <171549fc-8d65-41d8-9343-7fcaeeda25b1@kernel.org>
Date: Thu, 26 Mar 2026 11:46:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/21] mm: on remap assert that input range within the
 proposed VMA
Content-Language: en-US
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Clemens Ladisch <clemens@ladisch.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Bodo Stroesser <bostroesser@gmail.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 Ryan Roberts <ryan.roberts@arm.com>
References: <cover.1774045440.git.ljs@kernel.org>
 <0fc1092f4b74f3f673a58e4e3942dc83f336dd85.1774045440.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <0fc1092f4b74f3f673a58e4e3942dc83f336dd85.1774045440.git.ljs@kernel.org>
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

On 3/20/26 23:39, Lorenzo Stoakes (Oracle) wrote:
> Now we have range_in_vma_desc(), update remap_pfn_range_prepare() to check
> whether the input range in contained within the specified VMA, so we can
> fail at prepare time if an invalid range is specified.
> 
> This covers the I/O remap mmap actions also which ultimately call into
> this function, and other mmap action types either already span the full
> VMA or check this already.
> 
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

> ---
>  mm/memory.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 53ef8ef3d04a..68cc592ff0ba 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3142,6 +3142,9 @@ int remap_pfn_range_prepare(struct vm_area_desc *desc)
>  	const bool is_cow = vma_desc_is_cow_mapping(desc);
>  	int err;
>  
> +	if (!range_in_vma_desc(desc, start, end))
> +		return -EFAULT;
> +
>  	err = get_remap_pgoff(is_cow, start, end, desc->start, desc->end, pfn,
>  			      &desc->pgoff);
>  	if (err)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
