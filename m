Received: from pd9eb8e29.dip.t-dialin.net ([217.235.142.41] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17H2gC-0005Ah-00
	for <linux-mtd@lists.infradead.org>; Sun, 09 Jun 2002 14:24:24 +0100
Message-Id: <200206091324.g59DOW901667@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: Jason Chan <jason@emsoftltd.com>,
   "'linux-arm-kernel@lists.arm.linux.org.uk'" <linux-arm-kernel@lists.arm.linux.org.uk>,
   linux-mtd@lists.infradead.org
Subject: Re: Need Some help to write NandFlash Driver
Date: Sun, 9 Jun 2002 15:24:32 +0200
References: <3CFECA68.6060709@emsoftltd.com>
In-Reply-To: <3CFECA68.6060709@emsoftltd.com>
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

On Thursday, 6. June 2002 04:35, Jason Chan wrote:
> Dear all,
> 	I am currently implementing Samsung Nand-Flash Driver for edb7312 block on
> 2.4.18 kernel. I am seeking for suggestion on which method should be used
> to improve my nandflash driver.
There is a working nand flash driver for edb7312 in mtd CVS. 
JFFS2 support is working

-- 
Thomas
___________________________________
autronix automation GmbH
http://www.autronix.de gleixner@autronix.de
