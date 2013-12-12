Received: from mail-pb0-x22f.google.com ([2607:f8b0:400e:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqxI3-0000iT-V6
 for linux-mtd@lists.infradead.org; Thu, 12 Dec 2013 03:50:20 +0000
Received: by mail-pb0-f47.google.com with SMTP id um1so11270761pbc.20
 for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2013 19:49:57 -0800 (PST)
Date: Thu, 12 Dec 2013 11:49:47 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v2 3/4] mtd: nand: support Micron READ RETRY
Message-ID: <20131212034946.GB1345@gmail.com>
References: <1386619753-27613-1-git-send-email-computersforpeace@gmail.com>
 <1386619753-27613-3-git-send-email-computersforpeace@gmail.com>
 <20131211135451.GB1284@gmail.com>
 <20131211190313.GS27149@ld-irv-0074.broadcom.com>
 <20131211203111.GD5461@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131211203111.GD5461@localhost>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 11, 2013 at 05:31:12PM -0300, Ezequiel Garcia wrote:
> Isn't completely bloated to setup a DMA operation just to transfer a
> bunch of bytes? Wouldn't that seriously hurt performance?
> 
> Or maybe it doesn't matter because those commands are scarcely
> invoked...
As you said, those commands are scarcely invoked.

thanks
Huang Shijie
