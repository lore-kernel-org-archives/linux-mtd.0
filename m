Received: from linares.terra.com.br ([200.154.55.228])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bvjz3-00007g-BL
	for linux-mtd@lists.infradead.org; Fri, 13 Aug 2004 17:53:12 -0400
Received: from pasto.terra.com.br (pasto.terra.com.br [200.154.55.137])
	by linares.terra.com.br (Postfix) with ESMTP id CA03DDDC45E
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Aug 2004 18:53:00 -0300 (BRT)
Received: from ummagumma.ozzmosis.net
	(200-102-085-034.nhoce7002.dsl.brasiltelecom.net.br [200.102.85.34])
	(authenticated user lucasvr)
	by pasto.terra.com.br (Postfix) with ESMTP id A95253C003
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Aug 2004 18:53:00 -0300 (BRT)
From: Lucas Correia Villa Real <lucasvr@gobolinux.org>
To: linux-mtd@lists.infradead.org
Date: Fri, 13 Aug 2004 18:55:16 -0300
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200408131855.16376.lucasvr@gobolinux.org>
Subject: CRC errors and DMA
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

What happens when the processor tryies to read data from memory while the bus 
is being used for DMA transfers by another device? Is it possible that this 
kind of situation turns into CRC errors when trying to read data from a flash 
device (JFFS2)?

Given that this problem can happen, is there a way to make JFFS2, or the MTD 
subsystem to try to execute the operation again?

Any suggestion is very welcome.

Thanks in advance,
Lucas
