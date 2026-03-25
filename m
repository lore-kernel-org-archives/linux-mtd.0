Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41B5106B53A
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2026 13:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qPqYMdQKOqZ6yIc1s3HRbxbMyBO61w8u8JG0g/pA4I=; b=lAQ/lfP3LJU+cp
	op5fEdWp+9bsHSHPSRpPTXhWXDtXcFvGDGgo4q4gxc0D6gc4LcVJ8zxXGjLwK56k43mQBOjTURtg1
	QDqyuxp632NTs0qqt36X0XtADRaGSJROYt+GYMEGVQfgreLs31px3rDg/+cFzxLzz9hYXiTQoUPAA
	Rk54ckB8Ds2ITeevZTjZYk58GL9AD14kuZFBBEqqzRh4pJ5CIdocnfwJ+1stGWTLOfBaGbfsv/JTu
	wSeHYPEKJb3bcTNJBgDGp8SLACmxGg1k6tvreXYaH2OHdD9AYu1S4sTqA8AH/S/N9kX5mMl2wErzt
	tTUniEBVRvwm9ykzjsVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OWB-00000003UPH-3zyC;
	Wed, 25 Mar 2026 13:43:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OW8-00000003UOO-37D0;
	Wed, 25 Mar 2026 13:43:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADF8E600AC;
	Wed, 25 Mar 2026 13:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6BBC4CEF7;
	Wed, 25 Mar 2026 13:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774446207;
	bh=qxevTlxq6Ql+gdnUMuEobyzjtUWmEQEM7p+9cyL1w4Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ODtAzKp5cU4HDdomvw7sjdSs8IHMAYOOSxEs2h/rRrufXoBx4l+v61cnqidyuTOjR
	 iyslCByJgqr+gYe1bpcw+qjFkLYUy2aJBCrTv7KOx+rg/9hq5C1zQTvm6a8/0OKmDp
	 xXjVE9RyRH1deEzegZ4TCsOnQVxdwZsSvAa9CCFcC5wjmHDMcU8HW+oBbiOik87SmN
	 OLN8n4X7Jmzw1dtixKYNu9Iz2DUe+Au4CZmOQDmiYIkAkcjqZj1Bh791LYOoWgopPm
	 B4loXaMgr7w3ShZ9dyeuoE2TY9qrf2WGjX+ihaHCV+KkYfXDhqdALgObvmO/DiuGm3
	 oZal5k+Xpk1qA==
Message-ID: <bd916c05-504f-4d81-8020-45c5a563a2d8@kernel.org>
Date: Wed, 25 Mar 2026 14:43:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/21] mm: allow handling of stacked mmap_prepare hooks
 in more drivers
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
 <24aac3019dd34740e788d169fccbe3c62781e648.1774045440.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <24aac3019dd34740e788d169fccbe3c62781e648.1774045440.git.ljs@kernel.org>
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
> While the conversion of mmap hooks to mmap_prepare is underway, we will
> encounter situations where mmap hooks need to invoke nested mmap_prepare
> hooks.
> 
> The nesting of mmap hooks is termed 'stacking'.  In order to flexibly
> facilitate the conversion of custom mmap hooks in drivers which stack, we
> must split up the existing __compat_vma_mmap() function into two separate
> functions:
> 
> * compat_set_desc_from_vma() - This allows the setting of a vm_area_desc
>   object's fields to the relevant fields of a VMA.
> 
> * __compat_vma_mmap() - Once an mmap_prepare hook has been executed upon a
>   vm_area_desc object, this function performs any mmap actions specified by
>   the mmap_prepare hook and then invokes its vm_ops->mapped() hook if any
>   were specified.
> 
> In ordinary cases, where a file's f_op->mmap_prepare() hook simply needs
> to be invoked in a stacked mmap() hook, compat_vma_mmap() can be used.
> 
> However some drivers define their own nested hooks, which are invoked in
> turn by another hook.
> 
> A concrete example is vmbus_channel->mmap_ring_buffer(), which is invoked
> in turn by bin_attribute->mmap():
> 
> vmbus_channel->mmap_ring_buffer() has a signature of:
> 
> int (*mmap_ring_buffer)(struct vmbus_channel *channel,
> 			struct vm_area_struct *vma);
> 
> And bin_attribute->mmap() has a signature of:
> 
> 	int (*mmap)(struct file *, struct kobject *,
> 		    const struct bin_attribute *attr,
> 		    struct vm_area_struct *vma);
> 
> And so compat_vma_mmap() cannot be used here for incremental conversion of
> hooks from mmap() to mmap_prepare().
> 
> There are many such instances like this, where conversion to mmap_prepare
> would otherwise cascade to a huge change set due to nesting of this kind.
> 
> The changes in this patch mean we could now instead convert
> vmbus_channel->mmap_ring_buffer() to
> vmbus_channel->mmap_prepare_ring_buffer(), and implement something like:
> 
> 	struct vm_area_desc desc;
> 	int err;
> 
> 	compat_set_desc_from_vma(&desc, file, vma);
> 	err = channel->mmap_prepare_ring_buffer(channel, &desc);
> 	if (err)
> 		return err;
> 
> 	return __compat_vma_mmap(&desc, vma);
> 
> Allowing us to incrementally update this logic, and other logic like it.
> 
> Unfortunately, as part of this change, we need to be able to flexibly
> assign to the VMA descriptor, so have to remove some of the const
> declarations within the structure.
> 
> Also update the VMA tests to reflect the changes.
> 
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
