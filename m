Received: from pd953a61a.dip.t-dialin.net ([217.83.166.26] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16aITv-0008VD-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2002 15:35:03 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: NAND flash and JFFS(2)
Date: Mon, 11 Feb 2002 16:48:38 +0100
Cc: jffs-dev@axis.com, linux-mtd@lists.infradead.org
References: <02021116320106.00764@thomas>
In-Reply-To: <02021116320106.00764@thomas>
MIME-Version: 1.0
Message-Id: <02021116483807.00764@thomas>
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

On Monday, 11. February 2002 16:32, Thomas Gleixner wrote:
> On Monday, 11. February 2002 14:53, David Woodhouse wrote:
> > Where's the ECC when we're using the SmartMedia format on them?
>
> The layout for SmartMedia DOS for 256 byte pagesize:
>
> Even page:
> Byte 0-3	reserved area
> Byte 4		data status flag
> Byte 5		block status flag (bad block marker)
> Byte 6-7	block adress 1
>
> Odd page:
> Byte 0-2 	ECC Area-2 (odd page)
> Byte 3-4	Block Address 2
> Byte 5-7	ECC Area-1 (even page)
>
> The layout for SmartMedia DOS for 512 byte pagesize:
> Byte 0-3	Reserved Area
> Byte 4		Data Status Flag
> Byte 5		block status flag (bad block marker)
> Byte 6-7	Block Address-1
> Byte 8-10 	ECC Area-2 (byte 256-511)
> Byte 11-12	Block Address 2
> Byte 13-15	ECC Area-1 (byte 0-255)
>
> They build a virtual blocksize of 512 byte on the small devices. I thought
> about doing the same, but IMHO it's not a good idea.
>
I reflected this question again and we should do this very careful before 
implemetation. If we choose the same layout, somebody would be able to 
implement the SmartMedia DOS fs on top of SmartMedia and raw NAND flash.
I personally have not interest in this fs, it's ok for MP3 players and 
digicams but not for industrial use.

Thomas 
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
