Received: from pd9eb91f2.dip.t-dialin.net ([217.235.145.242] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dC5F-0000Og-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2002 15:21:33 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: "rolf.fiedler" <rolf.fiedler@loop.de>, linux-mtd@lists.infradead.org
Subject: Re: nand driver patch
Date: Tue, 19 Feb 2002 16:35:40 +0100
References: <20020219142725.FHPN19335.wmpexmta02-pub.mail-store.com@onebox.com>
In-Reply-To: <20020219142725.FHPN19335.wmpexmta02-pub.mail-store.com@onebox.com>
MIME-Version: 1.0
Message-Id: <02021916354000.05221@thomas>
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

On Tuesday, 19. February 2002 15:27, rolf.fiedler wrote:
> Hi there 
> 
> I have some strange piece of hardware that uses two different IO addresses
> for the nand flash read/write accesses. I modified the nand struct
> IO_ADDR to have IO_R_ADDR and IO_W_ADDR (in nand.h and nand.c)
> and also upgraded the spia driver to use this more flexible abstraction.
> pros: works with obscure hardware (like the one I have to use at the
> moment)
> cons: uses one long int (4 bytes) more memory
> 
The latest CVS contains a patch for this purpose alreay !
-- 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
