Received: from gate.aminocom.com
	([193.132.141.181] helo=aminocom.com ident=0)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16x793-0006X9-00
	for <linux-mtd@lists.infradead.org>; Mon, 15 Apr 2002 15:07:49 +0100
Message-ID: <3CBADE50.D78A4227@aminocom.com>
Date: Mon, 15 Apr 2002 15:06:08 +0100
From: Elizabeth Clarke <eclarke@aminocom.com>
MIME-Version: 1.0
To: John Hall <John.Hall@optionexist.co.uk>
CC: "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Writing JFFS2 image to Nand flash
References: <541025071C7AC24C84E9F82296BB9B952CF8@OPTEX1.optex.local>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

John Hall wrote:


> fs/fs.o: In function `jffs2_check_nand_cleanmarker':
> fs/fs.o(.text+0x6040c): undefined reference to `jffs2_flash_read_oob'
> fs/fs.o: In function `jffs2_write_nand_cleanmarker':
> fs/fs.o(.text+0x60520): undefined reference to `jffs2_flash_write_oob'
> Where are these two functions defined?

You should find a grep has them in wbuf.c. Are you setting
CONFIG_JFFS2_FS_NAND?

Beth
