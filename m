Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B79FE9A76A
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2026 10:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hu7NMWWPN1jvFKyjYWNk4IQKvSYL348DRw9rNUKQoIE=; b=MqhA53NfUeeFq4
	vdRmm15mXu5ZcQ3kAYqsy31IAoYCmnbzqHpAlOyE9tR6fcfEDOk64+q1mdEwd6SHQnNrAfXZNNOc+
	lP03GvHNoroPyohNRZIjHPnleJDf1vx2rvQkBYv3K0VVcTb9iNkToJhzPNU/wSq5MGT2sBSMf9f31
	TnsFSP6slU3dhZymEHneigPeg60bSCt35UVI4Jk1n4Plbhm168shBOKew6kXBp+HelIpykw5whyQ6
	j43YKO7ayXu2hUyG/C1SbbOI8a2UJIRBpJux5cQ6Qm1IuznE1OAD0JxGrN0Gu2PFp/c4cVkfjiPWg
	71bpAQPi5nt6P6eHoY8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zQR-00000001F4s-0QYo;
	Tue, 24 Mar 2026 10:55:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zQN-00000001F46-2t6A;
	Tue, 24 Mar 2026 10:55:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4078344490;
	Tue, 24 Mar 2026 10:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D7FC19424;
	Tue, 24 Mar 2026 10:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774349751;
	bh=PKmRQSmpQcoJaB3C8EeGp80u+1D+x7QmhnNQbCSeB8o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fMEcgbbGgPyzprrfIXmnWzFQVASvL51viSIEUIGq0ULM2FvF4mbfhFjh/HfjosHht
	 cgW+/u9gxB9fYbahyMGnurb7qoARj2GLGX6Ra96W/IHys+NfiTnIL/mImcGXUmlDjh
	 NebVgjLehpGJwqkV4cVX7lDDhnYo58udnTxoI3ZrFyMQMHtl4DswqW26b/zG06s1sO
	 T1KpDuiaLK8G1+W+b214NZfc+rI3YgT9zrIPw8TCw1KOpmEjvUWFSZAmeubTl2MSkT
	 fUye6Vy/rI8+HkSs58CRHJoldtPx4J8kBNNWCqvbMR5Ikppaz5prA9TA7BNpQhgvcl
	 Af6e9o0yrXfiQ==
Message-ID: <a9ac9f4b-9b25-43f3-a2c1-da7157a95ab9@kernel.org>
Date: Tue, 24 Mar 2026 11:55:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/21] mm: avoid deadlock when holding rmap on
 mmap_prepare error
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
 <d44248be9da68258b07c2c59d4e73485ee0ca943.1774045440.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <d44248be9da68258b07c2c59d4e73485ee0ca943.1774045440.git.ljs@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_035551_772470_181B3578 
X-CRM114-Status: GOOD (  19.58  )
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
> Commit ac0a3fc9c07d ("mm: add ability to take further action in
> vm_area_desc") added the ability for drivers to instruct mm to take actions
> after the .mmap_prepare callback is complete.
> 
> To make life simpler and safer, this is done before the VMA/mmap write lock
> is dropped but when the VMA is completely established.
> 
> So on error, we simply munmap() the VMA.
> 
> As part of this implementation, unfortunately a horrible hack had to be
> implemented to support some questionable behaviour hugetlb relies upon -
> that is that the file rmap lock is held until the operation is complete.
> 
> The implementation, for convenience, did this in mmap_action_finish() so
> both the VMA and mmap_prepare compatibility layer paths would have this
> correctly handled.
> 
> However, it turns out there is a mistake here - the rmap lock cannot be
> held on munmap, as free_pgtables() -> unlink_file_vma_batch_add() ->
> unlink_file_vma_batch_process() takes the file rmap lock.
> 
> We therefore currently have a deadlock issue that might arise.
> 
> Resolve this by leaving it to callers to handle the unmap.
> 
> The compatibility layer does not support this rmap behaviour, so we simply
> have it unmap on error after calling mmap_action_complete().
> 
> In the VMA implementation, we only perform the unmap after the rmap lock is
> dropped.
> 
> This resolves the issue by ensuring the rmap lock is always dropped when
> the unmap occurs.
> 
> Fixes: ac0a3fc9c07d ("mm: add ability to take further action in vm_area_desc")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
