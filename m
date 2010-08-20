Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OmKvO-00035q-Dy
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 06:18:03 +0000
Received: by fxm12 with SMTP id 12so1844381fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Aug 2010 23:17:57 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd: physmap: add physmap_unmapped_area() for
	no-mmu XIP
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1276352794.19028.122.camel@localhost>
References: <1274599824-17530-1-git-send-email-vapier@gentoo.org>
	<1276352794.19028.122.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 Aug 2010 09:17:53 +0300
Message-ID: <1282285073.2183.4.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: uclinux-dev@uclinux.org, Bernd Schmidt <bernds_cb1@t-online.de>,
	David Howells <dhowells@redhat.com>,
	Paul Mundt <lethal@linux-sh.org>, linux-mtd@lists.infradead.org,
	Greg Ungerer <gerg@uclinux.org>, uclinux-dist-devel@blackfin.uclinux.org,
	David Woodhouse <dwmw2@infradead.org>,
	David McCullough <davidm@snapgear.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-06-12 at 17:26 +0300, Artem Bityutskiy wrote:
> On Sun, 2010-05-23 at 03:30 -0400, Mike Frysinger wrote:
> > From: Bernd Schmidt <bernds_cb1@t-online.de>
> > 
> > Currently, romfs XIP doesn't work in flash memory (the kernel crashes
> > with a null pointer dereference).  The problem is that the mtd physmap
> > driver isn't setting up a get_unmapped_area pointer for the mtd
> > partitions it creates.
> > 
> > Signed-off-by: Bernd Schmidt <bernds_cb1@t-online.de>
> > Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> 
> Pushed both to my l2-mtd-2.6.git / dunno.

dwmw2 did not take these 2 patches, so I'm dropping them from my l2 tree
as well.

Artem.
