Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18M4ij-0008Ba-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2002 11:08:05 +0000
Message-Id: <200212111138.gBBBcYs16381@dagobert.svc.sysgo.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rkaiser@sysgo.de
To: "Christian Gan" <cgan@iders.ca>, <linux-mtd@lists.infradead.org>,
   "yaffs list" <yaffs@toby-churchill.org>
Subject: Re: NAND and concat
Date: Wed, 11 Dec 2002 13:46:39 +0100
References: <NFBBLPGPLKFIKCCPLALEOEPHCEAA.cgan@iders.ca>
In-Reply-To: <NFBBLPGPLKFIKCCPLALEOEPHCEAA.cgan@iders.ca>
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

Am Mittwoch, 11. Dezember 2002 00:29 schrieb Christian Gan:
> Is anyone working on concat for NAND flashes? 

Probably not.

> I looked though and realised
> that there is no functionality at the moment for NAND (i.e. no support for
> read/write oob etc).

I must admit that I knew nothing about NAND flashes when I wrote the concat 
stuff (and this hasn't improved much in the meantime) :-(.

OTOH, all the concat stuff does is to redirect calls to the hardware drivers, 
so, except for the maintaining of OOB data, what NAND specific functionality 
would be needed ?

Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO AG
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
