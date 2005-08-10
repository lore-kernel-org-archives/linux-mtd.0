Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E2yIJ-00031C-38
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2005 17:39:32 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Charles Manning <manningc2@actrix.gen.nz>
In-Reply-To: <200508110808.15354.manningc2@actrix.gen.nz>
References: <42F8DCBD.2020407@sgi.com>
	<1123630395.21933.135.camel@tglx.tec.linutronix.de>
	<200508110808.15354.manningc2@actrix.gen.nz>
Content-Type: text/plain
Date: Wed, 10 Aug 2005 21:38:47 +0000
Message-Id: <1123709927.7305.13.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Steven Hein <ssh@sgi.com>
Subject: Re: Erasing NAND bad blocks?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-08-11 at 08:08 +1200, Charles Manning wrote:
> As this comes around often wrt YAFFS1, I think there are two things that can 
> be done in YAFFS to help address the issue:
> 1) Make the bad block marker used in YAFFS1 something that is easy to 
> recognise (eg. 'Y' ) instead of 0x00. That way it should be easy to recognise 
> yaffs -vs- factory marked bad blocks.
> 2) Add a config in yaffs to not do any bad block marking during board bring 
> up.

2) is the safe way, but it should be blocked in the MTD/NAND layer to
protect all fs developers from the usual complaints resulting from "try
and error bring up"

tglx
