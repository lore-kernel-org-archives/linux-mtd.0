Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15F1IM-0006tY-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2001 23:26:54 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B390B4C.65A5DB68@daniel.com> 
References: <3B390B4C.65A5DB68@daniel.com> 
To: Vipin Malik <vipin.malik@daniel.com>
Cc: jffs-dev <jffs-dev@axis.com>, nico@cam.org,
    MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: Problems with JFFS2/MTD upgrade to latest in CVS. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 26 Jun 2001 23:26:55 +0100
Message-ID: <25950.993594415@redhat.com>
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


vipin.malik@daniel.com said:
> Hmm, I upgraded from an <older> version (before the dir change)of
> JFFS2 & MTD (that I've been testing) to the latest one in CVS and to
> the 2.4.5 kernel.

> When I mounted my JFFS2 flash partition again, I got the following on
> the console. Now the system periodically does not respond for multiple
> "seconds" to CR's on the bash prompt.

> What's going on?

> jffs2_scan_empty(): Empty block at 0x00000000 ends at 0x00000000 (with 0x00031985)! Marking dirty

Does reverting to an older version of scan.c fix this?

	cvs up -r 1.46 scan.c 


--
dwmw2
