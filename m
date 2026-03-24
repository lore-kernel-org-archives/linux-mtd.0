Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D27F54ACD
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2026 15:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Yr/004XdD6e7fFuuCXdlY+KTQ0EOphbjWW0VE7Rdk0=; b=XvEAJAxW4KFu8i
	D0LghCTC0g8N2ubQFkDlKp4hQThgGJ+bPKlr7FWi95n1OYlHhmg9FgyovRT99TjOlewWR26uqVyr2
	okvReYBCXYMw4h7w3XC7LG6VQ3iV6aK7HCzfdZc8wY2kORWjpUNJRzba3mUEdUCyp2EBlvAmiAmpD
	n0H8DkCL+trIQ5ZuPjDiaV0aiE6G3Ogr87wF9DbcPqPCzTxT1AZOIGCWTdtLlvLbWWxbYMUkb7uPW
	Vmejev1USEa7Irj5ZtFl988C+q5JLDE3v6jyHiMbUIqL4e2WydqAWQ6uImrQUkdc9P35mthZMK5/0
	oMoS09yykYvZSS9US7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53k8-00000001lfy-2j2D;
	Tue, 24 Mar 2026 15:32:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53k4-00000001leo-2yex;
	Tue, 24 Mar 2026 15:32:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FBE240D73;
	Tue, 24 Mar 2026 15:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E0FC19424;
	Tue, 24 Mar 2026 15:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774366348;
	bh=Pj+OtiBpuBF7IoC42Kw/vtLSB42CPkuKUZUpsmZAtF8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A8CdR1TDIvUqf/UIBWs17Nn4y+ea/fY6CzTak5aX12J4D+twwLfy+SwnX5lrhff4D
	 CUzBvNr9gv4/0D50Bsuh5GstOCFIQ7l1/YDJTViyrQcTcXkjPsV2NcEd1kTpkceCXt
	 qvmlEfeNjP0yn00Q1AmSFrv9QGGtJ2oKpyqS2VkQuMlb7xlEpzGPo2Z8H/X24jQkzS
	 /dRZDV1lzwWddAwn65weghGa9oo7qiThUc/kW/BhhH1pEumyxJoYG7WP3BMi6+9/xr
	 Y4kgvnO6kl4rFLyL5hI2Nvbd4V/5vHv9ZNMEpKAQRKpcauDbgPeLzXT7iYy5Aj7+iX
	 gcx1tICooGAPQ==
Message-ID: <ee66e204-4439-482f-a8cc-93de1d332a8d@kernel.org>
Date: Tue, 24 Mar 2026 16:32:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/21] mm: add vm_ops->mapped hook
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
 <4c5e98297eb0aae9565c564e1c296a112702f144.1774045440.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <4c5e98297eb0aae9565c564e1c296a112702f144.1774045440.git.ljs@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_083228_789317_EFD33603 
X-CRM114-Status: GOOD (  23.16  )
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
> Previously, when a driver needed to do something like establish a
> reference count, it could do so in the mmap hook in the knowledge that the
> mapping would succeed.
> 
> With the introduction of f_op->mmap_prepare this is no longer the case, as
> it is invoked prior to actually establishing the mapping.
> 
> mmap_prepare is not appropriate for this kind of thing as it is called
> before any merge might take place, and after which an error might occur
> meaning resources could be leaked.
> 
> To take this into account, introduce a new vm_ops->mapped callback which
> is invoked when the VMA is first mapped (though notably - not when it is
> merged - which is correct and mirrors existing mmap/open/close behaviour).
> 
> We do better that vm_ops->open() here, as this callback can return an
> error, at which point the VMA will be unmapped.
> 
> Note that vm_ops->mapped() is invoked after any mmap action is complete
> (such as I/O remapping).
> 
> We intentionally do not expose the VMA at this point, exposing only the
> fields that could be used, and an output parameter in case the operation
> needs to update the vma->vm_private_data field.
> 
> In order to deal with stacked filesystems which invoke inner filesystem's
> mmap() invocations, add __compat_vma_mapped() and invoke it on vfs_mmap()
> (via compat_vma_mmap()) to ensure that the mapped callback is handled when
> an mmap() caller invokes a nested filesystem's mmap_prepare() callback.
> 
> Update the mmap_prepare documentation to describe the mapped hook and make
> it clear what its intended use is.
> 
> The vm_ops->mapped() call is handled by the mmap complete logic to ensure
> the same code paths are handled by both the compatibility and VMA layers.
> 
> Additionally, update VMA userland test headers to reflect the change.
> 
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
