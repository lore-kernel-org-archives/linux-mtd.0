Received: from mail1.danielind.com ([12.19.96.6])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15F1lg-0006va-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2001 23:57:12 +0100
Message-ID: <3B391571.9114E309@daniel.com>
Date: Tue, 26 Jun 2001 18:06:25 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: jffs-dev <jffs-dev@axis.com>, nico@cam.org,
 	MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: Problems with JFFS2/MTD upgrade to latest in CVS.
References: <3B390B4C.65A5DB68@daniel.com> <25950.993594415@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

>
> > What's going on?
>
> > jffs2_scan_empty(): Empty block at 0x00000000 ends at 0x00000000 (with 0x00031985)! Marking dirty
>
> Does reverting to an older version of scan.c fix this?
>
>         cvs up -r 1.46 scan.c
>

Yes!

Vipin
