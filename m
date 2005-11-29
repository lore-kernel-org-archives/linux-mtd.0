Received: from [202.108.3.160] (helo=vip3-160.sinamail.sina.com.cn)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eh1YO-0002Gy-8F
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 04:13:50 -0500
Message-ID: <20051129091334.33131.qmail@vip3-160.sinamail.sina.com.cn>
Date: Tue, 29 Nov 2005 17:13:34 +0800
MIME-Version: 1.0
From: superlidu@vip.sina.com
To: tglx@linutronix.de
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: RE: Re: question:EXT2 on a normal NAND flash(not a diskonchip flash)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


----- Original Message -----



From: Thomas Gleixner <tglx@linutronix.de>

To: superlidu@vip.sina.com

Subject: Re: question:EXT2 on a normal NAND flash(not a diskonchip flash)

Date: Tue, 29 Nov 2005 10:03:30 +0100



On Tue, 2005-11-29 at 16:43 +0800, superlidu@vip.sina.com wrote: 

 > Hi, Now I am going to use ext2 on a normal nand flash, according to 

 > the MTD guild,there should be four layer: ext2-->NFTL-->MTD-->NAND 

 > FLASH. now I have a question, the xconfig help said NFTL is used on 

 > the diskonchip flash, can I use it on the normal nand flash(like 

 > samsung\\\'s)? if it can do, what should I do in my nand flash driver? 

  

 NFTL works only on DiskOnChip devices.  

  

 Use a NAND aware filesystem. 

 	tglx 

 do you mean I should use JFFS2? but if normal NAND flash can only use JFFS2, maybe it is not 

flexible restrict,e.g. if cannot use FAT, the nand flash cannot used as a U-DISK.



 Thank you for your reply!

  sword

  

 ______________________________________________________ 

 Linux MTD discussion mailing list 

 <a href=\'http://lists.infradead.org/mailman/listinfo/linux-mtd/\' target=\'blank\'>http://lists.infradead.org/mailman/listinfo/linux-mtd/</a>
