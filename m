Received: from pd953acaa.dip.t-dialin.net ([217.83.172.170] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16aLuK-0000In-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2002 19:14:32 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: NAND flash and JFFS(2)
Date: Mon, 11 Feb 2002 20:28:09 +0100
Cc: jffs-dev@axis.com, linux-mtd@lists.infradead.org
References: <02021116320106.00764@thomas> <02021116483807.00764@thomas>
In-Reply-To: <02021116483807.00764@thomas>
MIME-Version: 1.0
Message-Id: <0202112028090B.00764@thomas>
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

On Monday, 11. February 2002 16:48, Thomas Gleixner wrote:

> I reflected this question again and we should do this very careful before
> implemetation. If we choose the same layout, somebody would be able to
> implement the SmartMedia DOS fs on top of SmartMedia and raw NAND flash.
> I personally have not interest in this fs, it's ok for MP3 players and
> digicams but not for industrial use.

I had a look at the nand driver, where we have to do some changes anyway to 
support a different ECC address. To get the flexibility to use either a JFFS2 
specific ECC scheme or a different scheme like the SmartMedia DOS-FAT i will 
add a array to the nand structure, which holds the positions of the ECC bytes 
inside the spare area and a flag, which can be used to support the virtual 
pagesize of 512 Byte for small NAND devices (if anybody is going to implement 
this). 
The filesystem driver can set the ECC byte positions, so they match it's 
requirements. We could add config options to select a default ECC scheme, so 
we have access to the chip as char device too. I'm not sure if we need this 
really.
So we have the flexibility to do what we want and we don't prevent anybody 
from implementing a different system.

I will try it with the following scheme tonight:

SmartMedia and raw NAND 512 byte pagesize
Byte 0-3        ECC part 1
Byte 4           page data valid flag
Byte 5           bad block status
Byte 6-7        ECC part 2
Byte 8-15      cleanmarker

SmartMedia and raw NAND 256 Byte pagesize
Byte 0-2        ECC
Byte 3           spare
Byte 4           page data valid flag 
Byte 5           bad block status
Byte 6-7        cleanmarker

I have both card types so i can verify that it works.

Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
