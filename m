Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K3aC1-0001WO-Aa
	for linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 17:21:06 +0000
Date: Tue, 3 Jun 2008 19:20:54 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [RFC/PATCH 2/3] NAND multiple plane feature
Message-ID: <20080603172054.GA1224@logfs.org>
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

An encouraging result.

> > Speaking about the disadvantages, if the dual plane feature is
> > enabled/disabled across reboots and erase size or write size changes,
> > we're in for a lot of fun from the filesystem size.  F.e. JFFS2 will
> > experience data loss when erase size isn't stable.
>
> What is the use-case for that? Who will need to manage low level feature
> across reboots. I can't remember/image anything similar for the case of
> cell phones. 

There is no sane usecase for it.  It can only cause problems.  So we
should be reasonably confident that noone will change it by accident.
At least not easily.

Jörn

-- 
Prosperity makes friends, adversity tries them.
-- Publilius Syrus
