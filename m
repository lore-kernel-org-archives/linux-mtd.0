Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 158kjx-0001b0-00
	for <linux-mtd@lists.infradead.org>; Sat, 09 Jun 2001 16:33:29 +0100
Received: from cisco7500-maingw.gts.cz
	([194.213.32.131] helo=bug.ucw.cz ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 158Odv-00022d-00
	for linux-mtd@lists.infradead.org; Fri, 08 Jun 2001 16:57:48 +0100
Date: Wed, 6 Jun 2001 19:48:49 +0000
From: Pavel Machek <pavel@suse.cz>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "David S. Miller" <davem@redhat.com>, Chris Wedgwood <cw@f00f.org>,
        Jeff Garzik <jgarzik@mandrakesoft.com>, bjornw@axis.com,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: Missing cache flush.
Message-ID: <20010606194846.B38@toy.ucw.cz>
References: <15132.40298.80954.434805@pizda.ninka.net> <15132.22933.859130.119059@pizda.ninka.net> <13942.991696607@redhat.com> <3B1C1872.8D8F1529@mandrakesoft.com> <15132.15829.322534.88410@pizda.ninka.net> <20010605155550.C22741@metastasis.f00f.org> <25587.991730769@redhat.com> <15132.40298.80954.434805@pizda.ninka.net> <25831.991731935@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <25831.991731935@redhat.com>; from dwmw2@infradead.org on Tue, Jun 05, 2001 at 10:05:35AM +0100
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi!

> What shall we call this function? The intuitive "flush_dcache_range" appears
> to have already been taken.


Please do not use *_dcache_*. It would confuse me with dentry cache.

Flush data cche range would be ok.

[BTW what about just rewriting it with 0xffs after you zero the block?
Someone already suggested that, and it seems ok.]
-- 
Philips Velo 1: 1"x4"x8", 300gram, 60, 12MB, 40bogomips, linux, mutt,
details at http://atrey.karlin.mff.cuni.cz/~pavel/velo/index.html.
