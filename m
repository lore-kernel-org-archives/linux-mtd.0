Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H68j1-0003XZ-Ip
	for linux-mtd@lists.infradead.org; Sun, 14 Jan 2007 12:00:58 -0500
Subject: Re: What is ANAND header?
From: Thomas Gleixner <tglx@linutronix.de>
To: Seongsu Lee <senux@senux.com>
In-Reply-To: <20070113063629.GA13015@pooky.senux.com>
References: <20070113063629.GA13015@pooky.senux.com>
Content-Type: text/plain
Date: Sun, 14 Jan 2007 18:07:00 +0100
Message-Id: <1168794421.2941.70.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2007-01-13 at 15:36 +0900, Seongsu Lee wrote:
> I want to use NFTL to mount the flash memory by FAT filesystem.
> 
> But NFTL does not work for me. I found that MTD failed to
> find boot record in nftlmount.c source.

NFTL is only for M-Systems DiskOnChip devices. It can not be used on
bare NAND chips.

	tglx
