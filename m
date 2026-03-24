Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E65CE9A761
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2026 10:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=St8MnT9AwrNcJLqh1NodhI9KWOWXD0+OoTOlkuZM48A=; b=1khjufUJwxaRu+
	jat/GCc/NnbRwqh7BYgKkRWRY9JkRZE3b+nCn1+7A5EEV8JilZ/iMOngYp03AA2lzU7/FIkMQqdqn
	cA9/VtDDG8e4YQbmyNCa+b2GSrt9+OpFVeeWkCPrqo05mZFbF6Eaoy0fVNvbKOr4poI0hm6Z+V7ap
	2N52KYvL70RYbmFwqWpWW+eA5/iirm7lk++NMYqf2TKnPANAYL2TR1hd3m99YaGXKvNU1TLfG0+LE
	wkGAU9l2r7Zxf3y/i+Eyp6QsW9ivdfunXoUgUtaoYMWFUhpwfIiNj10/8K95tPR/83vA0F+hcI/sF
	xmGcWCievqscwxZXbhUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zHR-00000001EGN-45sp;
	Tue, 24 Mar 2026 10:46:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zHO-00000001EG7-0TvB;
	Tue, 24 Mar 2026 10:46:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 31A02600C4;
	Tue, 24 Mar 2026 10:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E725AC19424;
	Tue, 24 Mar 2026 10:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774349192;
	bh=WMEerWakA31QDIRRh1QiXx8aw7EYn+862Ive463FIxg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sRYV/SsWeoCU4rAac48A/OHspAXPDQk8BSViRS/suRAnoU18SJsr6hr0c+5iuVxG9
	 eXHcAhdTBXsvusq4VOTea51g9RrRMxvmD/TWcRcqz4BrYpF0gGRYZANGEgFkzTzMEE
	 eB2MIMTCAoTBk/UKXYpTur9vulG+EP40W619rAh3viXt3Y1UnqorcKkeyeACDr8zZR
	 IzXjhAKe95RbXpf6iBaCEmpIYeqVFXbcBgKvmEoaxlN+h3r+B4gL0YMNRWgZLYJ3yu
	 6KTAOXFNdOqESMXeyxke3FeW9AoW1DTJYifGbrjLStiXcREPMM8ZoQvCqx+u5OeJEK
	 WIgEyQ51/Ee/w==
Message-ID: <899470f6-8b22-42a3-9dca-1a11e246147d@kernel.org>
Date: Tue, 24 Mar 2026 11:46:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/21] mm: various small mmap_prepare cleanups
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
 <99f408e4694f44ab12bdc55fe0bd9685d3bd1117.1774045440.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <99f408e4694f44ab12bdc55fe0bd9685d3bd1117.1774045440.git.ljs@kernel.org>
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
> Rather than passing arbitrary fields, pass a vm_area_desc pointer to mmap
> prepare functions to mmap prepare, and an action and vma pointer to mmap
> complete in order to put all the action-specific logic in the function
> actually doing the work.
> 
> Additionally, allow mmap prepare functions to return an error so we can
> error out as soon as possible if there is something logically incorrect in
> the input.
> 
> Update remap_pfn_range_prepare() to properly check the input range for the
> CoW case.
> 
> Also remove io_remap_pfn_range_complete(), as we can simply set up the
> fields correctly in io_remap_pfn_range_prepare() and use
> remap_pfn_range_complete() for this.
> 
> While we're here, make remap_pfn_range_prepare_vma() a little neater, and
> pass mmap_action directly to call_action_complete().
> 
> Then, update compat_vma_mmap() to perform its logic directly, as
> __compat_vma_map() is not used by anything so we don't need to export it.
> 
> Also update compat_vma_mmap() to use vfs_mmap_prepare() rather than
> calling the mmap_prepare op directly.
> 
> Finally, update the VMA userland tests to reflect the changes.
> 
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
