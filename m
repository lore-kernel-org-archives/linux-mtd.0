Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129C3106ACEE
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2026 21:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZOGZM60mchVBrafGGcbROImSZAjMvtaUAfxooQD82+U=; b=uoq9TADkDNsCEV
	bGqwJTAaelHkH57L833KJ1ixtle6XkZEK6opuKqPJhvpiGpY5ZTxt7m3wgmoQjNlqt3TAOz9cI7oh
	6mW1TY3lYcfVfajwQdubI4PNvRBxjDA7dqHJD8hN7mEfkjgBuGeik9HSOxPQGih8EwfgbLBjGzxXi
	JcpYlz7vozlIJMrD+mHcktm4JrSO5MqbaJiwKDtdhjDd06JLLDV2g9L/rrHhQ6C1VsWrNJ7ttvEue
	B13P6svQE9CkxUftlAoeNOAbUvGU+qOdH4W6B4MDDvwy7Ko3OK6VQkDoxmdZ5qL+LbfMx7mTJAo53
	9DqMjIuysGnnEST3OCEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0nMX-0000000FQG5-0P0T;
	Thu, 12 Mar 2026 21:14:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0nMU-0000000FQEz-0tFd;
	Thu, 12 Mar 2026 21:14:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03C6B44398;
	Thu, 12 Mar 2026 21:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3794C4CEF7;
	Thu, 12 Mar 2026 21:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773350068;
	bh=BHIeqMCeZ08yvAl5YqqjtddRClVSOvGwSHug5GXzEz8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Duh+dhDjn9i3oyIucNjLcpV7CKSwWMDBwP1nrAeCAWcyGXtDakHpRp+pm3kMEvL8y
	 SEaAaWk5jP3gQGaz8kV5kaoD1HdJgTdnHuWBZE8KvOuDSG+7q7krHiTC3YYNdfGDfn
	 Xpz6tLlo5tMrkq0Sz1LyxlbqOsozNn9yfZFUkN8M=
Date: Thu, 12 Mar 2026 14:14:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Clemens Ladisch <clemens@ladisch.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Bodo Stroesser <bostroesser@gmail.com>, "Martin K . Petersen"
 <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, Marc
 Dionne <marc.dionne@auristor.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, David Hildenbrand <david@kernel.org>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal
 Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, Pedro Falcato
 <pfalcato@suse.de>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, Ryan Roberts
 <ryan.roberts@arm.com>
Subject: Re: [PATCH 01/15] mm: various small mmap_prepare cleanups
Message-Id: <20260312141425.1837736829210f2d0b00cac6@linux-foundation.org>
In-Reply-To: <56372fe273f775b26675a04652c1229e14680741.1773346620.git.ljs@kernel.org>
References: <cover.1773346620.git.ljs@kernel.org>
	<56372fe273f775b26675a04652c1229e14680741.1773346620.git.ljs@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_141430_296959_5096EC13 
X-CRM114-Status: GOOD (  11.40  )
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

On Thu, 12 Mar 2026 20:27:16 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org> wrote:

> +int mmap_action_prepare(struct vm_area_desc *desc,
> +			struct mmap_action *action)
> +
>  {
>  	switch (action->type) {
>  	case MMAP_NOTHING:
> -		break;
> +		return 0;
>  	case MMAP_REMAP_PFN:
> -		remap_pfn_range_prepare(desc, action->remap.start_pfn);
> -		break;
> +		return remap_pfn_range_prepare(desc, action);
>  	case MMAP_IO_REMAP_PFN:
> -		io_remap_pfn_range_prepare(desc, action->remap.start_pfn,
> -					   action->remap.size);
> -		break;
> +		return io_remap_pfn_range_prepare(desc, action);
>  	}
>  }
>  EXPORT_SYMBOL(mmap_action_prepare);

hm, was this the correct version?

mm/util.c: In function 'mmap_action_prepare':
mm/util.c:1451:1: error: control reaches end of non-void function [-Werror=return-type]
 1451 | }

--- a/mm/util.c~mm-various-small-mmap_prepare-cleanups-fix
+++ a/mm/util.c
@@ -1356,6 +1356,8 @@ int mmap_action_prepare(struct vm_area_d
 		return remap_pfn_range_prepare(desc, action);
 	case MMAP_IO_REMAP_PFN:
 		return io_remap_pfn_range_prepare(desc, action);
+	default:
+		BUG();
 	}
 }
 EXPORT_SYMBOL(mmap_action_prepare);
_


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
