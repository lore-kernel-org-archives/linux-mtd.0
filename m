Received: from [203.196.146.243] (helo=Mistralsoftware.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C9LMi-00085t-L7
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2004 06:25:50 -0400
Received: from Aman ([192.168.13.55])
	by mistralsoftware.com (mistralsoftware.com [192.168.10.12])
	(MDaemon.PRO.v7.1.1.R) with ESMTP id md50000077356.msg
	for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2004 15:48:31 +0530
From: "Amanullah Khan" <aman@mistralsoftware.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 20 Sep 2004 15:47:32 +0530
Message-ID: <KBEHLCHPJHMPJFKMLMOPKEIJCJAA.aman@mistralsoftware.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: K9F2g08u0m Samsung Nand Support
Reply-To: aman@mistralsoftware.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All

In the K9F2g08u0m Samsung NAND, there is a restriction for programming page
in a Block. The restriction is,
"Within a block, the pages must be programmed consecutively from the LSB
(least significant bit) page of the block to MSB (most significant bit)
pages of the block. Random page address programming is prohibited".

I would like to know whether in JFFS2 these restrictions are taken care.

Regards
Mistkhan
