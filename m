Received: from pd9e4123c.dip.t-dialin.net ([217.228.18.60] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16irdm-0004df-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Mar 2002 06:44:39 +0000
Message-Id: <200203070659.g276xV503416@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: Juergen Brunk <juergen.brunk@gmx.de>
Subject: Re: NAND instead of NOR Flash-ROMs ??
Date: Thu, 7 Mar 2002 07:59:31 +0100
References: <3C865B0D.B71D85C7@gmx.de>
In-Reply-To: <3C865B0D.B71D85C7@gmx.de>
Cc: linux-mtd@lists.infradead.org
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

On Mittwoch, 6. März 2002 19:08 , Juergen Brunk wrote:
> Hello *
>
> Could i use cheaper NAND Flash-ROMs instead of expensive NOR Flash-ROMs
> (like Intel Strato-Flash) to hold the ARM-Kernel/Applikations/Data and
> boot the System from?
You can't boot from NAND-FLASH directly. There are two ways to solve this:

1. Use a CPLD, which provides you access to the first NAND-Page, which must 
then contain a small bootstrap code. 

2. Use a small and cheap 1MB FLASH for bootload which can also contain a 
compressed kernel Image. Start from there and mount a filesystem on the 
NAND-Flash.

I suggest the second one.

-- 
Thomas
_________________________________
Thomas Gleixner <gleixner@autronix.de>
autronix automation http://www.autronix.de
