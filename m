Received: from msr83.hinet.net ([168.95.4.183] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17N2AI-0001F7-00
	for <linux-mtd@lists.infradead.org>; Wed, 26 Jun 2002 03:04:14 +0100
Received: from stevexp (61-219-230-90.HINET-IP.hinet.net [61.219.230.90])
	by msr.hinet.net (8.9.3/8.9.3) with ESMTP id KAA02435
	for <linux-mtd@lists.infradead.org>; Wed, 26 Jun 2002 10:04:18 +0800 (CST)
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: RE: Halt at mounting
Date: Wed, 26 Jun 2002 10:04:07 +0800
Message-ID: <001901c21c37$5e021910$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <001201c21bfe$cae566b0$5501a8c0@synso.com.tw>
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

I use new snapshot source and I can mount jffs2, but it will take about
27 seconds. How to reduce the mounting time?

Steve Tsai




When I copy some files into the jffs2 directory and remove all the
files, the next mounting procedure will halt after nand_read_ecc is
done. The procedure is,

eraseall /dev/mtd1                                            //OK
mount -t jffs2 /dev/mtdblock1 /mnt                    //OK
cp /etc/* /mnt                                                 //OK
rm  /mnt/*                                                       //OK  
umount /mnt                                                   //OK
mount -t jffs2 /dev/mtdblock1 /mnt                    //halt

Have any idea?  Where can I hack?

The last output message,

nand_read_ecc: from = 0x007fe00c, len = 12
nand_read_ecc: from = 0x007fe00c, len = 4096
nand_read_ecc: from = 0x007ff00c, len = 4084


Steve Tsai


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
