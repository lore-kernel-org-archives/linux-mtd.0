Received: from pd9eb905c.dip.t-dialin.net ([217.235.144.92] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170fk3-0007qy-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Apr 2002 10:40:43 +0100
Message-Id: <200204250938.g3P9ca309873@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: "John Hall" <John.Hall@optionexist.co.uk>,
   "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 on both Nand and StrataFlash
Date: Thu, 25 Apr 2002 11:38:36 +0200
References: <541025071C7AC24C84E9F82296BB9B95080549@OPTEX1.optex.local>
In-Reply-To: <541025071C7AC24C84E9F82296BB9B95080549@OPTEX1.optex.local>
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

On Thursday, 25. April 2002 10:50, John Hall wrote:
> On 18 April 2002 16:24, John Hall wrote:
> > I have a board that has Intel StrataFlash as well as a
> > Smartmedia card slot. I have JFFS2 happily up and running on
> > the Smartmedia card, but would also like to put JFFS2 on a
> > section of the StrataFlash.
> >
> > If JFFS2 is configured for Nand flash (CONFIG_JFFS2_FS_NAND),
> > will it run on the StrataFlash or is it currently one or the other?
>
> I've looked at the code, and it looks like it might work on non-NAND
> flash. Is this the case?
>
Yep. The special handling for NAND devices is skipped for NOR Flash. If you 
don't have configured NAND, the decicions (NAND or NOR) are replaced by a 
straight call to NOR functions.
-- 
Thomas
___________________________________
autronix automation GmbH
http://www.autronix.de gleixner@autronix.de
