Received: from mail.ku-gbr.de ([81.3.11.18] helo=ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IR83E-000818-HC
	for linux-mtd@lists.infradead.org; Fri, 31 Aug 2007 11:04:53 -0400
Received: from dslb-082-083-048-079.pools.arcor-ip.net ([82.83.48.79]:49324
	helo=localhost)
	by mail.ku-gbr.de with esmtpsa (Exim 4.50 #1 (Debian))
	id 1IR83A-0006OR-M5
	for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2007 17:04:44 +0200
Received: from anita ([10.10.0.18] helo=anita.doom)
	by localhost with esmtp (Exim 4.67) (envelope-from <lists@ku-gbr.de>)
	id 1IR83B-0005C7-2L
	for linux-mtd@lists.infradead.org; Fri, 31 Aug 2007 17:04:45 +0200
Received: from konsti by anita.doom with local (Exim 4.67)
	(envelope-from <lists@ku-gbr.de>) id 1IR839-0002p4-Ej
	for linux-mtd@lists.infradead.org; Fri, 31 Aug 2007 17:04:43 +0200
Date: Fri, 31 Aug 2007 17:04:43 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Subject: Quad Die NAND Chip with 16Gb
Message-ID: <20070831150443.GA10808@anita.doom>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Folks!

Actually I am trying to pimp our NAND driver which already supports
Micron MT29Fxx Chips very well. The last incarnation of these has quad
die and two CE lines, namely CE1 and CE2.

The driver accesses the first two dies by speaking to a CPLD an whenever
Bit0 is accessed it asserts CE1 of NAND, when Bit1 is accessed it
asserts CE2.

#define CPLD_NAND_CE1  0x01 /* Chip Enable1 to NAND Flash */
#define CPLD_NAND_CE2  0x02 /* Chip Enable2 to NAND Flash */
#define CPLD_NAND_ALE  0x04 /* Address Latch Enable to NAND Flash */
#define CPLD_NAND_CLE  0x08 /* Command Latch Enable to NAND Flash */
#define CPLD_NAND_RYBY 0x20 /* RY/BY# input from NAND Flash */

My question is now (as I am not familiar with the driver), how I
implement this doubling of capacitiy into the driver. Where can I best
do this? 
I mean where is the best point of code to kind of double the structures?
has anybody done something like this before?

The driver is at http://www.ludenkalle.de/nand/scb9xxx.c and is adapted
from the other nand drivers there. 

May be somebody has some advices for me :-/

Kind regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
