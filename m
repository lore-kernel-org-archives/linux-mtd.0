Received: from darkstar.wilibox.com ([195.14.175.138])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NrBz8-0000ZK-UU
	for linux-mtd@lists.infradead.org; Mon, 15 Mar 2010 15:13:43 +0000
Message-ID: <4B9E4E9C.9070704@gmail.com>
Date: Mon, 15 Mar 2010 17:13:32 +0200
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
MIME-Version: 1.0
To: nico@cam.org, simon.kagstrom@netinsight.net
Subject: Orion NAND fails to compile with OABI(?)
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Here is what I get when compiling:

   CC      drivers/mtd/nand/orion_nand.o
/tmp/ccMkwOCs.s: Assembler messages:
/tmp/ccMkwOCs.s:63: Error: first destination register must be even -- 
`ldrd r3,[ip]'
make[5]: *** [drivers/mtd/nand/orion_nand.o] Error 1

When EABI was selected everything compiles OK.
My GCC is 4.2.1, binutils 2.18

BR,
Paulius Zaleckas
