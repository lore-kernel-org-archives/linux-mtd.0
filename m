Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2Uq6-0002G6-Gp
 for linux-mtd@lists.infradead.org; Thu, 03 Jul 2014 00:25:27 +0000
Received: by mail-pa0-f44.google.com with SMTP id rd3so13468531pab.3
 for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2014 17:25:04 -0700 (PDT)
Date: Wed, 2 Jul 2014 17:25:01 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: lpc32xx: drop bitflip_threshold initialization
Message-ID: <20140703002501.GN3599@ld-irv-0074>
References: <1401267145-18218-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401267145-18218-1-git-send-email-computersforpeace@gmail.com>
Cc: Roland Stigge <stigge@antcom.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 28, 2014 at 01:52:25AM -0700, Brian Norris wrote:
> These drivers don't need to explicitly initialize their bitflip
> thresholds. The comment is no longer correct, since nand_scan_tail()
> performs this initialization as of the following commit:
> 
>     commit ea3b2ea24ef0f2ef9c6795b19cff456195b6728a
>     Author: Shmulik Ladkani <shmulik@jungo.com>
>     Date:   Fri Jun 8 18:29:06 2012 +0300
> 
>         mtd: nand: initialize bitflip_threshold prior to BBT scanning
> 
> (It seems there were some parallel efforts on writing/submitting these
> drivers, and Shmulik's bug fix.)
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Roland Stigge <stigge@antcom.de>

Pushed to l2-mtd.git.

Brian
