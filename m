Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnWN4-0002ol-EH
 for linux-mtd@lists.infradead.org; Thu, 22 May 2014 17:01:35 +0000
Date: Thu, 22 May 2014 19:01:08 +0200
From: Gerhard Sittig <gsi@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 0/3] mtd: nand: introduce a READMODE command
Message-ID: <20140522170108.GQ22644@book.gsilab.sittig.org>
References: <1396611948-4523-1-git-send-email-gsi@denx.de>
 <20140414185541.GW3528@book.gsilab.sittig.org>
 <20140505132903.GP2821@book.gsilab.sittig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140505132903.GP2821@book.gsilab.sittig.org>
Cc: David Mosberger <davidm@egauge.net>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Pekon Gupta <pekon@ti.com>,
 Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-05-05 at 15:29 +0200, Gerhard Sittig wrote:
> 
> On Mon, 2014-04-14 at 20:55 +0200, Gerhard Sittig wrote:
> > 
> > On Fri, 2014-04-04 at 13:45 +0200, Gerhard Sittig wrote:
> > > 
> > > this series does some minor cleanup in nand_command_lp() and then
> > > introduces a NAND_CMD_READMODE opcode which is similar to the existing
> > > NAND_CMD_READ0 but does not imply NAND_CMD_READSTART
> > > 
> > > such a READMODE command is useful in preparation of the pending
> > > introduction of on-die-ECC support
> > 
> > Are there any concerns left that I should address?
> 
> There have been two good weeks without further comments, and an
> ACK from Gupta Pekon.  Can the series get applied?  Should I
> re-submit with the ACK?

Are there any remaining concerns that I shall address?  Can the
series get picked up?  Shall I re-send?  Thank you for checking!


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
