Received: from wsgw2.atc.army.mil ([134.194.13.56])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bawzt-0004MQ-Bn
	for linux-mtd@lists.infradead.org; Thu, 17 Jun 2004 09:32:07 -0400
Received: from atcml01.atc.army.mil ([134.194.25.206])
	by wsgw2.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004061709252624807
	for <linux-mtd@lists.infradead.org>; Thu, 17 Jun 2004 09:25:26 -0400
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351812B9@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Thu, 17 Jun 2004 09:33:44 -0400
MIME-Version: 1.0
Content-Type: text/plain
Subject: DOC Mil Plus 32 any work being done?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

  Is anyone actually working on getting support for the Millennium Plus 32M
chip.  I looked at the latest patch and unfortunately work on that chip
hasn't been added.  I have been trying to hack up the code but don't have
much knowledge in this area.  I am sure what I am doing is time ill spent
other then getting a small understanding of the problem.  I am doing a lot
of cut and paste to the diskonchip.c file.  I see where the nand_chip struct
gets filled and where in docprobe they fill the mtd_info struct with the
proper driver names.  Which struct is actually the proper one to use?
Should I be redoing the DoC functions so they will work in the nand_chip
struct with the proper arguments????  I am just trying to get this chip in a
usable state!!!!!

Thanks for any assistance that can be provided!
John
