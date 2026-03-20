Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA72F1099B23
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOVs9Q0SU9KRWLFnZHwAskdMkdC9zpMEZZkBZaHOnus=; b=FLMxUwmajDHWSy
	0cw1NVDiJ+83eY+VEobotk0Tk88VKGsKXhmZZ7ChqfdgLlprHhaFUd95j8I4+Vcig2+AwUNdZ15LD
	q5AZIEUpnPtWgMXO6KxqhyJ6w4QEtIfC8EcBZV+i24b6FyC7WM1gA2LbYplE5MQlelSZEagXbG4WT
	igW4cx0pC6KLX6uH0y87rhhEF9C8BwQDQwp7Cgfe0c+/LxX+iCfy0DEwgxzHq+G4TsDdja97r5o4h
	O3yEumXO0ZOOCzziggEx6sfKAGe2eD1IEUOGGMNMj2vYBcQwcDoxRKpj9DUsw1AIO4aGdY8KAmW1d
	v+fFfyhhaNEqYG4v1Qlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dMm-0000000DDLU-1MXw;
	Fri, 20 Mar 2026 17:10:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dMf-0000000DDKw-1unw;
	Fri, 20 Mar 2026 17:10:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B220843249;
	Fri, 20 Mar 2026 17:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920B9C19425;
	Fri, 20 Mar 2026 17:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774026624;
	bh=r+p0YZoMVI7AcM9fsFhpiDTl7RR8STO6srhIbYMdrEs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bXKnbe/ZTMZYKmKswyp7UUNW73CC8ocNdqBGJpBjO2IEcg9klGYzKBTbn7wS6145o
	 bDx6yp6E9EoRlfZ1nChN/6xzDyc02EPnVKbzAT5MkJBM1x9r0U7ISiFB9ZK42TeeEV
	 NPQS0N+PInTeLONogYKmUybb5i5U5KXxX1g3XFI6v4Zk+gmrInpHhro/V78ZwgDZBl
	 PDIKv//vs1fkzlQQJXNTgc0NCf5mfA5lg8S5iRTjU72SybGYa8zUxK1T+5C/DsgByO
	 n+gWOBmyWdE+bwHdB8VdEbJ4rsjPU2AaNHeRHUcpRTiT8ZcyJgwkIBZUDTaCXbxgBy
	 oLeo5Gj5w1IGw==
Message-ID: <e3ecf76a-4490-415d-9d52-dae478ad43d7@kernel.org>
Date: Fri, 20 Mar 2026 18:10:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] mm: various small mmap_prepare cleanups
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
References: <cover.1773944114.git.ljs@kernel.org>
 <498a579bfbcbb8b0e4a9c39243b4454347f03a46.1773944114.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <498a579bfbcbb8b0e4a9c39243b4454347f03a46.1773944114.git.ljs@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_101027_220166_B1546673 
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

On 3/19/26 19:23, Lorenzo Stoakes (Oracle) wrote:
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
