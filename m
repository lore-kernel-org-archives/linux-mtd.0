Received: from mail826.carrierinternetsolutions.com ([69.49.106.36]
	helo=mail826.megamailservers.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BgE5o-000815-Cf
	for linux-mtd@lists.infradead.org; Thu, 01 Jul 2004 22:48:01 -0400
Received: from brigid (pcp08587232pcs.alxndr01.va.comcast.net [69.140.78.107])
	(authenticated bits=0)
	by mail826.megamailservers.com (8.12.10/8.12.9) with ESMTP id
	i622lrY8006255
	for <linux-mtd@lists.infradead.org>; Thu, 1 Jul 2004 22:47:54 -0400
From: "Robert Lippmann" <rlippmann@imsventures.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 1 Jul 2004 22:46:00 -0400
Message-ID: <NFBBKPKLPNGEMNKJKAIKIEBBCDAA.rlippmann@imsventures.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
Subject: unresoved symbol __ffs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi all,

haven't seen this covered before, but when i try to use recent snapshots
(late june-ish), i get this unresolved symbol when building a 2.4.26 kernel
using linux-mips.  i assume it's because the compiler
sets --disable-builtins when compiling.  it occurs in cfi_cmdset_0001.c
oddly, the file compiles without warnings.  oh, and i'm using gcc 3.3.2

i've tried #define __ffs ffs, but even that doesn't seem to work.

any ideas?
