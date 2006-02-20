Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBDBH-0000Yu-Ax
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 10:42:42 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Andrew Victor <andrew@sanpeople.com>
In-Reply-To: <1140447277.1638.63.camel@fuzzie.sanpeople.com>
References: <1140447277.1638.63.camel@fuzzie.sanpeople.com>
Content-Type: text/plain
Date: Mon, 20 Feb 2006 16:43:28 +0100
Message-Id: <1140450208.2480.730.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND driver for AT91RM9200
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-02-20 at 16:54 +0200, Andrew Victor wrote:
> Could it please be reviewed for addition to the MTD CVS / mainline
> kernels.  Thanks.

Please remove the duplicated command functions. There is no need for
them at all. The address modifications of this->IO_ADDR_W in the
hwcontrol function are sufficient.

	tglx
