Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19O1wn-0001Q2-6q
	for <linux-mtd@lists.infradead.org>; Thu, 05 Jun 2003 22:06:57 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: Pantelis Antoniou <panto@intracom.gr>, tglx@linutronix.de
Date: Fri, 6 Jun 2003 09:10:08 +1200
References: <3EDB2F4E.6050502@intracom.gr>
	<200306042016.01366.tglx@linutronix.de> <3EDEF1D7.9030700@intracom.gr>
In-Reply-To: <3EDEF1D7.9030700@intracom.gr>
MIME-Version: 1.0
Message-Id: <20030605210731.4E663157C7@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: NAND write verify failed problem -->cramfs
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> BTW, is there something anologous to CRAMFS for NAND flash?
> I have a need for a compressed read-only filesystem on NAND
> but CRAMFS has no concept of bad blocks.

You could use loop mounting. ie. store the CRAMFS  image using a normal NAND 
file system (YAFFS or JFFS2) and loop mount it with cramfs.

-- CHarles
