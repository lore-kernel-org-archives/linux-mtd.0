Received: from [207.164.182.47] (helo=hermes.cbnco.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ABGoB-0006TE-D8
	for <linux-mtd@lists.infradead.org>; Sun, 19 Oct 2003 17:53:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by hermes.cbnco.com (Postfix) with ESMTP id 6BE06128D
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Oct 2003 12:52:31 -0400 (EDT)
Received: from ex-max.ott.wann.com (porcuswine.cbnco.com [207.164.182.8])
	by hermes.cbnco.com (Postfix) with ESMTP id A5F3E1210
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Oct 2003 12:52:30 -0400 (EDT)
Date: Sun, 19 Oct 2003 12:52:29 -0400
To: linux-mtd@lists.infradead.org
From: Vlad <vdoukhan@cbnco.com>
MIME-Version: 1.0
Message-ID: <oprxauhrln6cx9a8@cbncitar.cbnco.com>
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: Two commas in cfi_cmdset_0002.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

I think you have forgotten two commas.

Cheers,
vlad

cvs -z9 diff  "cfi_cmdset_0002.c"
Index: cfi_cmdset_0002.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0002.c,v
retrieving revision 1.89
diff -r1.89 cfi_cmdset_0002.c
371c371
< 			DEBUG(MTD_DEBUG_LEVEL1 "Using buffer write method\n" );
---
> 			DEBUG(MTD_DEBUG_LEVEL1, "Using buffer write method\n" );
374c374
< 			DEBUG(MTD_DEBUG_LEVEL1 "Using word write method\n" );
---
> 			DEBUG(MTD_DEBUG_LEVEL1, "Using word write method\n" );
