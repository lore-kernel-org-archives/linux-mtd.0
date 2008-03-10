Received: from mail.feig.de ([212.184.177.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JYcPX-0003V4-OI
	for linux-mtd@lists.infradead.org; Mon, 10 Mar 2008 07:27:04 +0000
Message-ID: <47D4E2C4.10402@feig.de>
Date: Mon, 10 Mar 2008 08:27:00 +0100
From: Manuel Sahm <Manuel.Sahm@feig.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: "root=/dev/mtblock3" or "root=dev/mtddblock/3"
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

could anybody explain me the difference between this two commands.
I want to boot the RFS out of the NAND Flash Partition 3 and tell the 
kernel this through the bootargs.

This works:

"root=dev/mtddblock/3" works,

but in many examples is shown that this should be added to the bootargs...?

"root=/dev/mtblock3"

The scond one doen?t work at my system ??? Why?

Thank you

-- 
Best regards 

Manuel Sahm
