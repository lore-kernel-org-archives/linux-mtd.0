Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17a2WE-00083o-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 00:04:38 +0100
Message-ID: <FA06AA2C99BCD511951200005A99441001E3ECD8@irvexch1.sextantifs.com>
From: "Curtis, Allen" <Allen.Curtis@Thales-IFS.com>
To: 'David Woodhouse' <dwmw2@infradead.org>, "Curtis, Allen" <Allen.Curtis@Thales-IFS.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Wed, 31 Jul 2002 16:02:50 -0700
Subject: RE: jffs2_scan_eraseblock() - errors
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> >  INOCACHE_HASHSIZE was set to 1. Changed this to 128 and....
> > real	47.258s sys	47.25s
> 
> It's the first (and easy) part of the proof-of-concept which involves 
> moving said CRC32 check to later so the mount doesn't have to 
> wait for it.

With the CRC patch:
real	36.7s

PS: The version of scan.c we are using is 1.57. The patch note was for
1.51.2.3.
