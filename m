Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DqWsj-0000RA-6i
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2005 09:57:38 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Ruediger Haertel <hae@port.de>
In-Reply-To: <200507071532.17991.hae@port.de>
References: <200507061745.18226.hae@port.de> <200507071505.51557.hae@port.de>
	<1120742513.26713.106.camel@tglx.tec.linutronix.de>
	<200507071532.17991.hae@port.de>
Content-Type: text/plain
Date: Thu, 07 Jul 2005 16:00:38 +0200
Message-Id: <1120744838.26713.111.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD/ DoC Millenium Plus - Failure in flash detection
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-07-07 at 15:32 +0200, Ruediger Haertel wrote:
> So from your point the other messages from my output are ok ?
> 
> nand_read_ecc: Failed ECC read, page 0x00000020 on chip 0
> ECC error scanning DOC at 0x4000
> nand_read_ecc: Failed ECC read, page 0x00000040 on chip 0
> ECC error scanning DOC at 0x8000
> nand_read_ecc: Failed ECC read, page 0x00000060 on chip 0
> ECC error scanning DOC at 0xc000
> doc200x_correct_data corrected 2 errors
> nand_read_ecc: Failed ECC read, page 0x00000080 on chip 0
> ECC error scanning DOC at 0x10000

Thats a known error, which is not a problem

For whatever reasons the first page is written without ECC, so the ECC
check fails, but data is returned correctly

tglx
