Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CRnW2-0002G3-IR
	for linux-mtd@lists.infradead.org; Wed, 10 Nov 2004 03:07:43 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: zheng wei <jeanwelly@gmail.com>
In-Reply-To: <c2bc1f404110918284099b516@mail.gmail.com>
References: <c2bc1f404110918284099b516@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 10 Nov 2004 08:59:13 +0100
Message-Id: <1100073553.3405.24.camel@thomas>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: which MTD version contains the CONFIG_YAFFS_USE_NANDECC
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-11-10 at 10:28 +0800, zheng wei wrote:
> I want to update my MTD driver.
> Which MTD version contains NAND support for YAFFS?
> Thank you!
> 
CONFIG_YAFFS_USE_NANDECC is a config option of YAFFS and is not in MTD.
YAFFS works of latest MTD code

tglx
