Received: from dragon.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Td7Z-0007eS-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 Jan 2003 07:16:58 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: Jeff Lin <jlin87@yahoo.com>, linux-mtd@lists.infradead.org
Subject: Re: FTL of compact flash card
Date: Wed, 1 Jan 2003 20:43:02 +1300
References: <20021231194227.16581.qmail@web40412.mail.yahoo.com>
In-Reply-To: <20021231194227.16581.qmail@web40412.mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20030101074730.0D64C158A5@dragon.actrix.co.nz>
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

>From what I read here, what you want is a mapping that provides a block-wise 
interface to the flash.

JFFSx is a file system. That will not do what you want.

What you need is some block-like FTL like NFTL or whatever goes on inside a 
Compact Flash or ATA card. I am not aware of any open source code that will 
do what you want. As far as I can tell all this code is fiercely guarded by 
companies like Sandisk and MSystems.

Maybe someone can be more helpful.....

-- CHarles


On Wed, 01 Jan 2003 08:42, Jeff Lin wrote:
> Hello, all,
>
>  First, Happy new year to you!
>
>  I am looking for a FTL (flash translation layer)code
> that will emulates the flash memory as a IDE  disk
> for the controller IC inside the compact flash card.
>
> The FTL will need to do logical to physical address
> mapping, bad block management, and wear level
> algorithm. There is no File system needed, instead,
> the FTL will talk to the native file system.
>
> Is there any open source code of FTL available? Can
> NFTL or JFFS/JFFS2 be tailored for this purpose? As
> for commercial FTL, which commercial code is
> good/reliable and relatively inexpensive?
>
> Thank you very much for help,
> Jeff
>
>
>
>
> __________________________________________________
> Do you Yahoo!?
> Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
> http://mailplus.yahoo.com
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
