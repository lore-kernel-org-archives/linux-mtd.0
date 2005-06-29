Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DnhdZ-0005FW-0X
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2005 14:50:18 -0400
Message-ID: <42C2ED66.3000909@ieee.org>
Date: Wed, 29 Jun 2005 14:50:14 -0400
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: Andrew Schultz <alschult@eecs.berkeley.edu>
References: <42C2E2CB.9030404@eecs.berkeley.edu>
In-Reply-To: <42C2E2CB.9030404@eecs.berkeley.edu>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Booting Linux 2.6 with DiskOnChip 2000 TSOP (INFTL)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew Schultz wrote:
> I tried docboot, but that hangs with "Opening Docboot..." and now 
> I can't boot anything off that chip.  Any experience (or even any 
> success stories) would be greatly appreciated.

DOCBoot seems to be broken, expect a fix momentarily.  You should be 
able to boot normally (ie, without DOCBoot) if you hold down the shift, 
control, or alt keys during BIOS startup.

	-Dan
