Received: from [207.164.182.47] (helo=hermes.cbnco.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AAvv9-0002kU-KO
	for <linux-mtd@lists.infradead.org>; Sat, 18 Oct 2003 19:35:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by hermes.cbnco.com (Postfix) with ESMTP id E82221276
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Oct 2003 14:34:15 -0400 (EDT)
Received: from ex-max.ott.wann.com (porcuswine.cbnco.com [207.164.182.8])
	by hermes.cbnco.com (Postfix) with ESMTP id 27735B0C
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Oct 2003 14:34:14 -0400 (EDT)
To: linux-mtd@lists.infradead.org
From: Vlad <vdoukhan@cbnco.com>
MIME-Version: 1.0
Date: Sat, 18 Oct 2003 14:34:13 -0400
Message-ID: <oprw84jbd56cx9a8@cbncitar.cbnco.com>
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: patchin.sh and 2.4.22
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

For some reason 1.16 patchin.sh doesn't copy/link suspend.h into 
include/linux/ and therefore I've got a compilation error.

Cheers,
Vlad


cvs -z9 diff  "patchin.sh"
Index: patchin.sh
===================================================================
RCS file: /home/cvs/mtd/patches/patchin.sh,v
retrieving revision 1.16
diff -r1.16 patchin.sh
50c50
< FS_INC_BEL2420="jffs*.h workqueue.h z*.h rb*.h"
---
> FS_INC_BEL2420="jffs*.h workqueue.h suspend.h z*.h rb*.h"
52c52
< FS_INC_BEL25="jffs2*.h workqueue.h rb*.h"
---
> FS_INC_BEL25="jffs2*.h workqueue.h suspend.h rb*.h"
