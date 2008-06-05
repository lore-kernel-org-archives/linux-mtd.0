Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K4MiH-0003MN-T1
	for linux-mtd@lists.infradead.org; Thu, 05 Jun 2008 21:09:38 +0000
Date: Thu, 5 Jun 2008 23:09:29 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [RFC/PATCH 2/3] NAND multiple plane feature
Message-ID: <20080605210929.GB19234@logfs.org>
References: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
	<20080601174841.GH13094@logfs.org>
	<alpine.LFD.1.10.0806031754030.32134@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LFD.1.10.0806031754030.32134@pentafluge.infradead.org>
Cc: dwmw2@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org,
	vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 3 June 2008 17:57:35 +0100, Alexey Korolev wrote:
> 
> We did some performance testing for this feature: we did not find a test
> case where JFFS2 on NAND with dual-plane has lower performance than
> JFFS2 on NAND without dual-plane features. (note: subpage read feature
> was enabled for both cases)

Maybe I have a testcase for you.  The "evil workload".

1. Write a file until you get -ENOSPC.
2. Replace 1000 page-sized page-aligned blocks at random offsets.

The time for 2 should roughly double with bigger eraseblocks.

[ And yes, I originally got this testcase from you. ;) ]

Jörn

-- 
Time? What's that? Time is only worth what you do with it.
-- Theo de Raadt
