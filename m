Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGWla-0001hS-7O
 for linux-mtd@lists.infradead.org; Tue, 05 Jan 2016 18:55:35 +0000
Received: by mail-pa0-x22e.google.com with SMTP id do7so592808pab.2
 for <linux-mtd@lists.infradead.org>; Tue, 05 Jan 2016 10:55:13 -0800 (PST)
Date: Tue, 5 Jan 2016 10:55:11 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: John Crispin <blogic@openwrt.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/6] MTD: lantiq: xway: various nand fixes
Message-ID: <20160105185511.GI109450@google.com>
References: <1451941501-42952-1-git-send-email-blogic@openwrt.org>
 <20160104233049.GA128501@google.com> <568B71EC.2070309@openwrt.org>
 <20160105175333.GA46565@google.com> <568C0F0B.7000302@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <568C0F0B.7000302@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 05, 2016 at 07:44:27PM +0100, John Crispin wrote:
> >> i'll try to get this resolved for v4.6.
> 
> would you take this stuff around rc2-3 or would that be too late ? i
> already manage to track down one of the original authors and he agreed
> to help testing.

Fixes, probably. Refactoring and new features, probably not. If you
prioritize the fixes first in the series, then that leaves me the most
flexibility.

Regards,
Brian
