Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BaCwR-00035Z-7S
	for linux-mtd@lists.infradead.org; Tue, 15 Jun 2004 08:21:28 -0400
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004061508315806837
	for <linux-mtd@lists.infradead.org>; Tue, 15 Jun 2004 08:31:58 -0400
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351812B8@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Tue, 15 Jun 2004 08:23:09 -0400
MIME-Version: 1.0
Content-Type: text/plain
Subject: DOC Mil Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I know others have started working on getting drivers for the DOC Mil Plus
chip integrated into the nand/inftl subsystem.  I was going to try to look
at the task and see if I could get a understanding on what must be done and
start some of it.  I have been looking at the doc2001plus code in the
devices dir.  Should I be moving those functions or creating similar in the
nand dir?  Should I use diskonchip to init the mtd_info struct so as to use
the disk on chip calls?  I was wanting to try to get started on this so I
can put a file system on my development board.  Can the code in the devices
dir be used directly or does that violated any licensing rules?   

  One more question, is if the code in doc2001plus complete or is there
functionality that still needs to be completed?  

Thanks
John
