Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oxc1x-00021m-E9
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2010 08:47:22 +0000
Received: by bwz19 with SMTP id 19so5952408bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Sep 2010 01:47:20 -0700 (PDT)
Subject: Re: [PATCH] usibfs: fix kconfig dependency warning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Randy Dunlap <randy.dunlap@oracle.com>
In-Reply-To: <20100918125340.7a2cbb8b.randy.dunlap@oracle.com>
References: <20100918125340.7a2cbb8b.randy.dunlap@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 20 Sep 2010 11:45:28 +0300
Message-ID: <1284972328.2286.49.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-09-18 at 12:53 -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix another kconfig dependency warning, this time in ubifs.
> 
> warning: (MTD_UBI_DEBUG && MTD && SYSFS && MTD_UBI && KALLSYMS && DEBUG_KERNEL || UBIFS_FS_DEBUG && MISC_FILESYSTEMS && UBIFS_FS || LOCKDEP && DEBUG_KERNEL && TRACE_IRQFLAGS_SUPPORT && STACKTRACE_SUPPORT && LOCKDEP_SUPPORT || LATENCYTOP && HAVE_LATENCYTOP_SUPPORT && DEBUG_KERNEL && STACKTRACE_SUPPORT && PROC_FS) selects KALLSYMS_ALL which has unmet direct dependencies (DEBUG_KERNEL && KALLSYMS)

Pushed to the ubifs-2.6.git tree. This won't go to 2.6.36, though, I
think - not too important. But I have anything really important, I'll
merge this one as well, although for now I do not have such plans.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
