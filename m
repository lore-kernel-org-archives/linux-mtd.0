Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C760DF53D9B
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 21:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/inUxFiHWr55ib/6y9rzAGx06D6fomsb3J2G60294No=; b=pSWgUAi9r/fvIi
	x7+Ct11/jINxY5jtEQ2KIOv8AIY5sCHnZ8BVD2YwXrjA94zKSo9LqHdm1JCaRvknk/vH7L45A/dbr
	KgAXKG3HLQ0QNb0tZ9vbN9UzhatmOIoXMeloN2+9IZa9PnCcx0PnTcOhGZ6JUXbLkNeSxJf0AUE6d
	H4IDDUtJZNlCmBiDTMugU0CkiYceupsGQD8iCVRX2przic1s5sIBGcB9SM7IAft5FDNKWMfF9nHWT
	DmMD3CADVQJk6sOOJNnlOIn1Qh+DGOKkPjN6HExLOmaAmvzy7Pw63MNgpX+cZt36LAgnKx6Zc2L4H
	+S1bHdVJZSkkwcT90XXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FH5-00000004tqX-2HIo;
	Mon, 16 Mar 2026 21:14:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FGZ-00000004t6T-2yCt;
	Mon, 16 Mar 2026 21:14:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B80E16132F;
	Mon, 16 Mar 2026 21:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9A6C2BCB1;
	Mon, 16 Mar 2026 21:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773695662;
	bh=dElPd1/2yYuQnbmBxFem9K254mqoyGxI5ua35pg5dJU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WSQBK1iLku67+ML1WmdG5gvZLWS7LBzAh+jY1gRa2yWEDslVldYCYBTPugdDPtK3i
	 CJUPJvXQZ/W8O2eLGawpJj4z7/Gc/0AG/4/vE6vYrREysTXhDw+AehDa8KdJrBOSlC
	 XhH22ZMH6c73yrZxTi5u16TG0R08vkR0Hg/N25ka99GCvGxJVINDVuFd31W7b8egcK
	 vue6N3UbG8dGv7WpxgZ343wv1BtFDUqGFbAbGk7WlXYTrbd+eiSrkAi0pp+So15ggU
	 sTJ2YQNiWnWZSMjPaxJ+T1mbsuo+/9JntOuw+gRsL+gTD6u/BCWW3CJwONZsgLHGWx
	 bcXTswhvf3Pkw==
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
Subject: [PATCH v2 16/16] mm: on remap assert that input range within the proposed VMA
Date: Mon, 16 Mar 2026 21:12:12 +0000
Message-ID: <4e152e7b8e1a93baf0777628eef9409d031cf8f6.1773695307.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773695307.git.ljs@kernel.org>
References: <cover.1773695307.git.ljs@kernel.org>
MIME-Version: 1.0
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

This covers the I/O remap mmap actions also which ultimately call into this
function, and other mmap action types either already span the full VMA or
check this already.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 mm/memory.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 849d5d9eeb83..de0dd17759e2 100644
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
