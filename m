Received: from pd9eb9c7b.dip.t-dialin.net ([217.235.156.123] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 179MBn-0002sh-00
	for <linux-mtd@lists.infradead.org>; Sun, 19 May 2002 09:37:15 +0100
Message-Id: <200001121150.e0CBopn01828@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: Vadim Khmelnitsky <VadimK@m-sys.com>, manningc2@actrix.gen.nz,
   David Woodhouse <dwmw2@infradead.org>, franck.fleter@netbricks.com
Subject: Re: Boot from NAND flash ???
Date: Wed, 12 Jan 2000 12:50:49 +0100
Cc: linux-mtd@lists.infradead.org
References: <AEA9DCA73595D411A6D4009027DE9C5E019BFC18@MSI-EX6>
In-Reply-To: <AEA9DCA73595D411A6D4009027DE9C5E019BFC18@MSI-EX6>
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

On Monday, 13. May 2002 18:47, Vadim Khmelnitsky wrote:
> [Thomas]
> There's another important limitation. Who guarantees you, that your
> "boot-page" does not get bad or is a bad block already. That's the reason,
> why DOC has 4 blocks with the same code.
>
> [Vadim]
> Actually, in Diskonchip Millennium 8MB we have first erasable unit
> guaranteed to be good .
> We do have two copies of a boot-code stored one after another in page 0 and
> 1 of the first erasable unit .

That applies for DOC devices, but not for raw NAND chips.

Thomas
___________________________________
autronix automation GmbH
http://www.autronix.de gleixner@autronix.de
