Received: from mail-pb0-x234.google.com ([2607:f8b0:400e:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgyP1-0002OU-Rh
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 15:00:16 +0000
Received: by mail-pb0-f52.google.com with SMTP id wy17so950728pbc.25
 for <linux-mtd@lists.infradead.org>; Thu, 14 Nov 2013 06:59:53 -0800 (PST)
Date: Thu, 14 Nov 2013 22:51:25 -0500
From: Huang Shijie <shijie8@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 5/8] mtd: gpmi: use devm_ioremap_resource
Message-ID: <20131115035122.GA3904@gmail.com>
References: <1384410351-2169-1-git-send-email-b32955@freescale.com>
 <1384410351-2169-6-git-send-email-b32955@freescale.com>
 <20131114135033.GB7076@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131114135033.GB7076@localhost>
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 14, 2013 at 10:50:34AM -0300, Ezequiel Garcia wrote:
> So, this is an improvement, and it's fine to do so. I'm just warning
> about a change in the driver's behavior.
thanks, got it.


Huang Shijie
