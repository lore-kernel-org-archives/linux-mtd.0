Received: from lorica.ucc.usyd.edu.au ([129.78.64.15])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 152Qca-0005g4-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 May 2001 05:51:48 +0100
Received: from heroditus (mridley@pc-180.acfr.usyd.edu.au [129.78.210.180])
	by lorica.ucc.usyd.edu.au (8.9.3/8.9.3) with SMTP id OAA07990
	for <linux-mtd@lists.infradead.org>; Wed, 23 May 2001 14:55:47 +1000 (EST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Matthew Ridley <m.ridley@acfr.usyd.edu.au>
To: linux-mtd@lists.infradead.org
Subject: Ampro P5e and DOC2000
Date: Wed, 23 May 2001 14:53:29 +1000
MIME-Version: 1.0
Message-Id: <01052314532904.01143@heroditus>
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Does anyone have any hot tips and suggestions for using this particular setup.
The DOC & system bios are shared in the same NAND flash so frequent trashing 
of the bios occurs (when you don't read the instructions)

However the linux driver detects a DOC at 0xFFFFe000, which in actual fact is 
where the system bios is supposedly stored. It detects another elsewhere too.

When I find time I will read into it more, but in the meantime has anyone 
figured this one all out yet ?
