Received: from fish.redhat.com ([213.86.99.237]
	helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19skF8-0001yd-3U
	for <linux-mtd@lists.infradead.org>; Fri, 29 Aug 2003 15:28:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
In-Reply-To: <a05200f19bb750ddd2b65@[130.161.115.44]>
References: <023501c36e31$81a4a610$a970a8c0@topo>
	 <a05200f17bb750899ef6e@[130.161.115.44]>
	 <024b01c36e35$62241600$a970a8c0@topo>
	 <a05200f19bb750ddd2b65@[130.161.115.44]>
Message-Id: <1062167303.17744.346.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 29 Aug 2003 15:28:24 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: Luca Contini <luca.contini@mediaenabling.com>
cc: "linux-mtd-request@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: latest MTD snapshot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-08-29 at 16:07 +0200, J.D. Bakker wrote:
> That's a pretty ancient kernel (almost 18 months old). You may want 
> to retry with 2.4.21-rmk1 (works fine on the LART, which is also 
> arm-based).

Just "#define unlikely(x) (x)" will suffice, although you may find other
problems with a kernel that old.

> >[root@Lab patches]# patchin.sh
> >Directory  does not exist or is not a kernel source directory
> 
> You must give it the path to your kernel tree as an argument (as 
> documented on http://www.linux-mtd.infradead.org/).

Urgh. It'll also _tell_ you that for itself now...

hades /home/dwmw2/working/mtd/patches $ ./patchin.sh
usage:  ./patchin.sh [-c] [-j] kernelpath
   -c  -- copy files to kernel tree instead of building links
   -j  -- include jffs2 filesystem


-- 
dwmw2
