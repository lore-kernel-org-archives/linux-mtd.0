Date: Tue, 22 Apr 2003 21:03:24 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Art Haas <ahaas@airmail.net>
Message-ID: <20030422190324.GC12947@wohnheim.fh-wedel.de>
References: <20030422155653.GB7260@debian>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030422155653.GB7260@debian>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: Simon Evans <spse@secret.org.uk>
cc: Abraham vd Merwe <abraham@2d3d.co.za>
cc: Linus Torvalds <torvalds@transmeta.com>
cc: linux-mtd@lists.infradead.org
cc: David Woodhouse <dwmw2@infradead.org>
cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] C99 initializers for drivers/mtd/devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 22 April 2003 10:56:53 -0500, Art Haas wrote:
> 
> Here are two trivial patches adding C99 initializers to the files. The
> patches are against the current BK.

IIRC, you sent four patches for mtd some time ago, but only two of
those applied cleanly to the infradead cvs. The following thread ended
quickly.

Anyway, David, Art, maybe you should discuss this one.

David, do you want to have patches against cvs and feed them to Linus
the next round? Or would you prefer to pull the changes from Linus, so
this should be applied as is?

Art, would you be willing to provide a patch against mtd cvs, in case
David prefers that one? Use either cvs:
cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs login (password: anoncvs)
cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs co mtd
or the dayly ftp snapshot:
ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/
    

Jörn

-- 
Victory in war is not repetitious.
-- Sun Tzu
