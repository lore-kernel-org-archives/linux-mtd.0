Received: from okigate.oki.co.jp ([202.226.91.194] helo=iscan1.intra.oki.co.jp)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CJobO-0000ni-BT
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2004 03:40:15 -0400
Received: from aoi.bmc.oki.co.jp (localhost.localdomain [127.0.0.1])
	by iscan1.intra.oki.co.jp (8.9.3/8.9.3) with SMTP id QAA04683
	for <linux-mtd@lists.infradead.org>; Tue, 19 Oct 2004 16:40:12 +0900
Date: Tue, 19 Oct 2004 16:42:32 +0900
From: =?ISO-2022-JP?B?IhskQkgrQ2YhITc8GyhCIC8gSGFqaW1lIA==?=
	=?ISO-2022-JP?B?SEFUQU5BS0Ei?= <hatanaka663@oki.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20041019163009.92EF.HATANAKA663@oki.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-2022-JP"
Content-Transfer-Encoding: 7bit
Subject: JFFS2 Flash Filesystem corrupted
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-20 at 20:18, Billalabeitia, Jose Carlos (GE Consumer &
Industrial) wrote:
> linux-2.4.4-2002-02-14-denx
> linux-2.4.4-jffs2-2002-05-01.patch for the JFFS2 
> (basically improve GC performace)

We have similar problem on
linux-2.4.22-jffs2-2004-8-xx with different CPU
and NAND flash memory.

Do we need try with latest kernel?

Have this problem been solved finally?
