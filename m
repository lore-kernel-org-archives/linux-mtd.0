Received: from palrel11.hp.com ([156.153.255.246])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9vN4-00041B-Ge
	for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2003 00:48:02 +0100
Received: from hplns3.hpl.hp.com (hplns3.hpl.hp.com [15.0.48.4])
	by palrel11.hp.com (Postfix) with ESMTP id 4276A1C003D7
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Oct 2003 16:46:59 -0700 (PDT)
Received: from duckduck (dhcp-1U-19.hpl.hp.com [15.4.94.19])
	1.4+JAGae91741+JAGae92668)/8.12.9/HPL-PA Hub) with ESMTP id
	h9FNkwi21545	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Oct 2003 16:46:58 -0700 (PDT)
From: "Christopher Hoover" <ch@hpl.hp.com>
To: "'mtd list'" <linux-mtd@lists.infradead.org>
Date: Wed, 15 Oct 2003 16:46:53 -0700
Message-ID: <000901c39376$9cb111e0$d203b60f@duckduck>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: Regression of mtd/chips/jedec_probe.c in 2.6.0-test7
Reply-To: ch@hpl.hp.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Perhaps this is already known, but it may serve as useful news to some. 

The version of mtd/chips/jedec_probe.c in 2.6.0-test7 (revision 1.29
according to $Id$) has suffered a regression.  That version fails to detect
AMD AM29LV800BB flash in 16-bit x 1 configuration.  Replacing it with
revision 1.32 from CVS or downgrading to revision 1.6 from 2.5.70-rmk1,
holding everything else constant, solves the problem.

Also, all versions of mtd/chips/jedec_probe.c need:

#include <linux/init.h>

for 2.6.0-test7.  (I cannot ssh from my current network location, otherwise
I'd make this change to CVS.)

Cheers,
-ch
ch(at)murgatroid.com
ch(at)hpl.hp.com
