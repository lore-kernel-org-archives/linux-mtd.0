Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUzPD-0002qO-6Z
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 14:11:11 +0000
Date: Tue, 1 Apr 2014 16:10:35 +0200
From: Gerhard Sittig <gsi@denx.de>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v1 3/3] mtd: nand: introduce a READMODE command
Message-ID: <20140401141035.GR2775@book.gsilab.sittig.org>
References: <1396100184-7110-1-git-send-email-gsi@denx.de>
 <1396100184-7110-4-git-send-email-gsi@denx.de>
 <20980858CB6D3A4BAE95CA194937D5E73EABA0E1@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EABA0E1@DBDE04.ent.ti.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-04-01 at 06:56 +0000, Gupta, Pekon wrote:
> 
> Hi Gerhard,
> 
> >From: Gerhard Sittig [mailto:gsi@denx.de]
> >
> >the nand_command_lp() implementation derives a "READPAGE" sequence from
> >a passed in READ0 opcode, i.e. emits a sequence of READ0 _and_ READSTART
> >commands in this case
> >
> >introduce a "READMODE" command which sends the READ0 opcode to the chip
> >exclusively and doesn't send the READSTART opcode
> >
> >such a "READMODE" command is useful in the context of on-die-ECC support
> >where a sequence of READ0, READSTART, STATUS, READ0 is required; having
> >support for READMODE in the common nand_command_lp() routine avoids the
> >need for duplication and open coded cmd_ctrl() calls
> >
> >[ ... ]
> 
> Thanks. This should help 'David Mosberger <davidm@egauge.net>' patches.
> I think, NAND_CMD_READMODE should also be added to nand_command(), right ?  

Oh, that has slipped my attention.  I'll wait a few more days for
feedback, and update the series to support READMODE in both the
nand_command() as well as nand_command_lp() variants.  Callers
should not mind which one is the registered cmdfunc() callback.

> With that please feel free to apply ..
> Acked-by: Pekon Gupta <pekon@ti.com>

thank you, both for looking and for the ACK


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
