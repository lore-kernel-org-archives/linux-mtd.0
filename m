Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46234FEC11B
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2026 10:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKEm1ihlQklDI5E3Zx436EsgvYT5bHK6Ydfg+ZxT7r8=; b=F/h8N0I+TFIjfS
	ib28dmEVpWqgaOpHZuWkpgjtRXQGq5sypY0DRyQ/D+fehpywfCAMDPyloOxLDXafDPNo8U9vxklR/
	Dy3BVCOh/3Nbfp4xJelBs2S6YF9+XrHjlggx2dd0gxbFXBTVb7v5c7u18w7pHF6CrWiv0P0XZPd4h
	a1a3FwoPL8FWN9MOY6uMkvP7XWhT2Izf7dk7cgTK1RfoG/ZK21r30TmvDh5V/KY6oGqiyQM2B+EGw
	vYTjEhFbIzAVfz8OWHNCwSOB6KWXX+Nc5dYt6/vyDn+jgVzbXQ9dpn9HfP5jryD5V0fjaXeJk4TUA
	yPsgCaiS245weNMM4hjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LZp-00000003AHs-48A6;
	Wed, 25 Mar 2026 10:35:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LZo-00000003AHN-3dlv;
	Wed, 25 Mar 2026 10:35:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 48ADB600AC;
	Wed, 25 Mar 2026 10:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB41C4CEF7;
	Wed, 25 Mar 2026 10:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774434904;
	bh=+W7AYaAXVw1i2DYITazSh58FngLmUYCv1t3fq5pVTRU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XyqtwD0BVJpUUEeIxQNuop7kP0eDlwdduGR8d5uf2MwwJPd+cw307oTk9Phhs8x3l
	 Hh6rIELrW6PhJt0RPyJGSFPMzadyDZwsObuPFoqXKHX/qCFcrK66BtKCtHaH7HSpF+
	 0NGL1KxEeCeVDvLkU166GKoCMV5sPI0Hq9RLohb9yNUsRArIsKfhzMbamkj//nH3YJ
	 4ug/r3J4vaM4CSS0e7WBb9VfoiGQ7drIOGpXk5kZ8oqKTpFew/rcW80Y1ZfDDm0HKl
	 tIqVPpHAE7k98Loz1LnKsoU5+bfkVjx6lxzQNcGzna+siEzTrHVlZuoNwTrwpSF67C
	 HbfXsN+/yyUDQ==
Message-ID: <ec28f19e-072f-4f26-ad6b-feadf7a88dfc@kernel.org>
Date: Wed, 25 Mar 2026 11:34:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/21] staging: vme_user: replace deprecated mmap hook
 with mmap_prepare
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
 <08ecc1e1d319564fd49b9e9012f994edaff921db.1774045440.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <08ecc1e1d319564fd49b9e9012f994edaff921db.1774045440.git.ljs@kernel.org>
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
> The f_op->mmap interface is deprecated, so update driver to use its
> successor, mmap_prepare.
> 
> The driver previously used vm_iomap_memory(), so this change replaces it
> with its mmap_prepare equivalent, mmap_action_simple_ioremap().
> 
> Functions that wrap mmap() are also converted to wrap mmap_prepare()
> instead.
> 
> Also update the documentation accordingly.
> 
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
