Received: from mail-wi0-f170.google.com ([209.85.212.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4nR3-0005jM-AA
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2015 09:45:38 +0000
Received: by wiga1 with SMTP id a1so103339483wig.0
 for <linux-mtd@lists.infradead.org>; Tue, 16 Jun 2015 02:45:12 -0700 (PDT)
MIME-Version: 1.0
From: Roy Spliet <r.spliet@ultimaker.com>
To: Linux MTD Mailinglist <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Baruch Siach <baruch@tkos.co.il>, Rafal Milecki <zajec5@gmail.com>
Subject: [RFC] Support custom timings for NAND chips
Date: Tue, 16 Jun 2015 11:45:01 +0200
Message-Id: <1434447904-31748-1-git-send-email-r.spliet@ultimaker.com>
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Following is a fairly simple set of three patches that both implement and
demonstrate the use of custom timings for chip. This follows from the
requirement to support the Hynix H27UBG8T2BTR-BC, as shipped by Olimex on
their Allwinner-based ARM-boards.

I motivate my chosen approach as follows:
1) Requirement. The NAND chip is being used in the wild, and using the only
   supported ONFI timing (0) is significantly degrading performance.
2) Simplicity. The three patches are fairly straightforward, and do what they
   should do without compromise. Alternative approaches like sticking timings
   in the DT makes it more difficult for distribution to ship universal
   kernels and DTBs, because it's a NAND chip property and not a board
   property.

I send this out now (asap), because the only legacy that requires a change is
sunxi-nand. The longer we wait, the harder it gets. Don't let that stop you
from doing a proper review job! :-)
Comments? Ideas?
Yours,

Roy



-- 


IMAGINE IT >> MAKE IT

Meet us online at Twitter <http://twitter.com/ultimaker>, Facebook 
<http://facebook.com/ultimaker>, Google+ <http://google.com/+Ultimaker>

www.ultimaker.com
