Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F23C2BD09
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyXWH8LmP49TuXfF1VArC1T/S85kVjulNEYdydoUkb4=; b=kb5uIit5bF4taF
	ICkP5ZOEdBqwDRe70K7rdu7JRrzU9OGaowuajP4yeermxxR/NvPIG2p2bNw+3+WE1DBLzf6wWHE/l
	BBtwd9EErBHva5xXzvVHOnXKqnxnJ9aD6QMpEH8yJqA766IciS+wrPm8Mqx87WdMeD6FzXUGiaore
	5KmcxGr0R+/gKTDGT0d+EuNIlDOPjKympuvCEcCfhRjmqIU70uRGdQySefRu4SkuBZdOyHNgcgLHm
	JdqnvHgVfw5PWEuHmxc1bDE9603lQuCBUXrnsLpAk4FNdqHtVR2pWcd/5EWaMhLS0SXfTU5NoAZYo
	ldKHY5EUB5aDYspsTDLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNEfs-0000000ENkt-4AH4;
	Fri, 28 Jun 2024 16:42:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNEfq-0000000ENjl-0HFn
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jun 2024 16:42:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1E990CE4213;
	Fri, 28 Jun 2024 16:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57651C116B1;
	Fri, 28 Jun 2024 16:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719592927;
	bh=KowZk1jQy1Io4XMkPQkUk3h3DaEtKMWS+HxwXGTr01o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nEL1phH9XyJOO3v5dFvk1S+J59xlUQRD8neWizW6JlnwyBnug2Weefv24q6bhf95i
	 MhJi3bl2YjtM8xZk8U9WUvau7ojskQzgheACXDON+bH3NKQAn9wXIJPMCkj7/9bGDf
	 R4UbdFho4lINQQtH5ChOH8HsTK811XPOD+LD6FmH9tYWQGwsUnyAuAJZ1SHvD1/zxC
	 qCZ9dyykQhO/2OKHN0U1BCDGqGVpGlzwCawRLy9UAV91om/bWQO0aKBPH3k9JFpEjH
	 6BfpIoKU2FK6V3/TI+77El/aFCx9qvSMlxwjTWOO4nwtAudMQWkn8emj4920X/MgVI
	 Zi51CngzY6Q5A==
Date: Fri, 28 Jun 2024 09:42:06 -0700
From: Kees Cook <kees@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] printk: Add a short description string to kmsg_dump()
Message-ID: <202406280938.2D7BB97C@keescook>
References: <20240625123954.211184-1-jfalempe@redhat.com>
 <202406260906.533095B1@keescook>
 <06899fda-de75-4d44-bda5-dcbb3e35d037@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <06899fda-de75-4d44-bda5-dcbb3e35d037@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_094210_305399_D62E0949 
X-CRM114-Status: GOOD (  13.24  )
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

On Fri, Jun 28, 2024 at 09:13:11AM +0200, Jocelyn Falempe wrote:
> It is present in the kdump log, but before all the register dumps.
> So to retrieve it you need to parse the last 30~40 lines of logs, and search
> for a line starting with "Kernel panic - not syncing".
> https://elixir.bootlin.com/linux/v6.10-rc5/source/kernel/panic.c#L341
> But I think that's a bit messy, and I prefer having a kmsg_dump parameter.

Yeah, I totally agree: it should be easy to access the panic reason. I
just wanted to double-check that from pstore's perspective there wasn't
any "new" information here that should be captured somehow.

Thanks!

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
