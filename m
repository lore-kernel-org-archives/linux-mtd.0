Received: from mba.ocn.ne.jp ([122.28.14.163] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MSY5s-0008ET-JF
	for linux-mtd@lists.infradead.org; Sun, 19 Jul 2009 15:14:33 +0000
Date: Mon, 20 Jul 2009 00:14:26 +0900 (JST)
Message-Id: <20090720.001426.102579925.anemo@mba.ocn.ne.jp>
To: dbaryshkov@gmail.com
Subject: Re: abuse of nand_correct_data in tmio_nand driver
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20090719001127.GA6449@doriath.ww600.siemens.net>
References: <20090714.230503.162167450.anemo@mba.ocn.ne.jp>
	<20090719001127.GA6449@doriath.ww600.siemens.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 19 Jul 2009 04:11:27 +0400, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> wrote:
> > The current nand_correct_data() can be used for ecc.bytes = 3 case
> > only.  The tmio_nand driver uses ecc.bytes = 6.
> 
> IIRC, tmio_nand driver accesses two ecc "sectors" at once, so this is
> most probably ok. I'll look into it though, when I have some time.

Yes, tmio_nand driver read 512 byte data and calculate 6 byte ecc at
once, but nand_correct_data only references first 3 byte of ecc.

I doubt the driver cannot detect errors in the second 256 byte sector
of the 512 byte block.

---
Atsushi Nemoto
