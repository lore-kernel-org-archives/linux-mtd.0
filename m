Received: from port-19.ottawa4.achilles.net ([209.151.2.118] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15RgJf-0005d2-00
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jul 2001 21:40:37 +0100
Date: Tue, 31 Jul 2001 16:45:18 -0400 (EDT)
From: David Woodhouse <dwmw2@infradead.org>
To: Alexandru Harsanyi <a.harsanyi@willhart-tech.com>
cc: Linux Mtd <linux-mtd@lists.infradead.org>
Subject: Re: DOC 2000 driver (NFTL) in kernel 2.4.7
In-Reply-To: <3B6636CA.374A6E14@willhart-tech.com>
Message-ID: <Pine.LNX.4.33.0107311640330.27691-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Tue, 31 Jul 2001, Alexandru Harsanyi wrote:

> 1) Although I have only one DOC 2000, the DOC driver detects many more
> (see dmesg below)

Note the word 'possible'. Turn on CONFIG_MTD_DOCPROBE_55AA

> 2) The DOC driver detects 3 flash chips, I only have one

One DiskOnChip. Three flash chips in it.

> 3) (and this is the show stopper) The NFTL driver is not able to find a
> boot record on the DOC. This is strange because I'm actually booting
> from the DOC.

That's odd. Update to the latest code from CVS, although I'm not sure it 
should make a difference, and put lots of debugging printks in 
find_boot_record() in nftlmount.c so it tells you why it rejects the 
header blocks it finds.

-- 
dwmw2
