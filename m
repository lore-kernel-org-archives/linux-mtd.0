Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ft66z-0004A9-J4
	for linux-mtd@lists.infradead.org; Wed, 21 Jun 2006 18:03:32 +0100
Subject: Re: [PATCH] [NAND] S3C2410 convert prinks to dev_*()s
From: Thomas Gleixner <tglx@linutronix.de>
To: Ben Dooks <ben-linux@fluff.org>
In-Reply-To: <20060621144305.GA4207@home.fluff.org>
References: <20060621144305.GA4207@home.fluff.org>
Content-Type: text/plain
Date: Wed, 21 Jun 2006 19:04:47 +0200
Message-Id: <1150909487.25491.11.camel@localhost.localdomain>
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

On Wed, 2006-06-21 at 15:43 +0100, Ben Dooks wrote:
> Convert the use of printk() to the correct dev_info/dev_err
> functions
> 
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>

Thanks for the almost perfect patch :)

[PATCH] [MTD] NAND: S3C2410 convert prinks to dev_*()s

The mail filter sorts out the [PATCH] mails. My git-wrapper removes the
leading [PATCH] so I get the format which we used in CVS already:

[MTD] NAND: S3C2410 convert prinks to dev_*()s

Thanks,

	tglx
