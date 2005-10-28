Received: from milvb95a.icn.siemens.it ([83.103.117.137])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EVS2Y-0003Ki-L2
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2005 07:05:32 -0400
Message-ID: <69DF49BE936F4441980EC1D59F0ADC2F0108B474@aqlby02a.siemens.it>
From: Sette Agostino <Agostino.Sette@siemens.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 28 Oct 2005 13:04:45 +0200
MIME-Version: 1.0
Content-Type: text/plain
Subject: TQM859 fault report
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

 

It has been verified that inhibiting the burst access to SDRAM on the TQM859
faulty module the file system un-compression  task do not signals error at
the bootstrap.

 The effect of the burst inhibit is an increasing of the time duration of
the accesses in the SDRAM and then an overall system performance slow-down,
a similar effect it is obtained by slowing-down the uProcessor frequency.

 

Tracking with a HP16602 Bus Analyzer the bus activities of the faulty module
has been verified that the interrupt service routine of the Decrementer
timer, that I suppose to be used to generate the 

OS time tick, it is not executed each 10ms.

 

Sometimes the period between 2 Decrementer interrupt service routines reach
hundreds of ms (but even as 10mS multiple) such as some requests are
missing. 

 Making same tracking on a TQM866 module it has been verified that the
interrupt service routines of the Decrementer timer are all executed at the
exact 10ms boundary.

 

Do you have any suggestion about this problem?

 

Thanks in advance.

 

Ciao

Agostino Sette
