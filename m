Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D0c6J-0006pB-He
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 04:01:04 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: kyungmin.park@samsung.com
In-Reply-To: <0IBW007DE84BOU@mmp1.samsung.com>
References: <0IBW007DE84BOU@mmp1.samsung.com>
Content-Type: text/plain
Date: Mon, 14 Feb 2005 10:00:52 +0100
Message-Id: <1108371652.16612.247.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>
Subject: Re: [RFC] adding support for OneNAND flash memory
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 2005-02-14 at 17:40 +0900, kyungmin park wrote:
> For this reason, I'd like to suggest adding another directory 
> (ex. drivers/mtd/onenand) to mtd source tree for supporting OneNAND 
> flash memory instead of modifying/extending existing nand framework.

This makes sense. I had a look into OneNAND datasheets some time ago and
I can only agree that it does not fit into the NAND driver. 

tglx
