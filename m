Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JRUa8-0005W8-K9
	for linux-mtd@lists.infradead.org; Tue, 19 Feb 2008 15:40:33 +0000
Date: Wed, 20 Feb 2008 00:40:52 +0900 (JST)
Message-Id: <20080220.004052.11965069.anemo@mba.ocn.ne.jp>
To: ricard.wanderlof@axis.com
Subject: Re: at91_nand question
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <Pine.LNX.4.64.0802181701090.3508@lnxricardw.se.axis.com>
References: <20080219.004337.74388852.anemo@mba.ocn.ne.jp>
	<Pine.LNX.4.64.0802181701090.3508@lnxricardw.se.axis.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: andrew@sanpeople.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 18 Feb 2008 17:02:40 +0100 (CET), Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
> > Though it seems work fine as is, I wonder keeping chipselect signal
> > low all the time is normal.
> 
> I think it is necessary for some flash chips. E.g. to erase, one cannot 
> just issue an erase command and make NCE go inactive, as making NCE go 
> inactive stops the erase procedure until asserted again.

Do you mean busy period between erase command and read-status command?
The nand framework does not try to inactivte NCE for that period.

I'm wondering why at91_nand keeps NCE active after all bus operation
are done.

---
Atsushi Nemoto
