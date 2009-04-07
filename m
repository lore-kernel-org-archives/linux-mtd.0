Received: from smtp121.sbc.mail.sp1.yahoo.com ([69.147.64.94])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LrKP0-00007t-G2
	for linux-mtd@lists.infradead.org; Tue, 07 Apr 2009 23:08:40 +0000
From: David Brownell <david-b@pacbell.net>
To: Thomas Gleixner <tglx@linutronix.de>,
	"Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
Subject: Re: [PATCH] MTD-NAND: Changes to read_page APIs to support
	NAND_ECC_HW_SYNDROME mode on TI DaVinci DM355
Date: Tue, 7 Apr 2009 16:08:18 -0700
References: <1238601784-9563-1-git-send-email-nsnehaprabha@ti.com>
	<7A436F7769CA33409C6B44B358BFFF0CFFAA9253@dlee02.ent.ti.com>
	<alpine.LFD.2.00.0904072123320.21577@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.00.0904072123320.21577@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904071608.19123.david-b@pacbell.net>
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 07 April 2009, Thomas Gleixner wrote:
> What you need is a NAND_ECC_HW_OOB_FIRST mode, which uses the
> NAND_ECC_HW write function and implements a separate read function
> which reads the oob and then reads the data chunks.

That sounds about right, and it should address the issues
I raised earlier in this thread.

Though I might name it differently.  Reason being that the
"read OOB first" bit is only needed when there's more than
one ecc.step ... small page chips won't need it.  Maybe it
would suffice to map that mode to ECC_HW in those cases.

- Dave
