Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FED1099B4C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 22:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8wE5DP+AZYLqLDiEuRwRXIx2KIheWxDkEO6E5xFRmdw=; b=5DkDM+UwR/lUUE
	mzPN/AT9gfwXtyyY3b9Js0Kaz8BV2tR8/ucyguWsAJgsOETyLUDDp4BaQRTLEkM7abLeBZSZgys07
	xjfM3uYVp4J5ocX2Tp0vR6q8PrNKKJoNVWRzsSPI7FnTKG47UMspam428Vp+oLBzEmgxlyp9UHpR0
	lVyOu9F2dU5W1CpPn/FmSnN1dnuu3V7hF4e9AOa3Q4I3tNOdsGD0/h/YucT0RZFWkhLHMHX6gErYa
	HZVn8ThPF0/659zMz0pXCEnui5uUSI0PybxDg+D7a6prQea4uk2ImEUrujqCxH2256gZgaB0Ng8YQ
	Hz1/adlNs0eAmmZMVz1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iXE-0000000Dka9-2Xt0;
	Fri, 20 Mar 2026 22:41:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iWo-0000000DjpN-32bo;
	Fri, 20 Mar 2026 22:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rD27jWLWbEa98fvVKfoytjky1VbbHaio0DVEeKTRKHI=; b=ZQ89Fp9Kpt7uoY7bBaIJ6sG+ol
	hwoVWZBfoNnXJV+YLVMcJ2UwupvaJptFbYY1+Kj2f1Pod6WcDdYJI7UaIb0/xJl8CIf3oy5jg8Wqk
	k3AZ64+s8rvUeBH9U5ikMvuv+o7C/Bkqtr9Vc/YGfA8p6CIs/e/ZnBNqM/F7pYdX/o6iqDtWeHdgp
	cp4T39thIo/IHoKhVsNPHYQR6wTH9QyTjGQGFtr6cbTpEJ1wJIdVARoWLosqgOvYiHwYhYh0OgQ4P
	sgKJxi9CD9pV7zLVYe3S+6dTmJFwCG3+K/kPO/8+TVKrTTyaSgkcDpCPX9M4txqoqr5A6HHFiwqH2
	48i9ObcA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iWh-0000000GalH-1OAq;
	Fri, 20 Mar 2026 22:41:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37B8843A8B;
	Fri, 20 Mar 2026 22:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA36C4CEF7;
	Fri, 20 Mar 2026 22:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774046465;
	bh=8qR80FHVrw1W7dNRTWXARimuDYTsH7/Z1DNv6yL8KUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y5lVmyuBl/YHtF0SUASv3ZsIQ1natPUk22znSNUOoj9GyIsqTvNjDfuA4n6b+bsdY
	 0IktpYP0BWJT+oAlqd91mH+ucfqkC0/or3yrh+9mqekZCcnZ68PC+3+GOlR+kG/Gqk
	 qR3lrrIWipYfuWAhUod8000ikrQiwAYZOzekjarGe48HdLKV5DVaWMA5C5CGo49xdA
	 LZZnpmr2iLBxtmHqo8tPDQrQ9okPRHfMxpwhKc1UaJ49bwA70Zc8q8d7EItWlI2LcM
	 BcStZ6sq6rzSZ540KpAs0bxeFgzoEwLwBn4HNb9lYff6pOhtpLKVcI0Nxiz30+Upqb
	 ALlXbBOZOjIoA==
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Clemens Ladisch <clemens@ladisch.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bodo Stroesser <bostroesser@gmail.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: [PATCH v4 21/21] mm: on remap assert that input range within the proposed VMA
Date: Fri, 20 Mar 2026 22:39:47 +0000
Message-ID: <0fc1092f4b74f3f673a58e4e3942dc83f336dd85.1774045440.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774045440.git.ljs@kernel.org>
References: <cover.1774045440.git.ljs@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_224107_696605_75166DA5 
X-CRM114-Status: GOOD (  10.05  )
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

Now we have range_in_vma_desc(), update remap_pfn_range_prepare() to check
whether the input range in contained within the specified VMA, so we can
fail at prepare time if an invalid range is specified.

This covers the I/O remap mmap actions also which ultimately call into
this function, and other mmap action types either already span the full
VMA or check this already.

Reviewed-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 mm/memory.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 53ef8ef3d04a..68cc592ff0ba 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3142,6 +3142,9 @@ int remap_pfn_range_prepare(struct vm_area_desc *desc)
 	const bool is_cow = vma_desc_is_cow_mapping(desc);
 	int err;
 
+	if (!range_in_vma_desc(desc, start, end))
+		return -EFAULT;
+
 	err = get_remap_pgoff(is_cow, start, end, desc->start, desc->end, pfn,
 			      &desc->pgoff);
 	if (err)
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
