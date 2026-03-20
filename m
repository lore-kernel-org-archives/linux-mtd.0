Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCBA1099B37
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 20:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=55BOtkVgNk3FA0DgYwV0oMMdC1fZfTISzJMpYzosw0k=; b=Xw9EBN5T7qRhO+
	9V0oIWaxYAOfOzvqCUEUSHas9RyFGDQR3FHh3fYkFSr6ozXqyy6A2z19jPlK8KRir5Yq949mcY5UB
	OUuS9UyJR87IfAW2Cr5qq7G0PvmSzHwNOSxqyboxxiLVZNP3oTKKRuKhzROSF5zf58q2X1vOLl2pA
	eQnwKzSnZ4hrFtKthkkQc/Gq3eKCMwZZFsrkK3o1KcdT3ojjqZ/1gaQdPBaw9razhfqAssVBYHA1G
	mDnHCwyB6AWDdgt8/GXL22BzCjpJEMUx/4berv1AXbbHeBkfNRCsdVJI5gpe0b2IR/NYDQOV4NvVR
	sJVSjc3E3YIbT8ObAvwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ggy-0000000DZkl-1KDD;
	Fri, 20 Mar 2026 20:43:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ggw-0000000DZkD-17U4;
	Fri, 20 Mar 2026 20:43:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3419D60154;
	Fri, 20 Mar 2026 20:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D20C2BC87;
	Fri, 20 Mar 2026 20:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774039412;
	bh=XzczC32VV00AwDiIh21zb/sCHxyX8rnSOTF7An9uPcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CypuAB31keYeNpOx6+BKaUkwMJAfZXn2C8u2PsOdPDThy38YXRFbY3/5pqAtP2cro
	 HcRPsPMEoqtBOp0Y89OOq0diEXH+QJUGD4o3QQPB/lSWNd63ck3NFlPYMPPWlX6Xdh
	 NY1MxQ8mtYPuDD9Hbj0TTMRMJ5nHPBd59/x7XDvfNJi+dQOQLqpW3Cc07z0rxBdKVg
	 Zj4xs72z1sb5iNfDp0ESmZJVtFbjrzICMsXM1S8xUE9gwY/R6UUKFhHfPVNUMKzrEc
	 uXQMf3LaWOivk84XWig7hurOoAmqWcKrF5KB1u4nDb4nrI88wQkI0PYARg8sxzO+Xv
	 /gE1kUOfP2KbA==
Date: Fri, 20 Mar 2026 20:43:30 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Clemens Ladisch <clemens@ladisch.de>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Bodo Stroesser <bostroesser@gmail.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, 
	David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	David Hildenbrand <david@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v3 04/16] mm: add vm_ops->mapped hook
Message-ID: <f711f67a-9c87-4c9c-8ddd-0a78df962942@lucifer.local>
References: <cover.1773944114.git.ljs@kernel.org>
 <a97366fa6f22a0ca1340cfd2b0d4df87c80ac80a.1773944114.git.ljs@kernel.org>
 <c9068fbb-a23c-4342-8638-3b11897a57cb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9068fbb-a23c-4342-8638-3b11897a57cb@kernel.org>
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

On Fri, Mar 20, 2026 at 07:26:37PM +0100, Vlastimil Babka (SUSE) wrote:
> On 3/19/26 19:23, Lorenzo Stoakes (Oracle) wrote:
> > Previously, when a driver needed to do something like establish a
> > reference count, it could do so in the mmap hook in the knowledge that the
> > mapping would succeed.
> >
> > With the introduction of f_op->mmap_prepare this is no longer the case, as
> > it is invoked prior to actually establishing the mapping.
> >
> > mmap_prepare is not appropriate for this kind of thing as it is called
> > before any merge might take place, and after which an error might occur
> > meaning resources could be leaked.
> >
> > To take this into account, introduce a new vm_ops->mapped callback which
> > is invoked when the VMA is first mapped (though notably - not when it is
> > merged - which is correct and mirrors existing mmap/open/close behaviour).
> >
> > We do better that vm_ops->open() here, as this callback can return an
> > error, at which point the VMA will be unmapped.
> >
> > Note that vm_ops->mapped() is invoked after any mmap action is complete
> > (such as I/O remapping).
> >
> > We intentionally do not expose the VMA at this point, exposing only the
> > fields that could be used, and an output parameter in case the operation
> > needs to update the vma->vm_private_data field.
> >
> > In order to deal with stacked filesystems which invoke inner filesystem's
> > mmap() invocations, add __compat_vma_mapped() and invoke it on vfs_mmap()
> > (via compat_vma_mmap()) to ensure that the mapped callback is handled when
> > an mmap() caller invokes a nested filesystem's mmap_prepare() callback.
> >
> > We can now also remove call_action_complete() and invoke
> > mmap_action_complete() directly, as we separate out the rmap lock logic.
> >
> > The rmap lock logic, which was added in order to keep hugetlb working (!)
> > to allow for the rmap lock to be held longer, needs to be propagated to the
> > error paths on mmap complete and mapped hook error paths.
> >
> > This is because do_munmap() might otherwise deadlock with the rmap being
> > held, so instead we unlock at the point of unmap.
>
> Hmm but that was also true prior to this series? So is this a bugfix? Should
> it be a stable hotfix done outside of the series before the refactoring?

Yup, will send a hotfix.

Thanks, Lorenzo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
