Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DAwq8-0003tW-Bq
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2005 16:11:05 -0500
Message-ID: <4235FDE4.6080701@ieee.org>
Date: Mon, 14 Mar 2005 16:11:00 -0500
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: Matt Garratt <m.garratt@adfa.edu.au>
References: <HMEGLJJFEGIOMNFLAPOFEEAMCEAA.m.garratt@adfa.edu.au>
In-Reply-To: <HMEGLJJFEGIOMNFLAPOFEEAMCEAA.m.garratt@adfa.edu.au>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bad black table not found
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Matt Garratt wrote:
> When my computer boots, I get the following messages that concern me
> regarding the DOC2000. Are these something I should worry about and if so,
> is there anything that can be done to fix?
> 
> Bad Block Table not found for chip 0
> Bad Block Table not found for chip 0

I assume you're using the new NAND-based diskonchip driver.  This driver 
uses a BBT scheme which is slightly different from the one used by 
M-Systems.  (Specifically:  it preserves the MSystems BBT but adds a 
backup BBT).  The messages you are seeing indicate that we haven't found 
this "Linux-specific" BBT table.  This is completely normal.

To avoid filesystem corruption, the diskonchip driver won't create the 
BBT tables it wants unless you give it permission, using either a config 
option (MTD_NAND_DISKONCHIP_BBTWRITE) or a module load parameter 
(inftl_bbt_write).  See the config help for more info.

When the Linux-specific BBT table is created, it is marked as reserved, 
so the MSystems tools won't touch it and won't be bothered by it.

> INFTL: corrupt block 4087 in chain 4087, chain length 0, erase mark 0x0?
> INFTL: formating chain at block 4087
> INFTL: formatting block 4087
> nand_erase: Failed erase, page 0x0001fee0
> INFTL: error while formatting block 4087
> INFTL: cannot calculate a geometry to match size of 0x6d5c0
> INFTL: using C:999 H:16 S:28 (==0x6d440 sects)

I can't help you with these messages -- I've never actually used INFTL.

	-Dan
