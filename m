Received: from mail-fx0-f210.google.com ([209.85.220.210])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NdRcD-0002wc-OA
	for linux-mtd@lists.infradead.org; Fri, 05 Feb 2010 17:05:14 +0000
Received: by fxm2 with SMTP id 2so1274486fxm.31
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 Feb 2010 09:05:07 -0800 (PST)
Subject: Re: [PATCH 13/17] MTD: export few functions from nand_base.c
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: "stanley.miao" <stanley.miao@windriver.com>
In-Reply-To: <4B6B8338.5060608@windriver.com>
References: <1265326257-4446-1-git-send-email-maximlevitsky@gmail.com>
	<1265326257-4446-14-git-send-email-maximlevitsky@gmail.com>
	<4B6B8338.5060608@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 05 Feb 2010 19:05:04 +0200
Message-ID: <1265389504.18186.4.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alex Dubov <oakad@yahoo.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	joern <joern@logfs.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-02-05 at 10:32 +0800, stanley.miao wrote: 
> Maxim Levitsky wrote:
> > This exports:
> >
> > nand_do_read_oob
> > nand_do_write_oob
> >   
> 
> nand_do_read_oob and nand_do_write_oob can't be exported. They are internal
> functions in NAND subsystem. If you want use them, please use mtd->read_oob
> and mtd->write_oob.
> 
> Stanley.
> 
> > nand_get_device
> > nand_put_device
> >
> > This functions will be used to implement custom oob based
> > bad block handling in upcoming smartmedia common module
> >

Actually I don't like this patch ether.

The problem is that nand_erase_nand first takes the lock, and then calls
the ->block_bad.

I could make the ->block_bad always take the lock (and this will allow
using ->read_oob) by first checking that all erase blocks are good, and
then doing the erase.
This would change the behavior slightly (Now if you attempt to erase
several erase blocks and one of them is marked as bad, erase stops at
first bad block. With the change, erase will fail completely.
Is this ok?

Best regards,
Maxim Levitsky
