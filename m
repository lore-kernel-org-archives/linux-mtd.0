Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cNhc-0000pP-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 11:06:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002101c23df1$f8caad00$5501a8c0@synso.com.tw> 
References: <002101c23df1$f8caad00$5501a8c0@synso.com.tw> 
To: "Steve Tsai" <startec@ms11.hinet.net>
Cc: "'Thomas Gleixner'" <tglx@linutronix.de>,
    "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: Re: NAND Configuration 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 07 Aug 2002 11:05:30 +0100
Message-ID: <32129.1028714730@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

startec@ms11.hinet.net said:
> JFFS2 on NOR type flash does not use buffering, OOB check and bad
> block management, but it can be used now. I meant that
> CONFIG_JFFS2_FS_NAND is not defined, maybe the driver still can work,
> but it is not good as the original one.

JFFS2 cannot work on NAND flash without the extra code enabled by 
CONFIG_JFFS2_FS_NAND. You need to batch writes into page-sized chunks and 
use ECC. It looks like you have enabled CONFIG_JFFS2_FS_NAND in the log you 
show -- is that correct?

--
dwmw2
