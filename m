Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFOfX-0006TY-9u
 for linux-mtd@lists.infradead.org; Thu, 07 Aug 2014 14:27:51 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFC 8/8] debug: mtd: spi-nor: add BUG_ON() prints to check for
 !ready
Date: Thu, 7 Aug 2014 16:26:34 +0200
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
 <1407374222-8448-9-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1407374222-8448-9-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201408071626.34216.marex@denx.de>
Cc: Huang Shijie <b32955@freescale.com>, zajec5@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, August 07, 2014 at 03:17:02 AM, Brian Norris wrote:
> I hacked around the wait-till-ready sequencing just now, so let's add
> some debug checks for now.
> 
> These probably shouldn't be included in mainline (or at least they
> should be toned down to something less drastic; WARN_ON() perhaps?). I'm
> just using these for test purposes.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

I'm all for this, but some kind of a WARN_ON_ONCE would do.

Best regards,
Marek Vasut
