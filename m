Received: from mail-ig0-x236.google.com ([2607:f8b0:4001:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YoIvu-0003IB-Ra
 for linux-mtd@lists.infradead.org; Fri, 01 May 2015 21:57:19 +0000
Received: by igblo3 with SMTP id lo3so48309379igb.1
 for <linux-mtd@lists.infradead.org>; Fri, 01 May 2015 14:56:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <35add8df33b17e2354d9496eba8597d9d8488f30.1430430153.git.hramrach@gmail.com>
References: <cover.1430430153.git.hramrach@gmail.com>
 <35add8df33b17e2354d9496eba8597d9d8488f30.1430430153.git.hramrach@gmail.com>
Date: Fri, 1 May 2015 23:56:57 +0200
Message-ID: <CACna6rx3G+=wMyxkAjh=bT2OG1QsJvfAXSB9pE0cgYu=NhDS-g@mail.gmail.com>
Subject: Re: [PATCH 3/3] MTD: spi-nor: add flag to not use sector erase.
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Michal Suchanek <hramrach@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Ben Hutchings <ben@decadent.org.uk>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 30 April 2015 at 23:13, Michal Suchanek <hramrach@gmail.com> wrote:
> The sector size of the flash memory is unclear from datasheet or may
> possibly vary between chips so add a flag to always use 4k blocks.
>
> Currently 4k blocks are always used when possible but in the future
> somebody might want to do some optimizations with sector erase.

AFAIK most sources call 4K a sector and 64K a block. I think we should
try to stick to that (even if some current code doesn't). So it would
be nice to call 4K a sector (instead of block).
