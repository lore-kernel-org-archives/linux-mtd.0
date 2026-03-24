Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45B9F54AC4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2026 14:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qnNT8Ie8Odx00BpUY0MFqj+BHsNcjdrQJafTF2uQsQo=; b=1fXwvjRf/+yvY5
	JRDttkto06+1xCoNmfXMDT3vzPC/JxMdJT9I/of8BrUGyveaPjov2wayHSM2txedTTnGEThjfoyGQ
	f96HLb5HOTqw/gRfiWF7pvLXWVQk5WHY3a1LvishFE+M/UEYkHg3JQ0HW4FiU+buzFVmcAuOiTQi6
	pQhtAmdKh03GQq9XUy7o9Wc9NlHoCpu7ucPRBK+2p4LwG2G3ulUa1eNaj2Q6x60+1DE1W1aVZKFLk
	LrdFN7eiws+3UcR8g27fUyuNoGJYQdm6U1egfTQQYnuO2dLKvbb7xmPdLj7ATX1kz2yKFyRDLSoIc
	xKaFpTwFfoXaK8GJQAjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52ta-00000001fML-2BlX;
	Tue, 24 Mar 2026 14:38:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52tY-00000001fLQ-1FQU;
	Tue, 24 Mar 2026 14:38:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5648760103;
	Tue, 24 Mar 2026 14:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6B0C19424;
	Tue, 24 Mar 2026 14:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774363091;
	bh=e5f6jgo0dBEyQUURQKSWrpDzBd0JxDsZ01SMVL8k3SU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qIMNEe8jc/gh4IeEeHB78CDBRX8uly5TJ7AQbfM/aTBCdNlUClXSmZ3DGj32XYiJq
	 w3bJ+ggFkIa6py50tYHZOmCtQhawWtrsj76/eDZGqNTS2E6DEDw7zok6+dGEPnugh1
	 rN0pTjYTfRuusdcmWnyo9rBjiDrJMXTlzi6iUnqi2UkrzVyRfQZmP9Akgci7mz3F+g
	 QuGR7o1Khy+ZyGWNS8jwo3oNlwx2iL889bycIRnXzH46HhBhKml65awhc9OfKZRYcU
	 c9A/SwhXZceArl/7YVlb4KEf7T2vzd4jdb/0Re/Fh6+vKY2naQlBbaFBfS5NTPAKfw
	 5GaQjW2N9rzXA==
Message-ID: <89b0e46e-693f-454e-ac74-6e396183c5c6@kernel.org>
Date: Tue, 24 Mar 2026 15:38:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/21] mm: have mmap_action_complete() handle the rmap
 lock and unmap
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
 <8d1ee8ebd3542d006a47e8382fb80cf5b57ecf10.1774045440.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <8d1ee8ebd3542d006a47e8382fb80cf5b57ecf10.1774045440.git.ljs@kernel.org>
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
> Rather than have the callers handle this both the rmap lock release and
> unmapping the VMA on error, handle it within the mmap_action_complete()
> logic where it makes sense to, being careful not to unlock twice.
> 
> This simplifies the logic and makes it harder to make mistake with this,
> while retaining correct behaviour with regard to avoiding deadlocks.
> 
> Also replace the call_action_complete() function with a direct invocation
> of mmap_action_complete() as the abstraction is no longer required.
> 
> Also update the VMA tests to reflect this change.
> 
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Nice simplification.

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
