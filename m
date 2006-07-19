Received: from h-67-102-66-132.snfccasy.covad.net ([67.102.66.132]
	helo=hheld.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G3HBR-0001LI-K4
	for linux-mtd@lists.infradead.org; Wed, 19 Jul 2006 14:54:14 -0400
Received: from [206.15.76.194] (HELO RudiDell)
	by hheld.com (CommuniGate Pro SMTP 4.3.7)
	with ESMTPS id 831792 for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2006 11:54:05 -0700
From: "David Byron" <dbyron@hheld.com>
To: <linux-mtd@lists.infradead.org>
Subject: autoconf for mtd-utils
Date: Wed, 19 Jul 2006 11:52:48 -0700
Message-ID: <000001c6ab64$87a7fad0$a134800a@RudiDell>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Reply-To: dbyron@hheld.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In my environment, it would help to have separate build and source
directories for mtd-utils.  I need a native build for mkfs.jffs2 and a
cross-compiled build for flash_eraseall, etc.  A few weeks ago it looks like
Josh Boyer removed an attempt at a Makefile.am.

Is there a general aversion to automake?  If I submit a Makefile.in /
configure.ac that uses autoconf but not automake, does it have a chance of
getting accepted?

I'm happy to create a Makefile.am and configure.ac for automake if that's
got a better shot.

Thanks.

-DB
