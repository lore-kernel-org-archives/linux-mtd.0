Received: from pd9e41274.dip.t-dialin.net ([217.228.18.116] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16nbSc-0004yO-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2002 08:28:42 +0000
Message-Id: <200203200843.g2K8hhA01557@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: "Thomas Locher" <Thomas.Locher@ascom.ch>
Subject: Re: Bad Blocks on NAND and JFFS2
Date: Wed, 20 Mar 2002 09:43:43 +0100
References: <OF9A1A4A5F.79E7D10D-ONC1256B81.00335FA4@hasler.ascom.ch>
In-Reply-To: <OF9A1A4A5F.79E7D10D-ONC1256B81.00335FA4@hasler.ascom.ch>
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

On Dienstag, 19. März 2002 10:40 , Thomas Locher wrote:
> I tried to put the JFFS2 on our NAND flash, but now I have troubles with
> bad blocks on the flash device.
> The actual CVS (cvs.infradead.org:/home/cvs) code seems to support bad
> block handling, but the code
> doesn't work correctly.
>
> What is the status of bad block handling in JFFS2?
> I ask you this because I think you have developped most of the bad block
> handling.
Please keep such questions on the mailing list. Others may be interrested 
too. :)

Which chips do you use ? Which file did you use as template to hack your 
chipdriver ? Have you adjusted 
        /* 20 us command delay time */
        this->chip_delay = 20;
properly ?

The bad block handling is fully functional. It uses the bad block marking 
scheme of NAND chips (Samsung/Toshiba) and Smartmediacards, which is the same.

You must enable
Enable ECC correction algorithm'  (CONFIG_MTD_NAND_ECC)
JFFS2 layout for OOB area (CONFIG_MTD_NAND_ECC_JFFS2)

There were some modifications to JFFS2 recently, so the CVS seems to be 
broken for JFFS2 and NAND at the moment. I will check this anyway today. Keep 
an eye on the maillist and on linux-mtd-cvs@lists.infradead.org (cvs announce 
list).
 
-- 
Thomas
_________________________________
Thomas Gleixner <gleixner@autronix.de>
autronix automation http://www.autronix.de
