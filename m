Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19PTdC-0006FJ-AX
	for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2003 21:52:42 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "Kevin Liao" <kevinliao@iei.com.tw>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 10 Jun 2003 08:55:33 +1200
References: <00cf01c32e77$4367ae00$511711ac@kevinliao>
In-Reply-To: <00cf01c32e77$4367ae00$511711ac@kevinliao>
MIME-Version: 1.0
Message-Id: <20030609205314.1F09414EFC@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: A question about how to send a page program command to NAND flash
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 09 June 2003 23:07, Kevin Liao wrote:
> In nand.c, I found that there was a piece of code in nand_command(...) as
> below:
>
> ...
> if (command != NAND_CMD_SEQIN)
>   writeb (command, NAND_IO_ADDR);
>  else {
>   if (mtd->oobblock == 256 && column >= 256) {
>    column -= 256;
>    writeb (NAND_CMD_READOOB, NAND_IO_ADDR);
>    writeb (NAND_CMD_SEQIN, NAND_IO_ADDR);
>   } else if (mtd->oobblock == 512 && column >= 256) {
>    if (column < 512) {
>     column -= 256;
>     writeb (NAND_CMD_READ1, NAND_IO_ADDR);
>     writeb (NAND_CMD_SEQIN, NAND_IO_ADDR);
>    } else {
>     column -= 512;
>     writeb (NAND_CMD_READOOB, NAND_IO_ADDR);
>     writeb (NAND_CMD_SEQIN, NAND_IO_ADDR);
>    }
>   } else {
>    writeb (NAND_CMD_READ0, NAND_IO_ADDR);
>    writeb (NAND_CMD_SEQIN, NAND_IO_ADDR);
>   }
>  }
> ...
>
> My question is why we need to send some kind of read command first before
> issuing the real page program command? Thanks a lot.

This is required to adjust the "pointer" to the correct part of a page.
This is explained in the NAND datasheets (available from the vendors' 
websites).

-- CHarles
