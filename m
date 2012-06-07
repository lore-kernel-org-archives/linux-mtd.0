Received: from blu0-omc1-s1.blu0.hotmail.com ([65.55.116.12])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScgpQ-0007L2-JR
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 17:49:01 +0000
Message-ID: <BLU0-SMTP83EDBF09CC49005CCB798AB8F30@phx.gbl>
From: Bill Pringlemeir <bpringle@sympatico.ca>
To: linux-mtd@lists.infradead.org
Subject: Latest UBI/UBIFS requires DebugFs?
Date: Thu, 7 Jun 2012 13:49:02 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I have pulled the latest UBI/UBIFS from
git://git.infradead.org/users/dedekind/ubifs-v2.6.36.git.  I think that
the same issue may exist on the head.

If your root device is ubifs and you do not configure with
CONFIG_DEBUG_FS, then several functions will fail and the root will not
be mounted.  Depending on other configurations, you might not get any
error messages.

It appears that ubi_debugfs_init_dev, ubi_debugfs_init,
dbg_debugfs_init_fs, and dbg_debugfs_init rely on DEBUGFS and return
errors when creating DEBUGFS files.

I think either we could conditionalize these functions to return 0 when
DEBUGFS is not present or use a '#error UBI/UBIFS not supported without
DebugFs'.

I think maybe this was an over zealous commit to get good bug reports
and the DEBUGFS itself is not needed, but just the other printk stuff in 
the debug.c files?

I can submit a patch, but I think the explanation above is probably
enough for someone else with a better understanding of the structure.

Regards,
Bill Pringlemeir.
