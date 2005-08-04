Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E0iOZ-0006fQ-9h
	for linux-mtd@lists.infradead.org; Thu, 04 Aug 2005 12:18:04 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: "Nathan H." <n_8_10@hotmail.com>
In-Reply-To: <BAY106-F70B209A055ACC675323AA98C40@phx.gbl>
References: <BAY106-F70B209A055ACC675323AA98C40@phx.gbl>
Content-Type: text/plain
Date: Thu, 04 Aug 2005 18:21:09 +0200
Message-Id: <1123172469.26146.178.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Mask error in nandbase.c: nand_scan(): oob_size
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-08-04 at 09:54 -0600, Nathan H. wrote:
> >Please look into
> >
> >http://www.samsung.com/Products/Semiconductor/Flash/NAND/16Gbit/K9WAG08U1M/ds_k9wag08u1m_rev02.pdf
> >
> >to see why the bits are reserved are why they are guaranteed to be zero.
> 
> I understand that currently the extra bit is going to be zero, but that bit 
> is part of a completely different field. Someday one of those reserved 
> values may be used at which point things will break. The fact is that the 
> field is 1-bit wide and thus the mask should be 0x1 not 0x3.

Sorry. The field is 2 (two) bits wide for _ANY_ FLASH which supports the
extended ID. The code looks at bit 0 and bit 1 of 4th ID data. Why do
you insist that it is a 1-bit field ?

>From the datasheet you referred to

        I/O1  I/O0
1K       0      0
2k       0      1
reserved 1      0
reserved 1      1

>From the datasheet I referred to

        I/O1  I/O0
1K       0      0
2k       0      1
4k       1      0
8k       1      1

> >No error to see here :)
> 
> See no evil, hear no evil, eh? ;)

I still do not see one :)

tglx
