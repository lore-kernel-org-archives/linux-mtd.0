Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BhtNr-0000oa-GU
	for linux-mtd@lists.infradead.org; Tue, 06 Jul 2004 13:05:31 -0400
Received: from [217.111.56.18] (helo=spring.sncag.com)
	by pentafluge.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BhjqC-0007Uo-1J
	for linux-mtd@lists.infradead.org; Tue, 06 Jul 2004 07:54:08 +0100
Received: from farside.sncag.com (localhost [127.0.0.1])
	by spring.sncag.com (8.12.11/8.12.11/Debian-5) with ESMTP id
	i666rrHC025879
	for <linux-mtd@lists.infradead.org>; Tue, 6 Jul 2004 08:53:58 +0200
Received: from farside.sncag.com (farside [127.0.0.1])
	by farside.sncag.com (8.12.11/8.12.11/Debian-5) with ESMTP id
	i666rqjR010441
	for <linux-mtd@lists.infradead.org>; Tue, 6 Jul 2004 14:53:52 +0800
To: linux-mtd@lists.infradead.org
From: Rainer Weikusat <rainer.weikusat@sncag.com>
Date: Tue, 06 Jul 2004 14:53:51 +0800
Message-ID: <87fz85eidc.fsf@farside.sncag.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: cmdlineparts.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

I have rewritten cmdlineparts.c to no longer cause aligment traps on
ARM, to enable freeing of now-unsed cmdline_mtd_parition structs after
the real partitioning info has been passed to an upper layer and to
get rid of the recursion (using kmalloc instead has the [theoretical]
advantage that OOM problems can be dealt with gracefully instead of
causing stack overflows with possibly drastic consequences). Is there
any interest in this? [Mainly, I intend to use this for a project I am
currently working on].
