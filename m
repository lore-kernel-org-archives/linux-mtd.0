Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BXhT1-0003xP-5j
	for linux-mtd@lists.infradead.org; Tue, 08 Jun 2004 10:20:45 -0400
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004060810305430294
	for <linux-mtd@lists.infradead.org>; Tue, 08 Jun 2004 10:30:54 -0400
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351812B3@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Tue, 8 Jun 2004 10:22:14 -0400 
MIME-Version: 1.0
Content-Type: text/plain
Subject: Generic nand and DOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

  I have been trying to get my DOC Mil plus to work properly.  The code in
the devices dir that is M-sys specific seems to works for the chip but I
can't use nandwrite on the chip.  Am I to assume from the lists that the
goal is to stop using the code in the devices directory and use the generic
nand/inftl stuff to work for all devices?  The code for DoC_IdentChip is
very specific, is it the plan that nand_scan will replace the later?

  I have been taking time to try to understand the workings of the drivers
and want to make sure I have the correct big picture.

Thanks,
John
