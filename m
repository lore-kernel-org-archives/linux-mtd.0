Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Opz82-0000wR-5i
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 07:50:07 +0000
Received: by gyg8 with SMTP id 8so2326879gyg.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 00:50:05 -0700 (PDT)
Subject: Re: [PATCH -next] ubi: fix kconfig unmet dependency
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Randy Dunlap <randy.dunlap@oracle.com>
In-Reply-To: <20100812121059.e1d40380.randy.dunlap@oracle.com>
References: <20100812121059.e1d40380.randy.dunlap@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 10:49:57 +0300
Message-ID: <1283154597.12995.6.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	lkml <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-08-12 at 12:10 -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> warning: (OPTPROBES && KPROBES && HAVE_OPTPROBES && !PREEMPT && DEBUG_KERNEL || MTD_UBI_DEBUG && MTD && SYSFS && MTD_UBI || UBIFS_FS_DEBUG && MISC_FILESYSTEMS && UBIFS_FS || LOCKDEP && DEBUG_KERNEL && TRACE_IRQFLAGS_SUPPORT && STACKTRACE_SUPPORT && LOCKDEP_SUPPORT || LATENCYTOP && HAVE_LATENCYTOP_SUPPORT && DEBUG_KERNEL && STACKTRACE_SUPPORT && PROC_FS) selects KALLSYMS_ALL which has unmet direct dependencies (DEBUG_KERNEL && KALLSYMS)
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> Cc:	Artem Bityutskiy <dedekind1@gmail.com>
> Cc:	linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/ubi/Kconfig.debug |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Pushed to the ubi-2.6.git tree, thanks! I'll send it to 2.6.36 soon.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
