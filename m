Received: from [202.98.123.42] (helo=mail.ocdtt.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16SrcH-0006th-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2002 03:28:57 +0000
Message-ID: <004a01c1a2f6$85633350$0c1112ac@ming>
From: "Chen Yaoming" <ymchen@ocdtt.com>
To: <linux-mtd@lists.infradead.org>,
	"Jeroen Roose" <Jeroen.Roose@chess.nl>
References: <200201211137.MAA19110@enterprise.chess.nl>
Subject: Re: Intel C3 chips
Date: Tue, 22 Jan 2002 11:40:20 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
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

MTD can unlock Intel C3 flash, but the code is incomplete. Please look at
drivers/mtd/chips/cfi_cmdset_0001.c

----- Original Message ----- 
From: "Jeroen Roose" <Jeroen.Roose@chess.nl>
To: <linux-mtd@lists.infradead.org>
Sent: Monday, January 21, 2002 7:37 PM
Subject: Intel C3 chips


> Hello,
> 
> We've got a board based on the CDB89712 but using C3 (TE28F320/C3BC90) in
> stead of the B3 version. The C3 chip locks all blocks on chip reset. I've
> patched the bootloader (hermit) to unlock all blocks on boot.
> I've got MTD/JFFS2 working on the board, with the bootloader patch, but I
> think MTD should unlock the blocks.
> I'm not familiar with the MTD architecture, so I don't no how/where to
> implement this, can You help me to point this out ?
> 
> Thanks,
> 
> Jeroen Roose
> 
> chess eT
> 
> http://www.chess.nl
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
