Received: from ztxmail05.ztx.compaq.com ([161.114.1.209])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uYlE-00057X-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 May 2001 12:56:09 +0100
From: jg@pa.dec.com (Jim Gettys)
Date: Tue, 1 May 2001 04:55:29 -0700 (PDT)
Message-Id: <200105011155.f41BtTN448532@pachyderm.pa.dec.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Tim Riker <Tim@Rikers.org>, mtd <linux-mtd@lists.infradead.org>,
	jffs-dev <jffs-dev@axis.com>
In-Reply-To: <13672.988701676@redhat.com>
Subject: Re: Wear Leveling in JFFS2 NOT working!(?)
Mime-Version: 1.0
Content-Type: text/plain
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

If you have some way to remember how far you got the last time,
(approximately), then you could restart at the same place, rather
than at the beginning.

This has the same desired effect as starting randomly....

Of course, this may be just reducing the problem to the previously
unsolved problem, potentially...
                      - Jim
--
Jim Gettys
Technology and Corporate Development
Compaq Computer Corporation
jg@pa.dec.com
