Received: from pd953a147.dip.t-dialin.net ([217.83.161.71] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16beCT-0005QL-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Feb 2002 08:58:37 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>, Eric Nelson <eric_n2@verifone.com>
Subject: Re: Alternate to DOC??
Date: Fri, 15 Feb 2002 10:11:38 +0100
Cc: linux-mtd@lists.infradead.org
References: <614CC7C21856D1118DA30060B06B487302ACC8D0@SMF-NT-MAIL1> <17310.1013755796@redhat.com>
In-Reply-To: <17310.1013755796@redhat.com>
MIME-Version: 1.0
Message-Id: <0202151011380I.29375@thomas>
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

On Friday, 15. February 2002 07:49, David Woodhouse wrote:
> eric_n2@verifone.com said:
> > We would very much like to use JFFS2 on a project.  However, most
> > boards have either CF or DOC.  My understanding of JFFS2 on DOC is
> > that you disable the controller on the DOC, and just use the flash.
>
> No, you can use the controller. All it does is ECC. The NFTL stuff was all
> done in software anyway.
>
> > Now, wouldn't it be a good idea for someone to build a device w/ same
> > footprint as DOC, but w/ just raw flash?  Maybe we could do this.
> > Would this impinge on some patent by M-Systems?  It would make it a
> > lot easier for us to use JFFS2 if we could do this.
>
> The socket and pin layout are standard, I believe. There's no problem with
> making an alternative device to fit.

The pin layout of the DOC 2000 DIP is the same as a 128k X 8 FLASH. But they 
use only A0-A12. The adress lines A13-A16 are N.C. The logic inside the DOC 
takes care that you have access to a small bootblock after reset. So it's a 
drop in replacement for standard Boot-Flash. The bootblock contains a 
bootloader code for access to the NAND chip.
If you want to build a replacement chip, you have to check, if you need the 
boot option or not. Anything else like the ECC logic can you do either in HW 
(CPLD) or in SW.

Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
