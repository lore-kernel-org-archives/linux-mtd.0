Received: from mba.ocn.ne.jp ([122.28.14.163] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWfWn-0001DB-3y
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 23:59:21 +0000
Date: Fri, 31 Jul 2009 08:54:11 +0900 (JST)
Message-Id: <20090731.085411.165857784.anemo@mba.ocn.ne.jp>
To: ian@mnementh.co.uk, spyro@f2s.com
Subject: Re: [PATCH 2/2] mtd/nand: Fix tmio_nand ecc correction
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <4A6F3188.7070000@f2s.com>
References: <1248792792-20197-2-git-send-email-anemo@mba.ocn.ne.jp>
	<4A6F3188.7070000@f2s.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: dbaryshkov@gmail.com, dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	vimal.newwork@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 28 Jul 2009 18:12:40 +0100, Ian molton <spyro@f2s.com> wrote:
> This looks fine to me, but as I said, wouldnt it be better to implement 
> the 6-byte ecc in the core if theres more than one chip that can use it?
> 
> no point in duplicating code...

Yes, but I wonder how popular 6-byte ecc per 512 byte block compared
to other combinations.  For now, keep tmio_nand_correct_data in
tmio_nand driver would be reasonable.

If many (well, two might not be enough :-)) xxx_nand_correct_data do
same thing, we can refactor them easily.

---
Atsushi Nemoto
