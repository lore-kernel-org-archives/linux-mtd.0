Date: Tue, 29 Jul 2008 08:52:43 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: roblems in nand_read_subpage()
In-Reply-To: <1217313233.3124.4.camel@sauron>
Message-ID: <alpine.LFD.1.10.0807290851200.12605@casper.infradead.org>
References: <1217313233.3124.4.camel@sauron>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="1985284609-1244030607-1217317964=:12605"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1985284609-1244030607-1217317964=:12605
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT

Hi Artem,

Thank you very much for pointing to the issue. Sure. I'll fix it today. 

> Hi Alexey,
> 
> I found out that nand_read_subpage is using the NAND_CMD_RNDOUT
> command even on small page NANDs, where this command simply does
> not exist. Your patch has been merged into mainline. Could you
> please fix this?
> 
> -- 
> Best regards,
> Artem Bityutskiy (Битюцкий Артём)
> 
> 
--1985284609-1244030607-1217317964=:12605--
