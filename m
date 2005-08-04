Received: from bay106-f7.bay106.hotmail.com ([65.54.161.17] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E0iCD-00061R-Gk
	for linux-mtd@lists.infradead.org; Thu, 04 Aug 2005 17:05:00 +0100
Message-ID: <BAY106-F70B209A055ACC675323AA98C40@phx.gbl>
In-Reply-To: <1123155351.26146.112.camel@tglx.tec.linutronix.de>
From: "Nathan H." <n_8_10@hotmail.com>
To: tglx@linutronix.de
Date: Thu, 04 Aug 2005 09:54:41 -0600
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: Mask error in nandbase.c: nand_scan(): oob_size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>Please look into
>
>http://www.samsung.com/Products/Semiconductor/Flash/NAND/16Gbit/K9WAG08U1M/ds_k9wag08u1m_rev02.pdf
>
>to see why the bits are reserved are why they are guaranteed to be zero.

I understand that currently the extra bit is going to be zero, but that bit 
is part of a completely different field. Someday one of those reserved 
values may be used at which point things will break. The fact is that the 
field is 1-bit wide and thus the mask should be 0x1 not 0x3.

>No error to see here :)

See no evil, hear no evil, eh? ;)

-Nathan
