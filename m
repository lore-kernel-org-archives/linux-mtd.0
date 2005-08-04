Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E0dwE-000354-9F
	for linux-mtd@lists.infradead.org; Thu, 04 Aug 2005 07:31:13 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: "Nathan H." <n_8_10@hotmail.com>
In-Reply-To: <BAY106-F1441981113829DBB9BB23B98C50@phx.gbl>
References: <BAY106-F1441981113829DBB9BB23B98C50@phx.gbl>
Content-Type: text/plain
Date: Thu, 04 Aug 2005 13:35:51 +0200
Message-Id: <1123155351.26146.112.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Mask error in nandbase.c:  nand_scan(): oob_size
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-08-03 at 15:35 -0600, Nathan H. wrote:

> The code line should be:
> mtd->oobsize = (8 << (extid & 0x01)) * (mtd->oobblock / 512);
>                                                        ^fix
> 
> Reference:  Page 31 (Table: 4th ID Data)
> http://www.samsung.com/Products/Semiconductor/Flash/NAND/2Gbit/K9F2G08U0M/ds_k9f2gxxu0m_rev10.pdf

Please look into 

http://www.samsung.com/Products/Semiconductor/Flash/NAND/16Gbit/K9WAG08U1M/ds_k9wag08u1m_rev02.pdf

to see why the bits are reserved are why they are guaranteed to be zero.

No error to see here :)

tglx
