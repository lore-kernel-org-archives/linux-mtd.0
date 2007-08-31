Received: from mail.ku-gbr.de ([81.3.11.18] helo=ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IR8Te-0008Ov-B4
	for linux-mtd@lists.infradead.org; Fri, 31 Aug 2007 11:32:12 -0400
Date: Fri, 31 Aug 2007 17:31:32 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Subject: Re: Quad Die NAND Chip with 16Gb
Message-ID: <20070831153132.GA27851@z1.synertronixx>
References: <20070831150443.GA10808@anita.doom>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070831150443.GA10808@anita.doom>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replying to myself *mumblegrumble*

I am trying to picture of NAND code and tried this: Why can't I access
the one or the other half of the device?

Platform Setup:

static struct scb9xxx_nand_pdata __initdata nand_pdata = {
        .ce1            = CPLD_NAND_CE2,
        .ale            = CPLD_NAND_ALE,
        .cle            = CPLD_NAND_CLE,
        .rdy            = CPLD_NAND_RYBY,
        .partition_info = nand_partitions,
};

For .ce1 I put CPLD_NAND_CE1 or CPLD_NAND_CE2 and booting yields in seeing
the one or the other half of the device. 
Hardware feels well, so how does stupid konste merge these halfes?
Or could they be accessed as two different mtdblockX as an alternative?

Konsti


-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
