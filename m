Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EFRMA-0008P8-D8
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2005 03:08:28 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
In-Reply-To: <BAY17-F15A89BAEF117B1219F73ACE89C0@phx.gbl>
References: <BAY17-F15A89BAEF117B1219F73ACE89C0@phx.gbl>
Content-Type: text/plain
Date: Wed, 14 Sep 2005 09:06:44 +0200
Message-Id: <1126681604.6509.223.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: A question about fsdata_pos and fsdata_len
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-09-13 at 18:24 +0800, zhao forrest wrote:
> 1 In jffs2_nand_set_oobinfo():
> c->fsdata_pos = oinfo->oobfree[0][0];
> c->fsdata_len = oinfo->oobfree[0][1];
> 2 In line 88 of nand_base.c
> static struct nand_oobinfo nand_oob_8 = {
> 	.useecc = MTD_NANDECC_AUTOPLACE,
> 	.eccbytes = 3,
> 	.eccpos = {0, 1, 2},
> 	.oobfree = { {3, 2}, {6, 2} }
> };
> so for this kind of NAND flash, c->fsdata_len is 2.
> 3 but in jffs2_write_nand_cleanmarker(), it's assumed that
> c->fsdata_len is at least 8
> n.totlen = cpu_to_je32(8);

If you look at the clean marker code in wbuf.c you will see, that the
code restricts itself to the available number of oob bytes. I would not
care much about the 256 Byte/Page NANDs as they are obsolete and not
longer available. The relevant chips are 512 resp 2048 Bytes/Page, where
you have 8/38 byte free in the oob area. 

We really should modify the oob read/write code to take another argument
to be capable of handling the scattered
AUTOPLACE byte positions rather than enforcing the caller (usually
filesystem) to deal with the raw oob. So the fs code has just to check
for the number of available bytes and read/write the oob data in/from a
contigous buffer. The modified read/write_oob does the scattering
into/from the autoplace information provided by the oob_info. 

tglx
