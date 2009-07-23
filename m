Received: from smtp101.sbc.mail.gq1.yahoo.com ([67.195.15.60])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MU3w0-0005RM-2L
	for linux-mtd@lists.infradead.org; Thu, 23 Jul 2009 19:26:36 +0000
From: David Brownell <david-b@pacbell.net>
To: Troy Kisky <troy.kisky@boundarydevices.com>
Subject: Re: [PATCH V5 2/2] mtd: nand: Calculate better default ecc layout
Date: Thu, 23 Jul 2009 12:26:24 -0700
References: <1247789948-5764-1-git-send-email-troy.kisky@boundarydevices.com>
	<1247789948-5764-2-git-send-email-troy.kisky@boundarydevices.com>
	<4A68B683.5030503@boundarydevices.com>
In-Reply-To: <4A68B683.5030503@boundarydevices.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200907231226.24436.david-b@pacbell.net>
Cc: dedekind@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 23 July 2009, Troy Kisky wrote:
> What do you think of leaving nand_base totally alone
> and add a file nand_probe.h which contain the new
> routines marked as inline, or mark it __devinit or
> __init ? I don't think anyone but probe calls these
> functions.

You don't want those nand-core functions to be removed.
Drivers can be modular, and they need to call them.
