Received: from mba.ocn.ne.jp ([122.28.14.163] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MVnUB-00063i-SA
	for linux-mtd@lists.infradead.org; Tue, 28 Jul 2009 14:17:00 +0000
Date: Tue, 28 Jul 2009 23:11:56 +0900 (JST)
Message-Id: <20090728.231156.126763891.anemo@mba.ocn.ne.jp>
To: ian@mnementh.co.uk, spyro@f2s.com
Subject: Re: abuse of nand_correct_data in tmio_nand driver
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <4A6F03B1.6090200@f2s.com>
References: <20090714.230503.162167450.anemo@mba.ocn.ne.jp>
	<20090719001127.GA6449@doriath.ww600.siemens.net>
	<4A6F03B1.6090200@f2s.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: dbaryshkov@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 28 Jul 2009 14:57:05 +0100, Ian molton <spyro@f2s.com> wrote:
> >> The current nand_correct_data() can be used for ecc.bytes = 3 case
> >> only.  The tmio_nand driver uses ecc.bytes = 6.
> > 
> > IIRC, tmio_nand driver accesses two ecc "sectors" at once, so this is
> > most probably ok. I'll look into it though, when I have some time.
> 
> Are we really the only chip that does this?

TXx9 NDFMC can read 6 byte ECC (for two 256 byte sectors) at a time.
I will try to see if doing it increase performance or not.

---
Atsushi Nemoto
