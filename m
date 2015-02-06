Received: from mail-pd0-f175.google.com ([209.85.192.175])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJaD4-0007kU-79
 for linux-mtd@lists.infradead.org; Fri, 06 Feb 2015 04:08:02 +0000
Received: by pdjg10 with SMTP id g10so5945140pdj.1
 for <linux-mtd@lists.infradead.org>; Thu, 05 Feb 2015 20:07:40 -0800 (PST)
Date: Thu, 5 Feb 2015 20:07:36 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] mtd: denali: remove unnecessary stubs
Message-ID: <20150206040736.GH18140@ld-irv-0074>
References: <1421123357-27561-1-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1421123357-27561-1-git-send-email-yamada.m@jp.panasonic.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Josh Triplett <josh@joshtriplett.org>, linux-kernel@vger.kernel.org,
 "grmoore@altera.com" <grmoore@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 13, 2015 at 01:29:17PM +0900, Masahiro Yamada wrote:
> This driver uses NAND_ECC_HW_SYNDROME mode.  The nand_scan_tail()
> function would not complain about missing ecc->calculate,
> ecc->correct, ecc->hwctl handlers.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>

Pushed to l2-mtd.git. Thanks.

Brian
