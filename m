Received: from ns0.direkt-kfki.hu ([195.228.103.151] helo=mail.direkt-kfki.hu)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LmtPv-0003KY-Rd
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 17:31:09 +0000
Received: from mail.direkt-kfki.hu (localhost [127.0.0.1])
	by dirweb.direkt-kfki.hu (Postfix) with ESMTP id 50260120852A
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Mar 2009 18:30:57 +0100 (CET)
Received: from [192.168.200.50] (unknown [192.168.200.50])
	by mail.direkt-kfki.hu (Postfix) with ESMTP id B34EF1208528
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Mar 2009 18:30:53 +0100 (CET)
Message-ID: <49CBBBCD.5050104@direkt-kfki.hu>
Date: Thu, 26 Mar 2009 18:30:53 +0100
From: =?ISO-8859-2?Q?Zach=E1r_Bal=E1zs?= <bzachar@direkt-kfki.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: nand flash connected to PCMCIA on a pxa27x based board
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a pxa27x based custom board.
On this board, the nand flash is connected directly to the pxa27x PCMCIA socket's pins...
Like in this doc:
http://pubs.gumstix.org/documents/PXA%20Documentation/PXA270/PXA270%20Connecting%20NAND%20Flash%20%5B28014402%5D.pdf


I would like to port its nand driver to a newer kernel, but I didn't find any other driver which works like my driver should...   :(

Could anybody show me one driver, which use this scheme to the nand connection and have a working driver to a newer (2.6.28+) kernel?

Thanks, regards,
Balazs Zachar
