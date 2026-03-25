Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C681FEA83D
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2026 09:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kgDTTAYzL326KfxD21JMIhaPMfBLPr81GWGzzKqYcjY=; b=EhYwvDNyLirD5l
	DCB8eQpZnIIM+9bHC4/rfMjMWwB/W8HHhEsPdTLMnPyuVbW/NKjCMIsg/SvH5OBlrW3vbsyHH5CmE
	kHLK+KPQcP5Np7QCE/5jCK/EksGUMYIW7z1wUoLvZ2gR7O8gfQBhoQnY6Y4twhVmBI7eteUF4/+dd
	JabMbtCutSpAwpvKzzsr93FM6h8FDbbx/TjJ3z9lwPXykZqObsbZi93lEon8a5jhJRVaFIQ3F0d4p
	Jwjwhm3tuficg2ol/d4plPSd64KB8vSLMS4dz1F14fpsoPVJoPUEa2OiL7Z7kegJ+RxNL9dZSPdoO
	BurX9nD/xXoS8U7kDH3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5L0a-000000035ow-36QE;
	Wed, 25 Mar 2026 09:58:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5L0Y-000000035oD-1RM5;
	Wed, 25 Mar 2026 09:58:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EBC5943C1A;
	Wed, 25 Mar 2026 09:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEFACC4CEF7;
	Wed, 25 Mar 2026 09:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774432717;
	bh=HuY/gXey+uWVLYsCI6CkmOeVgc5q6DFm7SVnZaIS/YM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u+uY8j9DdWnf6aJO3ZHhf6pj8o6upnz4tgfFLuwATHjhN6SatZRmXJbkO3JFsl45s
	 ADbQAVoZ2bfxIeImDpnwFdFCo0b8tn6HNyoZW5/j1NFRa+uXe019/Hzk1B5PNJSpge
	 oitV6NhzQsBWdl1ZGdGjjAleBOpYArsdSSBmuxkg0gbhRkp5b/B8T8vJcIMEA4HjHA
	 nsppJG3k+pdtmXbLxSqIZuQQW9qLID/Ou1ZIPnKK9/Xrsxbabxym2XTk8bjNKNnh79
	 gW+HYIQy6QtFwqaoSQC+HIe2caOI1oDm6sqQ/VOpZmE6eK1dpqAouDkD3M6o3nEwh3
	 regiPf+e17GQA==
Message-ID: <9b205b06-e938-4f30-a16d-7d90f8c49818@kernel.org>
Date: Wed, 25 Mar 2026 10:58:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/21] mm: add mmap_action_simple_ioremap()
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
 <a08ef1c4542202684da63bb37f459d5dbbeddd91.1774045440.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <a08ef1c4542202684da63bb37f459d5dbbeddd91.1774045440.git.ljs@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_025838_430190_91521033 
X-CRM114-Status: GOOD (  12.46  )
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
> Currently drivers use vm_iomap_memory() as a simple helper function for
> I/O remapping memory over a range starting at a specified physical address
> over a specified length.
> 
> In order to utilise this from mmap_prepare, separate out the core logic
> into __simple_ioremap_prep(), update vm_iomap_memory() to use it, and add
> simple_ioremap_prepare() to do the same with a VMA descriptor object.
> 
> We also add MMAP_SIMPLE_IO_REMAP and relevant fields to the struct
> mmap_action type to permit this operation also.
> 
> We use mmap_action_ioremap() to set up the actual I/O remap operation once
> we have checked and figured out the parameters, which makes
> simple_ioremap_prepare() easy to implement.
> 
> We then add mmap_action_simple_ioremap() to allow drivers to make use of
> this mode.
> 
> We update the mmap_prepare documentation to describe this mode.  Finally,
> we update the VMA tests to reflect this change.
> 
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
