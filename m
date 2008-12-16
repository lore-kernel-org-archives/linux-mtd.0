Received: from fnoeppeil48.netpark.at ([217.175.205.176]
	helo=roarinelk.homelinux.net)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCWkw-00006r-59
	for linux-mtd@lists.infradead.org; Tue, 16 Dec 2008 10:02:22 +0000
Date: Tue, 16 Dec 2008 11:02:20 +0100
From: Manuel Lauss <mano@roarinelk.homelinux.net>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: NAND "low-level format"?
Message-ID: <20081216100220.GA8296@roarinelk.homelinux.net>
References: <20081216085501.GA7866@roarinelk.homelinux.net>
	<8bd0f97a0812160105l292b57b1v77ad3b4314512942@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bd0f97a0812160105l292b57b1v77ad3b4314512942@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 16, 2008 at 04:05:49AM -0500, Mike Frysinger wrote:
> On Tue, Dec 16, 2008 at 03:55, Manuel Lauss wrote:
> > My question is: is there a utility of sorts which can reclaim the falsely
> > marked bad sectors for linux use?
> 
> there prob is a nand util to do it under Linux (i'd d/l mtd-utils and
> build it up and see what you get), 

Did that; couldn't find anything.


>                                     but if you're using u-boot, you can
> use "nand scrub"

no u-boot for these boards (and cpu type), unfortunately.

Thanks,
	Manuel Lauss
