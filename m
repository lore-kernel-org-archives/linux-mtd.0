Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AC0106B538
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2026 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lqu6BgY4xGXUekm+xGuJ8Ba4eUtXCrlGWwKpBuX6v34=; b=kzyKngDo9fmUx5
	39GBzomq7kV7173gPuP06QKbUGM2G14ose3EGk9n9rgFUjki1yB5NYFhduz70HKffQO4S9jbg8e2V
	QSxWOEYhDQQe8tcyDNHV6nNtSeinc5cfECe90ZPiUhyph1sj9LszmMBVfgqDLthv5Ve8RA+qtT28j
	7Ozl2Iz9AawF2JuBuBN8WRmIR20q8vLE63QL97bNOq5ZN1VylzMfX+0qWVb9JBM5j+34XOquG/wh7
	MUZqml1VS1UbL/QFShUsy26fiqEotJGupEz9NtRCTORuWSGHokWzNCuokL8Xkr7ex//sBkl9Q9dDz
	pCh4ZBjS9vnRpNvWbKJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OkN-00000003VaA-1Rdi;
	Wed, 25 Mar 2026 13:58:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OkK-00000003VZU-3Xo1;
	Wed, 25 Mar 2026 13:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF39C600C4;
	Wed, 25 Mar 2026 13:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A8AC4CEF7;
	Wed, 25 Mar 2026 13:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774447087;
	bh=KyjiwAokSYk7ozvT6M+V8CAJzdrqAh71WLKooyLlGIw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a/Isf1Nn7bbzilJ+WFOdPoPwPnR5v6LhxMrlFuBsyYg2XAwIEm2QemKRxXZjHN5Nu
	 AChgjyjIk7vb33QJ6oLak9yHuJmn9pok4FzY118/Z+xhCYL9ZvqY/49+WryhvTm+9I
	 H/uz07412nF3UDASUIjgPac3fueYVdb60S7vSKmq1WNoCwue6s87ja2S3Tsh5l+e3f
	 64SHJjpAkfwmhNBTPQZWk39ka/fPMUqC0l5Alm8rDrmCIyjXRQby1EnxD/KFHZR4nK
	 FM9Uffh/ooy89oUPe3IV97KvalyzhwV1CHWkx0R4J2p9nJcR4wxJQ24/KPk84FZbM0
	 vIlUGx35sv7Jg==
Message-ID: <b1b682fb-9d79-4388-8499-4623d0785ec0@kernel.org>
Date: Wed, 25 Mar 2026 14:57:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/21] drivers: hv: vmbus: replace deprecated mmap hook
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
 <05467cb62267d750e5c770147517d4df0246cda6.1774045440.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <05467cb62267d750e5c770147517d4df0246cda6.1774045440.git.ljs@kernel.org>
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
> The f_op->mmap interface is deprecated, so update the vmbus driver to use
> its successor, mmap_prepare.
> 
> This updates all callbacks which referenced the function pointer
> hv_mmap_ring_buffer to instead reference hv_mmap_prepare_ring_buffer,
> utilising the newly introduced compat_set_desc_from_vma() and
> __compat_vma_mmap() to be able to implement this change.
> 
> The UIO HV generic driver is the only user of hv_create_ring_sysfs(),
> which is the only function which references
> vmbus_channel->mmap_prepare_ring_buffer which, in turn, is the only
> external interface to hv_mmap_prepare_ring_buffer.
> 
> This patch therefore updates this caller to use mmap_prepare instead,
> which also previously used vm_iomap_memory(), so this change replaces it
> with its mmap_prepare equivalent, mmap_action_simple_ioremap().
> 
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
