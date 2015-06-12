Received: from mail-wi0-f170.google.com ([209.85.212.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z3NIt-0000WM-Hr
 for linux-mtd@lists.infradead.org; Fri, 12 Jun 2015 11:39:20 +0000
Received: by wigg3 with SMTP id g3so14609335wig.1
 for <linux-mtd@lists.infradead.org>; Fri, 12 Jun 2015 04:38:57 -0700 (PDT)
MIME-Version: 1.0
From: Roy Spliet <r.spliet@ultimaker.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linux MTD <linux-mtd@lists.infradead.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Linux-sunxi <linux-sunxi@googlegroups.com>
Subject: [RFC] Add DMA RX support for sunxi nand
Date: Fri, 12 Jun 2015 13:38:47 +0200
Message-Id: <1434109129-28183-1-git-send-email-r.spliet@ultimaker.com>
Content-Type: text/plain; charset=US-ASCII
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Following are two patches for sunxi nand DMA support. There's a whole phletora
of reasons why these are marked RFC, including:
- Sunxi DMA support still needs to be merged upstream
- Sun7i NAND definitions are not merged upstream
- No TX support
- Bounce buffer size is fixed to 8KB, and I have no idea whether this is sane
- No clustering of DMA requests
- More hw features that we might want to use

Some of this can be addressed in follow-up patches, some can't. I'm just
curious what you think.
Motivation for sending this out anyway: on my set-up this already improves
boot time by approx. 4s, or ~10%. This cheers me up on a sunny Friday afternoon
in the office.
Happy testing and reviewing. Yours,

Roy


-- 


IMAGINE IT >> MAKE IT

Meet us online at Twitter <http://twitter.com/ultimaker>, Facebook 
<http://facebook.com/ultimaker>, Google+ <http://google.com/+Ultimaker>

www.ultimaker.com
