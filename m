Received: from pd953a194.dip.t-dialin.net ([217.83.161.148] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16tAum-00061S-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 18:20:48 +0100
Message-Id: <200204041721.g34HL1g27945@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: "John Hall" <John.Hall@optionexist.co.uk>, <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 with NAND flash
Date: Thu, 4 Apr 2002 19:21:00 +0200
References: <541025071C7AC24C84E9F82296BB9B952CE9@OPTEX1.optex.local>
In-Reply-To: <541025071C7AC24C84E9F82296BB9B952CE9@OPTEX1.optex.local>
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

On Thursday, 4. April 2002 17:11, John Hall wrote:
> On 03 April 2002 15:16, I wrote
>
> Using nanddump I've found that this is because I have some bad blocks on
> the Smartmedia card I'm testing with. After an erase the block mentioned
> above is stuck at c0c0.
>
> Is there a utility around that will go through and test blocks, marking
> bad ones as bad using the bad block flag in the oob? If not, would it be
> useful to others if I wrote one?

The bad blocks should not be erased, if you have selected NAND_ECC_JFFS2 (oob 
layout for JFFS2). JFFS2 will mark this block bad, if erase of this block 
failes.

-- 
Thomas
___________________________________
autronix automation GmbH
http://www.autronix.de gleixner@autronix.de
