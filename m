Received: from fg-out-1718.google.com ([72.14.220.158])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MSK0B-0007wx-59
	for linux-mtd@lists.infradead.org; Sun, 19 Jul 2009 00:11:43 +0000
Received: by fg-out-1718.google.com with SMTP id l27so345429fgb.3
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Jul 2009 17:11:36 -0700 (PDT)
Date: Sun, 19 Jul 2009 04:11:27 +0400
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: abuse of nand_correct_data in tmio_nand driver
Message-ID: <20090719001127.GA6449@doriath.ww600.siemens.net>
References: <20090714.230503.162167450.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090714.230503.162167450.anemo@mba.ocn.ne.jp>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Jul 14, 2009 at 11:05:03PM +0900, Atsushi Nemoto wrote:
> Hi.  I found tmio_nand driver abuses nand_correct_data.
> 
> The current nand_correct_data() can be used for ecc.bytes = 3 case
> only.  The tmio_nand driver uses ecc.bytes = 6.

IIRC, tmio_nand driver accesses two ecc "sectors" at once, so this is
most probably ok. I'll look into it though, when I have some time.

-- 
With best wishes
Dmitry
