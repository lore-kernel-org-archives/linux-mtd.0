Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D8Yw1-0004Jp-0G
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2005 02:15:17 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: extabe@bredband.net
In-Reply-To: <20050305125650.TCML1243.mxfep04.bredband.com@mxfep04>
References: <20050305125650.TCML1243.mxfep04.bredband.com@mxfep04>
Content-Type: text/plain; charset=utf-8
Date: Tue, 08 Mar 2005 08:15:03 +0100
Message-Id: <1110266103.29330.11.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Trying to get 1Gb Samsung nand flash working
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andre, 

please place your answers below the citation and configure your mail
client to break the lines at 80 chars. See also
http://www.infradead.org/~dwmw2/email.html

Thanks

On Sat, 2005-03-05 at 12:56 +0000, extabe@bredband.net wrote:
> The chip is a Samsung 1Gx8 Bit NAND Flash (K9W8G08U1M). It is 
> detected as a 512Mb chip (K9k4G08U0M) since it consist of two 
> K9k4G08U0M stacked.

Should work.

> I use 2.4.25 kernel patched with "mtd-snapshot-20050223"
> 
> The CVS $Id string is:
> $Id: nand_bbt.c,v1.31 2005/02/16 17:09:36 dedekind Exp $

There was a change in the bad block table code recently. I'm not sure if
it is relevant to your problem - it should not. I send you a patch
seperately to backout the changes. Please give it a try.

> As I mentioned erlier I´ve used a Samsung 64Mb chip (K9F1208U0M) 
> with the same driver and it´s working good.

This chip is a small page chip (512Byte + 16Byte oob) and therefor a
different thing.

Can I have a look on your board driver please ?

tglx
