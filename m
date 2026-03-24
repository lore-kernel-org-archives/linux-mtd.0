Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68525F54AC6
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2026 14:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z3TB2ro45RSfAY7GzoWW960+zy63TXnE1xjKCNjPCXE=; b=hUPoYiGS+SLMfR
	dJF44jEMPy4B9AZvS6Y39yNwVTZWWYoAjZUV1IGJk1OJRToHCXKK33xy8Yd8OfwwiOhGno30dOU/3
	kDQwvPXnyA2gbPmoWXy3SKtUzBnZt+GInikFdCitbQW+TckJr+yLQc0gAnHkY6jEHvJjO27LCEc8R
	p5gIjPWJ06G39OrScZd8JPS2DXB5+7Az3InBVnFEFUhTRZWQ+vBMI1s5qM1sG1XXm3CjzZKr+VxN1
	UEpJYBvXjFJi8leQsD3tpidH+GLtQs+2s3ojReu+kAYHj8URpDdmdKbOyKu6Zch92w3+j3Lgben2d
	M421UHsiYEbLu6/b3y0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52n3-00000001eRP-1mXH;
	Tue, 24 Mar 2026 14:31:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52n1-00000001eR9-2PgJ;
	Tue, 24 Mar 2026 14:31:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A1F53600AC;
	Tue, 24 Mar 2026 14:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61DCDC19424;
	Tue, 24 Mar 2026 14:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774362686;
	bh=0oYopjVJ5FfZx7yBJY5biK1wFueGF1ISoTXTBTdvEco=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j/iVyRqoAgsG15GdgKyoiArd2eFqRcIl7DXzGaGTtG2Y0o7o+tjV70May3h7h7RLT
	 V7S2RptNUFiSvB3YL9Arvd1/5pUSBJrsV385XLYdp8ncPFclpr5NciQAWxqxmbnEiV
	 oGusSnopYimqq5x+nEGLkPHfJfSrph+4t9ZTsmakMF24m+DuJZinF+HwwBv0F6oXfj
	 8Ajb3LcvpJ0geiSO23cTGq4R54D5xwU781bHvtDBiy0/W+L+jGnt1gku6YsbTLI6qO
	 tBqw5ZSz29d6y6/PZPYtjCgDpggJ+d1BrWbTeduVQTASS9C9lGiBuYSSdwtQJAyER5
	 Iy/3msdCCKs7A==
Message-ID: <82dc0ffb-a0e2-4358-b182-94af71ceb697@kernel.org>
Date: Tue, 24 Mar 2026 15:31:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/21] mm/vma: remove superfluous
 map->hold_file_rmap_lock
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
 <42c3fbb701e361a17193ecda0d2dabcc326288a5.1774045440.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <42c3fbb701e361a17193ecda0d2dabcc326288a5.1774045440.git.ljs@kernel.org>
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
> We don't need to reference this field, it's confusing as it duplicates
> mmap_action->hide_from_rmap_until_complete, so thread the mmap_action
> through to __mmap_new_vma() instead and use the same field consistently.
> 
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
