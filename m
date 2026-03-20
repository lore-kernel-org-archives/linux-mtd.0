Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3F31099B2C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 17:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZi7F976OWio4SEnDTghCC7kM6xgGQKEZdLnWwvp9FM=; b=q5kS+/adYdKOOq
	7dceGbrm+Ymky/tP3X/Pjd4gUw7FnnaMTH4CO5d8uuopCdgP2C6koNyl0zwMQCm2gFyCiw/KvLs4m
	Qt2wjfof/SUTm0Eud2M7iyRXDxlLVZwurJVlRPtDflcNGTKVWmCg9Slug3ScMqm60WOOBkxIiHOj9
	cmjKLdUosXmT5+UuL9Ej3Hq0UikBQqgLtJWHYxkvp00m8SjhX3X0ghPh3Cr3atO5EWhryTLv+53b8
	sv096bfZdsMZIatTY30Fb8CtfwyzmjyjmZCPcOs6yra+HE0kW/5iCCCRaltVUX4b6UrA7h7K3+W4V
	PNQXznSBDy7LJ9M0DCZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dZr-0000000DEno-346t;
	Fri, 20 Mar 2026 17:24:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dZp-0000000DEml-0ZuL;
	Fri, 20 Mar 2026 17:24:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CDAE43F9B;
	Fri, 20 Mar 2026 17:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952EDC4CEF7;
	Fri, 20 Mar 2026 17:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774027439;
	bh=lkMH+Fs61pHyUrN0N7PA7Smmgeamo1Ed8V7OOsLNBN8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ATswcWl7MXWHHj389gFxOlECgcgQeJYv1wKqdExtZHqinVM8C1iUlLVry9OwlEG+s
	 hQm57r7Pk+ZpJ3t0nw1/vvLOsQgKwispPEvcju2E9P/9JEP3v3yKvGkvycL7b0J2eK
	 ezcqS/hxxM9fVO52XT/cmWkPIx24fW0C1LS9PL8IDJR6j8X/JoZ8s36B+4wxYvx/7M
	 P98bC7b6fLvX4lzSxnJYRzQmThW9ckw1V9os4pxuNV73Z4BucD39QRODtyzANsRpNK
	 4W1hTmWPTL9W0bOriXcoFpQK+v+c1Mbp60aVI67dnQEaAkyxZ6w2Qp0mXlzveN3nC0
	 CSmw5tCHpFg1g==
Message-ID: <b917813f-78fb-4c31-913c-5e343c52cab7@kernel.org>
Date: Fri, 20 Mar 2026 18:23:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/16] mm: add documentation for the mmap_prepare file
 operation callback
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
 <172ef809d9976b067bba4cd9d2b78410c6c6d03d.1773944114.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <172ef809d9976b067bba4cd9d2b78410c6c6d03d.1773944114.git.ljs@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_102401_317961_371AAFC5 
X-CRM114-Status: GOOD (  10.96  )
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
> This documentation makes it easier for a driver/file system implementer to
> correctly use this callback.
> 
> It covers the fundamentals, whilst intentionally leaving the less lovely
> possible actions one might take undocumented (for instance - the
> success_hook, error_hook fields in mmap_action).
> 
> The document also covers the new VMA flags implementation which is the
> only one which will work correctly with mmap_prepare.
> 
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
