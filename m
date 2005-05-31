Received: from 207.88.121.43.ptr.us.xo.net ([207.88.121.43]
	helo=mail.realmsys.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dd8cE-0006RG-VO
	for linux-mtd@lists.infradead.org; Tue, 31 May 2005 11:25:20 -0400
From: Peter Grayson <pgrayson@realmsys.com>
To: blair@circumnavnetworks.com
In-Reply-To: <1117478995.24559.12.camel@blairs-desktop>
References: <B1091462CF5479489B1D8FE818330D2C80F27E@exchange2003.ad.skymv.com>
	<429AEC25.4000309@fsforth.de>
	<1117478995.24559.12.camel@blairs-desktop>
Content-Type: text/plain
Date: Tue, 31 May 2005 09:24:59 -0600
Message-Id: <1117553099.4149.82.camel@pgrayson1.realmsys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Jonas <jdietsche@fsforth.de>
Subject: Re: nand write problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> # ./nandwrite -f /dev/mtd/2 jffs2.img
> ./nandwrite: illegal option -- f

The short option (-f) for the --forcelegacy option is broken in the
latest nandwrite. Check out the patch below.

--- nandwrite.c.orig    2005-05-31 09:22:00.000000000 -0600
+++ nandwrite.c 2005-05-31 09:22:08.000000000 -0600
@@ -124,7 +124,7 @@

        for (;;) {
                int option_index = 0;
-               static const char *short_options = "os:ajynqp";
+               static const char *short_options = "os:ajyfnqp";
                static const struct option long_options[] = {
                        {"help", no_argument, 0, 0},
                        {"version", no_argument, 0, 0},
