Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ynxeq-0000YF-71
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 23:14:16 +0000
From: Marek Vasut <marex@denx.de>
To: Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH 3/3] MTD: spi-nor: add flag to not use sector erase.
Date: Fri, 1 May 2015 01:13:50 +0200
References: <cover.1430430153.git.hramrach@gmail.com>
 <35add8df33b17e2354d9496eba8597d9d8488f30.1430430153.git.hramrach@gmail.com>
In-Reply-To: <35add8df33b17e2354d9496eba8597d9d8488f30.1430430153.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201505010113.50293.marex@denx.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Woodhouse <dwmw2@infradead.org>, zajec5@gmail.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
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

On Thursday, April 30, 2015 at 11:13:12 PM, Michal Suchanek wrote:
> The sector size of the flash memory is unclear from datasheet or may
> possibly vary between chips so add a flag to always use 4k blocks.
> 
> Currently 4k blocks are always used when possible but in the future
> somebody might want to do some optimizations with sector erase.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>

I _think_ you might be able to determine the size, no ?

One way is to ask the vendor, but you can also try something like:
1) erase the whole SPI NOR
2) overwrite it with zeroes (or ones ? I think it should be all ones after 
erasing).
3) Erase sector 0
4) Read some 128 KiB back
5) Observe what is the difference.

Best regards,
Marek Vasut
