Received: from [211.219.100.34] (helo=karam.co.kr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18e9tM-0000Mw-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 08:17:49 +0000
Received: from there (chaos [192.168.1.10])
	by karam.co.kr (8.11.3/8.11.3) with SMTP id h0U8mto05234
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 17:48:55 +0900
Message-Id: <200301300848.h0U8mto05234@karam.co.kr>
Content-Type: text/plain;
  charset="euc-kr"
From: khp <khp@karam.co.kr>
To: linux-mtd@lists.infradead.org
Subject: Q: Hardware driver for multiple NAND chips
Date: Thu, 30 Jan 2003 17:48:56 +0900
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Does the nand driver support multiple chips in the same board?
In some hardware the nand chips share ALE and CLE pins while /CE pins have 
separate control lines for each chip. 
But hwcontrol function examples in the directory driver/mtd/nand contain 
simply NAND_CTL_SETNCE and NAND_CTL_CLRNCE functions. 
How to activate individual chip explicitly when several /CE pins exist?

TIA.
