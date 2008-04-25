Received: from rv-out-0708.google.com ([209.85.198.243]
	helo=rv-out-0506.google.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JpUvt-0002ll-3A
	for linux-mtd@lists.infradead.org; Fri, 25 Apr 2008 20:54:13 +0000
Received: by rv-out-0506.google.com with SMTP id b17so2041617rvf.42
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Apr 2008 13:54:08 -0700 (PDT)
Message-ID: <cd73a99e0804251354pbcde429jb86f9a02825e0358@mail.gmail.com>
Date: Fri, 25 Apr 2008 22:54:08 +0200
From: "Andrew Victor" <avictor.za@gmail.com>
To: "Atsushi Nemoto" <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH] at91_nand: control NCE signal
In-Reply-To: <20080424.235129.82088339.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080424.235129.82088339.anemo@mba.ocn.ne.jp>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi Atsushi,

> This driver did not control NCE signal during normal operations (only
>  enable NCE on probing and disable NCE on removing).  This patch make
>  NCE signal inactive on idle state.

It might be better to call the existing at91_nand_enable() and
at91_nand_disable() functions.
ie,
        if (ctrl & NAND_CTRL_CHANGE) {
                if (ctrl & NAND_NCE)
                        at91_nand_enable(host)
                else
                        at91_nand_disable(host);
        }


Regards,
  Andrew Victor
