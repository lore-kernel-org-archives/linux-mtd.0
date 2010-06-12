Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ONRiS-00060z-2Z
	for linux-mtd@lists.infradead.org; Sat, 12 Jun 2010 14:29:44 +0000
Subject: Re: [PATCH 1/2] mtd: physmap: add physmap_unmapped_area() for
	no-mmu XIP
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1274599824-17530-1-git-send-email-vapier@gentoo.org>
References: <1274599824-17530-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 12 Jun 2010 17:26:34 +0300
Message-ID: <1276352794.19028.122.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Sun, 2010-05-23 at 03:30 -0400, Mike Frysinger wrote:
> From: Bernd Schmidt <bernds_cb1@t-online.de>
> 
> Currently, romfs XIP doesn't work in flash memory (the kernel crashes
> with a null pointer dereference).  The problem is that the mtd physmap
> driver isn't setting up a get_unmapped_area pointer for the mtd
> partitions it creates.
> 
> Signed-off-by: Bernd Schmidt <bernds_cb1@t-online.de>
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed both to my l2-mtd-2.6.git / dunno.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
