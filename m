Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BbJsA-0008Db-0p
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2004 09:57:39 -0400
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004061810081603498
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jun 2004 10:08:16 -0400
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351812BD@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Fri, 18 Jun 2004 09:59:15 -0400
MIME-Version: 1.0
Content-Type: text/plain
Subject: AN added note....
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I think that my problem is or part of it is that I am not getting the proper
methods assigned to the nand_chip structure so it can be passed to the INFTL
subsystem.  My assumption is that the methods in nand_chip are the ones used
by INFTL.  The methods assigned to the mtd_info are not the ones called by
INFTL and mtdcore subsystem.  Am I correct in this assumption?????????????

John 
