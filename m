Received: from yuha.menta.net ([212.78.128.42])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEvpF-0006qI-PR
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2003 19:17:50 +0000
Received: from gibson.menta.net ([212.78.128.22]) by
          yuha.menta.net (Netscape Messaging Server 4.15) with ESMTP id
          HNJ9M800.73S for <linux-mtd@lists.infradead.org>; Wed, 29 Oct
          2003 20:18:08 +0100
Received: from stream.amrsystems.com ([62.57.42.165]) by
          gibson.menta.net (Netscape Messaging Server 4.15 gibson Mar 14
          2002 21:29:48) with ESMTP id HNJ9PF00.84U for
          <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2003 20:20:03 +0100
Received: (from perello@localhost)
	by stream.amrsystems.com (8.11.6/linuxconf) id h9TJRXr02191
	for linux-mtd@lists.infradead.org; Wed, 29 Oct 2003 20:27:33 +0100
From: Carles Perello <carles.perello@ieee.org>
To: linux-mtd@lists.infradead.org
Message-Id: <1067455652.662.3.camel@stream.amrsystems.com>
Mime-Version: 1.0
Date: 29 Oct 2003 20:27:32 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: mtd from cvs compiles for a 2.4.x kernel?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

I updated my mtd sources from CVS today and patched a 2.4.19 kernel for
an arm target...

while trying to compile complains about undefined SA1100_CS0_PHYS in
sa1100-flash.c.

I wonder is this is a new definition on 2.5.x kernels..or I am missing
something.

Any hint?
-- 
Carles Perello <carles.perello@ieee.org>
