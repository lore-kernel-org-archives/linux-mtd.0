Received: from [203.194.209.83] (helo=machine36.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19JxFj-0000z4-Hd
	for <linux-mtd@lists.infradead.org>; Sun, 25 May 2003 16:17:39 +0100
From: Mark Meade <mark@lakeshoremicro.com>
To: stolc@intrak.sk (Oskar Stolc),
 linux-mtd@lists.infradead.org
Date: Sun, 25 May 2003 11:16:37 -0400
References: <20030523063820.GH13272@intrak.sk>
	<20030525092737.GJ13272@intrak.sk>
In-Reply-To: <20030525092737.GJ13272@intrak.sk>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200305251116.38021.mark@lakeshoremicro.com>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: Possible GRUB problem: [Was: DiskOnChip MD2202-D256]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 25 May 2003 05:27 am, Oskar Stolc wrote:
> - the following step was to build GRUB with DiskOnChip support:
> 	wget ftp://alpla.gnu.org/gnu/grub/grub-0.92.tar.gz
> 	tar xzvf grup-0.92.tar.gz
> 	cd grup-0.92
> 	cat ../mtd/patches/grub-0.92-doc.patch |patch -p1

> What am I doing incorrectly?

I would suggest trying the latest GRUB patch: grub-2003-01-08-doc.patch.  This 
has numerous changes/improvements over the 0.92 patch.
