Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=dual166.onz.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mawD-0001Rf-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 15:15:22 +0100
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: <linux-mtd@lists.infradead.org>
Subject: 64-bit support..what happened?
Date: Wed, 4 Sep 2002 07:14:22 -0700
Message-ID: <NCBBIINEHIPFGJPLBEIFEEKGDLAA.acurtis@onz.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

I am trying to integrate a recent version of MTD from CVS with Linux 2.4.19
in order to gain 64-bit support. However there appears to be several things
wrong which indicates that this does not work.

1. The conditional CONFIG_CFI_64 is defined within cfi.h. However not all
the source modules that use this conditional include the proper header file.
(all the source modules under drivers/mtd/maps)

2. drivers/mtd/maps/physmap.c - attempts to reference __raw_readll() and
__raw_writell() when in 64-bit mode. These functions/macros do not exist.
They would appear in include/asm/io.h. Nothing exists in the MTD tree to
patch this file or otherwise provide these functions.

Any ideas where I can get the 64-bit implementation?

THX
