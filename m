Received: from mail-pb0-x231.google.com ([2607:f8b0:400e:c01::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wmuyv-0001wb-9o
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 01:06:09 +0000
Received: by mail-pb0-f49.google.com with SMTP id jt11so841897pbb.22
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 18:05:47 -0700 (PDT)
Date: Tue, 20 May 2014 18:05:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v4 0/4]  mtd: nand: omap: add support for BCH16_ECC
Message-ID: <20140521010544.GC22233@ld-irv-0074>
References: <1400486082-4345-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1400486082-4345-1-git-send-email-pekon@ti.com>
Cc: Stefan Roese <sr@denx.de>, Tony Lindgren <tony@atomide.com>,
 Felipe Balbi <balbi@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-omap <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 19, 2014 at 01:24:38PM +0530, Pekon Gupta wrote:
> As this series touches both linux-mtd and linux-omap (GPMC) sub-systems but in
> independent patch-sets, so looping both maintainers. 'Ack' from maintainers would
> help in getting this series accepted for 3.16
> 
> *changes v3 -> v4*
> [PATCH v4 1/4]: minor update in comments
> [PATCH v4 2/4]: fixed coding style to keep it generic for big/little endianess
> [PATCH v4 3/4]: no change
> [PATCH v4 4/4]: use plain english (non linux stuff)

Pushed all 4 to l2-mtd.git. Thanks!

I have one comment for patch 3, but it's not a blocker.

Brian
