Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16o7FW-0007BE-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Mar 2002 18:25:18 +0000
Message-Id: <200203211836.g2LIacw02147@dagobert.svc.sysgo.de>
Content-Type: text/plain;
  charset="iso-8859-15"
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rkaiser@sysgo.de
To: gleixner@autronix.de
Subject: Re: drivers/mtd/nand/spia.c broken ?
Date: Thu, 21 Mar 2002 19:37:31 +0100
References: <200203211538.g2LFcVw31556@dagobert.svc.sysgo.de> <200203211802.g2LI2dM12087@thomas.tec.autronix.de>
In-Reply-To: <200203211802.g2LI2dM12087@thomas.tec.autronix.de>
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

Am Donnerstag, 21. März 2002 19:02 schrieben Sie:
> On Donnerstag, 21. März 2002 16:39 , Robert Kaiser wrote:
> > Hi,
> > has anyone tried to compile this file lately ?
>
> Not me. I just adjusted all the changes we made in nand.c.
>
> > I'm only asking because it contains some IMO strange stuff:
> > Line 38 following: #define SPIA_XX =
> > Line 38 vs. 55, 39 vs 56:  xxx_ADDR <> xxx_BASE
>
> I don't know, where the SPIA_IO_BASE comes from. Maybe from a header, which
> is not in the ARM kernel tree. But it should represent the virtual base
> address of EP7212 IO adress space.
>
> > Line 161: return = -ENOMEM
>
> This is the standard return, if kmalloc failes :) The data cache was
> introduced due to the changes in nand.c, which were made for JFFS2 on NAND

Hmm, what I meant to point out is that "return" is a reserved word in C, so 
it is not possible to have a variable of that name, let alone assign a value 
to it. Similarly, lines like "#define SOMETHING = something" to me make no 
sense (the "=" must be removed).

These are some reasons why the file probably won't compile as is.

Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
