Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958191099B35
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 19:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aN4CJ/1mfarlhbIh0acbSIrhJhV1xiOK/awXWaPZPaw=; b=AggKUiCOlm2fpA
	OlIdrwA8wDknKBRlbbfsTo0BO5r1NoB3YdFc1o/2eMgvRek7D/ET+mCEPeGUdvI20/n2vk+hdEb4v
	lbuJolrX0rN7WScSw6bXIosjLAE7kvXWX2sYMkp2wEIA9IL0dPR9h6P242kE2ohk+eLAESTK9q8b5
	Yu7nxGkg2dRVBkjGJTWWCwEHNv/cSIAliaV6fV/fTwV5aGmqlwIRu8KkbHtvk4DYVFU0g3p81+kvh
	5aVLnEc08GN6v8ai9YqTGNc/VOj2cEA7JRIdSZtWGgx6J0EULEidF1zH+TDYDd6YpUewJgDrMUltc
	M3A230Z3qXMcUciPmb9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3f5w-0000000DPan-1hpf;
	Fri, 20 Mar 2026 19:01:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3f5s-0000000DPZx-2YZQ;
	Fri, 20 Mar 2026 19:01:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8403D44062;
	Fri, 20 Mar 2026 19:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07F5C2BCB0;
	Fri, 20 Mar 2026 19:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774033271;
	bh=IRzwBVB0zy+xeJPrWoPBH63WlZlvsdY9Se2uWMFPHws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILLXPG4yVPR0GDfMIEVi2nln57yMPmACXQ1ivP8/+4v6ApWNPyZQVwcO8Ue5pPxiS
	 WK47pP/CTV5GnZSDg9N7cRjDlm27drFIsN77fBPEKn69UM7rB3USrjXIpPU2eOzGve
	 Nkqwyv6CkOKOeMknBTVOFTUl8fBFKgSTkggkKbQSAoA8NV0Wo7fW0+IGGcJGZS3z5Q
	 9+W0rb/lNybrKvjRjIS1QOugOJs5rOwU2otS9o0FsUQBTvRurI+3cnIanWccwlJfP/
	 t2BXlSjTo8PA3OZzTO5QTr1SoETkBdeDcVadNFWdNARo1E/k++QeAE0RT40ZxwdQBF
	 7+sGFqHZzkj5g==
Date: Fri, 20 Mar 2026 19:01:00 +0000
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
Subject: Re: [PATCH v3 05/16] fs: afs: correctly drop reference count on
 mapping failure
Message-ID: <995afd70-d7c2-42af-8012-589b3319d31a@lucifer.local>
References: <cover.1773944114.git.ljs@kernel.org>
 <018cd0d8b2dae44de6d3952527e754e52ef02da8.1773944114.git.ljs@kernel.org>
 <608ba54c-f19e-4e27-8142-0870f91d6514@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <608ba54c-f19e-4e27-8142-0870f91d6514@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_120112_664970_C8DDFADF 
X-CRM114-Status: GOOD (  14.02  )
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

On Fri, Mar 20, 2026 at 07:57:29PM +0100, Vlastimil Babka (SUSE) wrote:
> On 3/19/26 19:23, Lorenzo Stoakes (Oracle) wrote:
> > Commit 9d5403b1036c ("fs: convert most other generic_file_*mmap() users to
> > .mmap_prepare()") updated AFS to use the mmap_prepare callback in favour
> > of the deprecated mmap callback.
> >
> > However, it did not account for the fact that mmap_prepare is called
> > pre-merge, and may then be merged, nor that mmap_prepare can fail to map
> > due to an out of memory error.
>
> So that means a file can become pinned forever? OOM is probably only a
> problem with fault injection in practice, but the merge case can happen. And
> 9d5403b1036c is pre-6.18 LTS. Are we going to need Fixes: and Cc: stable then?

That'd require backporting all of the .mapped functionality and half of this
series, I don't think that's really practical.

I guess I can do a manual backport of a partial revert.

Thanks, Lorenzo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
