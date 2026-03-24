Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8E6F54ACF
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2026 16:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yW0EoWPxP85LPiphINmdGBM0KJ1QBTTQYClH5BizYzw=; b=Pjj8N/qFi2RDR3
	05W19Z7s3LLtZvNDFqtzgyCukEkqneDrFh9viCV36dPaVwLPuz8YpX5N7sjgGi4B/Pp+KITHpp+0y
	CIo+Debr9hPwJ6GfqbrziAc995jZOpYvytbhcSf7VXlFp3yJxs0TWWEP21+Rm/hXoQtmvu3ks2Bjp
	qS8rhn/nU39W0bPCjve/jnpwk4BNs17DTYic0Bp4heIl/+giYhVyYoXUeYwqIIGIFMkHsfLy2zxqr
	4lDpDOA+nSXH6wZGHaddMc7TR0WFg7T0NyTfZZBh4kVN4weZObYM+r1/mMe9mylKx9Y66pjyLoIVz
	xaOHY3i1bob9LAf8sUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54j0-00000001taB-0Qv6;
	Tue, 24 Mar 2026 16:35:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54ix-00000001tZT-0JAW;
	Tue, 24 Mar 2026 16:35:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6FAE43878;
	Tue, 24 Mar 2026 16:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27FCC19424;
	Tue, 24 Mar 2026 16:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774370121;
	bh=uvgrzaHO3grkwKy9+089vaxpnmbs4+0xFVD7fE+BlCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mCj3nnRZEPIdtmViKw3PDpai7OwDquEgzLJEZ26oE90AfteaXy0i9TaB/c7BaxFvb
	 TbEiCuWEA6Wv27Asd6DPIJsTH4Mx9POnWfqMFokRI+bLy/W2CLoSfDEWfM24Us13Cs
	 QXtvIAoK0qd8ujZUWv2rJrVyiBeVoH8QP/Ob/fjUArQV4sgDIv/QN7M4pvzKbUoZdK
	 +j93tcLxP+JAgxjn7Uj5hDnfPw51TI0eFm6GJldqWDg6h4T1BtYK6geAEWodxE/Zw7
	 nSMQAMGNOD6Cc/Ya9icBBPVn1CDFRReP2qnF9OeRpbQUvvkbOLXBBmRg8bD9QubspZ
	 mndsFT1HJo3ng==
Date: Tue, 24 Mar 2026 16:35:10 +0000
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
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-mtd@lists.infradead.org, linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v4 05/21] mm: switch the rmap lock held option off in
 compat layer
Message-ID: <ad5e5bed-12b7-4ef7-a93f-753489115cb0@lucifer.local>
References: <cover.1774045440.git.ljs@kernel.org>
 <dda74230d26a1fcd79a3efab61fa4101dd1cac64.1774045440.git.ljs@kernel.org>
 <d5b66671-697f-4a4d-8039-d9c9ac5ad4d7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d5b66671-697f-4a4d-8039-d9c9ac5ad4d7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_093523_154122_9932AB2E 
X-CRM114-Status: GOOD (  22.82  )
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

On Tue, Mar 24, 2026 at 03:26:28PM +0100, Vlastimil Babka (SUSE) wrote:
> On 3/20/26 23:39, Lorenzo Stoakes (Oracle) wrote:
> > In the mmap_prepare compatibility layer, we don't need to hold the rmap
> > lock, as we are being called from an .mmap handler.
> >
> > The .mmap_prepare hook, when invoked in the VMA logic, is called prior to
> > the VMA being instantiated, but the completion hook is called after the VMA
> > is linked into the maple tree, meaning rmap walkers can reach it.
> >
> > The mmap hook does not link the VMA into the tree, so this cannot happen.
> >
> > Therefore it's safe to simply disable this in the mmap_prepare
> > compatibility layer.
> >
> > Also update VMA tests code to reflect current compatibility layer state.
> >
> > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
>
> Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
>
> a typo fix below, Andrew can fix locally?
>
> > ---
> >  mm/util.c                       |  6 ++++-
> >  tools/testing/vma/include/dup.h | 42 +++++++++++++++++----------------
> >  2 files changed, 27 insertions(+), 21 deletions(-)
> >
> > diff --git a/mm/util.c b/mm/util.c
> > index a2cfa0d77c35..182f0f5cc400 100644
> > --- a/mm/util.c
> > +++ b/mm/util.c
> > @@ -1204,6 +1204,7 @@ int compat_vma_mmap(struct file *file, struct vm_area_struct *vma)
> >
> >  		.action.type = MMAP_NOTHING, /* Default */
> >  	};
> > +	struct mmap_action *action = &desc.action;
> >  	int err;
> >
> >  	err = vfs_mmap_prepare(file, &desc);
> > @@ -1214,8 +1215,11 @@ int compat_vma_mmap(struct file *file, struct vm_area_struct *vma)
> >  	if (err)
> >  		return err;
> >
> > +	/* being invoked from .mmmap means we don't have to enforce this. */
>
> 				.mmap

mmmmm map! ;)

Andrew - could you fixup in place? Thanks.

>
> > +	action->hide_from_rmap_until_complete = false;
> > +
> >  	set_vma_from_desc(vma, &desc);
> > -	err = mmap_action_complete(vma, &desc.action);
> > +	err = mmap_action_complete(vma, action);
> >  	if (err) {
> >  		const size_t len = vma_pages(vma) << PAGE_SHIFT;
> >

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
