Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE031099B2C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R0fGu+k2eYeDM/MDgW6KTIHRqt6lMRSrruFZLrBO0eA=; b=2n/E3JJ78W81Q+
	edvFsv6fhRYpRfDjR37vLljJ9gK6GM9QicH/MXkPb3vfGqqf5CA6RIvpdkTLqI6BFqGfkwTSJHhi1
	QkPnnzKEACIDskh7wLdn09Q3PdPDR0QOrJBoZqN+9dns7NTgCSVgvlVhm6HOWL8yHhfF4QNb5bRw8
	1uhZF8BQ6vMDMLaow6/1c4YpsV53Zw+B47sX3f0qvXCwiMdr5ph1fHBorK9/Ki0qkKGRfJkYep2Uo
	EIAXFnp3/q8/Cmcabt7uNYCG4/g+HmDNlg/KHRI+XYWlHFT7+lcFsK54hZ/LMg+RmWC17JsULg5jP
	C/6zN23PckTKJIKGqVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dg3-0000000DG8L-0sOh;
	Fri, 20 Mar 2026 17:30:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dfv-0000000DG6O-19yv;
	Fri, 20 Mar 2026 17:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E1F43418D8;
	Fri, 20 Mar 2026 17:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD94C4CEF7;
	Fri, 20 Mar 2026 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774027818;
	bh=cn49vooa6zI1bK7Ne2keDKeM7S0Q3DYN+gFeecdr7S8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k3SpwwTm3+LqCjrQj7miOUpofGNKZgHYqEQFraeDhPNVkXfECxvLW8Zobe+NTCg+G
	 i7xlPNhvtTYeO7xTUc3PKqRzid15IRNPdH4YUSohCwce42VZkVlfUBCOYco/sVD2et
	 vxE3mFh096D4OSX2GQRa+4bRuL3WZDLWUKtjGXNpv90+4RK+i5qV9A834ZJ9lkzev7
	 lahhfRWQ33ItmIvlrTAdoDUipL3iLC6ZC/fkTuxcE0ZVmjxz+jG3WsJOCgw84oKjof
	 B8nLkrNSu+NEYlk9zV6lwNjmYwBOeq57KIpkyhjcIZtOPDWfA1AJwLaP+3IsTjxXfR
	 z+df8M86zwjVg==
Message-ID: <ea8a46ab-3ae5-447b-96c1-37b58619edd3@kernel.org>
Date: Fri, 20 Mar 2026 18:30:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/16] mm: document vm_operations_struct->open the same
 as close()
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
 linux-mtd@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, Ryan Roberts <ryan.roberts@arm.com>
References: <cover.1773944114.git.ljs@kernel.org>
 <808919eaae0b682ec631301b3c06d85c62ba428d.1773944114.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <808919eaae0b682ec631301b3c06d85c62ba428d.1773944114.git.ljs@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_103020_925599_686915A7 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
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
> Describe when the operation is invoked and the context in which it is
> invoked, matching the description already added for vm_op->close().
> 
> While we're here, update all outdated references to an 'area' field for
> VMAs to the more consistent 'vma'.
> 
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
