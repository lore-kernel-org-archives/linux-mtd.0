Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18BeeE-0003UW-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2002 17:16:22 +0000
Received: from mvista.com (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id JAA18348
	for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2002 09:46:35 -0800
Message-ID: <3DD13E84.5B38836C@mvista.com>
Date: Tue, 12 Nov 2002 09:46:44 -0800
From: Scott Anderson <scott_anderson@mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: cmdline.c file name collision
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

Hi all,

I recently noticed that when CONFIG_MODVERSIONS is turned on, both
drivers/mtd/cmdline.c and lib/cmdline.c are trying to store their
symbol versions in include/linux/modules/cmdline.ver in a 2.4 kernel
tree.  Only one of them "wins" leaving the versioned symbols of the
other undefined.  It seems to me that drivers/mtd/cmdline.c should
probably be renamed to avoid the conflict.  Thoughts?

    Scott Anderson
    scott_anderson@mvista.com   MontaVista Software Inc.
    (408)328-9214               1237 East Arques Ave.
    http://www.mvista.com       Sunnyvale, CA  94085
