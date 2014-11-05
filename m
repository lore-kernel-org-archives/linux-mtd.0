Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xlw86-0005Wv-Ng
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 08:39:51 +0000
Received: by mail-pa0-f44.google.com with SMTP id bj1so341490pad.31
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 00:39:28 -0800 (PST)
Date: Wed, 5 Nov 2014 00:39:25 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH v2 1/3] mtd: nand: comment update, the DEPLETE1 command
 has gone
Message-ID: <20141105083925.GF22361@norris-Latitude-E6410>
References: <1396611948-4523-1-git-send-email-gsi@denx.de>
 <1396611948-4523-2-git-send-email-gsi@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1396611948-4523-2-git-send-email-gsi@denx.de>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>, Alexander Shiyan <shc_work@mail.ru>,
 David Mosberger <davidm@egauge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 04, 2014 at 01:45:46PM +0200, Gerhard Sittig wrote:
> update a comment in nand_command_lp() about specific requirements of
> individual commands, the DEPLETE1 command was removed in the past and
> the comment no longer applied
> 
> Signed-off-by: Gerhard Sittig <gsi@denx.de>
> ---
> changes in v2: none

Pushed this patch to l2-mtd.git.

Brian
