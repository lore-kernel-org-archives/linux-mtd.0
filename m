Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Ns21-0003TG-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 09:59:25 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <43CB1396676FD4119F03001083FD299401A1C8D5@neptune.kirkland.local> 
References: <43CB1396676FD4119F03001083FD299401A1C8D5@neptune.kirkland.local> 
To: Paul Nash <paulnash@wildseed.com>
Cc: Wolfgang Denk <wd@denx.de>,
    "Linux-MTD (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Intel sez: Synchronous Flash and XIP is the future -- thought s? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 16 Dec 2002 10:30:04 +0000
Message-ID: <2859.1040034604@passion.cambridge.redhat.com>
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

paulnash@wildseed.com said:
> Actually, Intel's L18/L30 series of "wireless flash" has that feature,
> Read-while-erase-or-write as long as the reads are not to the 8MBit
> partition being dealt with in an erase or write.

1MiB is slightly saner but still not wonderful. At least I suppose it would 
allow you to have your kernel in the first MiB and hence not affected by 
changes to the file system. Doing it at an erase-block granularity would be 
better.

--
dwmw2
