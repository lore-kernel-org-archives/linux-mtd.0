Received: from [213.79.90.228] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MqY4i-0008Eb-HT
	for linux-mtd@lists.infradead.org; Wed, 23 Sep 2009 20:04:32 +0000
Date: Thu, 24 Sep 2009 00:04:25 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [patch 1/3] mtd: m25p80: convert to device table matching
Message-ID: <20090923200425.GA27295@oksana.dev.rtsoft.ru>
References: <200909222353.n8MNr1Eg029863@imap1.linux-foundation.org>
	<20090923125105.baf250e7.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20090923125105.baf250e7.akpm@linux-foundation.org>
Cc: dbrownell@users.sourceforge.net, benh@kernel.crashing.org,
	grant.likely@secretlab.ca, linux-mtd@lists.infradead.org,
	ben-linux@fluff.org, khali@linux-fr.org, dwmw2@infradead.org
Reply-To: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 23, 2009 at 12:51:05PM -0700, Andrew Morton wrote:
> On Tue, 22 Sep 2009 16:53:01 -0700
> akpm@linux-foundation.org wrote:
> 
> > Convert the m25p80 driver so that now it uses .id_table for device
> > matching, making it properly detect devices on OpenFirmware platforms
> > (prior to this patch the driver misdetected non-JEDEC chips, seeing all
> > chips as "m25p80").
> > 
> > Also, now jedec_probe() only does jedec probing, nothing else.  If it is
> > not able to detect a chip, NULL is returned and the driver fall backs to
> > the information specified by the platform (platform_data, or exact ID).
> 
> OK, I am now officially fed up with fixing the tremendous reject which
> this patch tosses each time someone fiddles with the device table in
> drivers/mtd/devices/m25p80.c

> (which seems to happen at about 38Hz).

:-)

> I sent it and now I'll drop it.  Sorry.

No problem, the main thing is that SPI patches went in.
I'll rebase m25p80 patches and send them to David.

Thanks a lot Andrew!

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
