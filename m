Received: from smtp2.linux-foundation.org ([207.189.120.14])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IH1Xh-0000C6-Q4
	for linux-mtd@lists.infradead.org; Fri, 03 Aug 2007 14:06:32 -0400
Date: Fri, 3 Aug 2007 11:06:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: =?UTF-8?Q?Rafa=C5=82?= Bilski <rafalbilski@interia.pl>
Subject: Re: Problem with udev and block2mtd
Message-Id: <20070803110614.9c06fe45.akpm@linux-foundation.org>
In-Reply-To: <46B0D997.8030805@interia.pl>
References: <46B0D997.8030805@interia.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 01 Aug 2007 21:05:59 +0200
Rafał Bilski <rafalbilski@interia.pl> wrote:

> Hi!
> 
> I have changed static /dev to udev on my machine. It has 
> a lot of RAM (94MB) so I was expecting that udev will not make 
> things worse. Unfortunately udev isn't noticing that new mtd 
> device was born.

<tap, tap>  Is this thing turned on?

> I was suspecting that this is my fault, but 
> udev's /dev is populated and:
> UEVENT[1185991604.930847] add@/module/mtdcore
> UEVENT[1185991604.969089] add@/module/mtdpart
> UEVENT[1185991605.005954] add@/module/block2mtd
> UEVENT[1185991647.726551] add@/module/mtdsuper
> UEVENT[1185991647.783396] add@/module/jffs2
> UEVENT[1185991647.801242] add@/slab/jffs2_i
> UDEV  [1185991647.815670] add@/slab/jffs2_i
> UEVENT[1185991647.827608] add@/slab/:0000072
> UDEV  [1185991647.842338] add@/slab/:0000072
> I don't see nothing about new device.
> 
> Is this situation known? Or this is 2.6.23-rc1-git3 regression? 
> Or is my udev misconfigured?
> 

Did 2.6.22 work OK with the same setup?  If so, yes, it's a regression!
