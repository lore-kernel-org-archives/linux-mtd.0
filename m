Received: from dragon.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 179iS1-0004Hu-00
	for <linux-mtd@lists.infradead.org>; Mon, 20 May 2002 09:23:29 +0100
Received: from there (203-96-30-79-adsl.actrix.co.nz [203.96.30.79])
	by dragon.actrix.co.nz (Postfix) with SMTP id E187B4B96C
	for <linux-mtd@lists.infradead.org>; Mon, 20 May 2002 20:22:40 +1200 (NZST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: linux-mtd@lists.infradead.org
Subject: Re: Boot from NAND flash ???
Date: Mon, 20 May 2002 20:17:22 +1200
References: <AEA9DCA73595D411A6D4009027DE9C5E019BFC18@MSI-EX6> <200001121150.e0CBopn01828@thomas.tec.autronix.de>
In-Reply-To: <200001121150.e0CBopn01828@thomas.tec.autronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020520082240.E187B4B96C@dragon.actrix.co.nz>
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

On Thu, 13 Jan 2000 00:50, Thomas Gleixner wrote:
> On Monday, 13. May 2002 18:47, Vadim Khmelnitsky wrote:
> > [Thomas]
> > There's another important limitation. Who guarantees you, that your
> > "boot-page" does not get bad or is a bad block already. That's the
> > reason, why DOC has 4 blocks with the same code.
> >
> > [Vadim]
> > Actually, in Diskonchip Millennium 8MB we have first erasable unit
> > guaranteed to be good .
> > We do have two copies of a boot-code stored one after another in page 0
> > and 1 of the first erasable unit .
>
> That applies for DOC devices, but not for raw NAND chips.
>
> Thomas


The raw Samsung/Toshiba parts are tested and their bad blocks are marked. 
They guarantee that the first block is not bad when shipped.

BTW: Some of the newer raw NAND devices power up with page 0 pre-selected for 
read. Thus, you can fetch executable code directly off these devices at boot 
time (ie. use them to replace boot NOR).

-- Charles
