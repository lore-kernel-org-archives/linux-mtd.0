Received: from [140.117.176.20] (helo=wamis0.cse.nsysu.edu.tw)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17bRS2-000267-00
	for <linux-mtd@lists.infradead.org>; Sun, 04 Aug 2002 20:54:06 +0100
Received: from localhost (gamble@localhost)
	by wamis0.cse.nsysu.edu.tw (8.11.4/8.11.3) with ESMTP id g74Js2p34593
	for <linux-mtd@lists.infradead.org>; Mon, 5 Aug 2002 03:54:02 +0800 (CST)
	(envelope-from gamble@wamis0.cse.nsysu.edu.tw)
Date: Mon, 5 Aug 2002 03:54:02 +0800 (CST)
From: =?X-UNKNOWN?Q?=AAL=AD=D7=BDn?= <gamble@wamis0.cse.nsysu.edu.tw>
To: linux-mtd@lists.infradead.org
Subject: problem about detecting FlashROM
Message-ID: <Pine.BSF.4.21.0208050351180.34590-100000@wamis0.cse.nsysu.edu.tw>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Dear Sir
	I am trying to boot Linux kernel 2.4.16 on FlashROM
	My environment is 
	board : TOSHIBA TX4927 with FlashROM
 	kernel : linux kernel 2.4.16 with NFSroot ( I wonder whether this
                 root filesystem will affect somethings )
	
	I have builded the Linux kernel with MTD/JIFFS/CFI supported ,
        according to mtd-jffs-HOWTO.txt
	
        But when I type the "modprobe -a physmap" command , it displays
        that " modprobe: Can't locate module physmap "

	Any help would be appreciated.
	Thank you
