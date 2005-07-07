Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DqWHE-0008Hl-Py
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2005 09:18:56 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Ruediger Haertel <hae@port.de>
In-Reply-To: <200507071505.51557.hae@port.de>
References: <200507061745.18226.hae@port.de> <200507071505.51557.hae@port.de>
Content-Type: text/plain
Date: Thu, 07 Jul 2005 15:21:52 +0200
Message-Id: <1120742513.26713.106.camel@tglx.tec.linutronix.de>
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

On Thu, 2005-07-07 at 15:05 +0200, Ruediger Haertel wrote:
> For the NAND DiskOnChip driver I had to apply the patch mentioned here:
> http://lists.infradead.org/pipermail/linux-mtd/2004-October/010640.html
> 

> What irritates me is the output: 
> DiskOnChip BNAND Media Header not found.
> 
> Why is that ?

Obviously the header is not at the expected place.


> />nanddump /dev/mtd5 /var/xxx 0 128
> MTD_open
> MTD_ioctl
> Unknown flash (not normalM NAND)

Is this nanddump from latest MTD-CVS ?

tglx
