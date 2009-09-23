Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MqXsp-0007AB-U2
	for linux-mtd@lists.infradead.org; Wed, 23 Sep 2009 19:52:16 +0000
Date: Wed, 23 Sep 2009 12:51:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	avorontsov@ru.mvista.com, ben-linux@fluff.org,
	benh@kernel.crashing.org, dbrownell@users.sourceforge.net,
	grant.likely@secretlab.ca, khali@linux-fr.org
Subject: Re: [patch 1/3] mtd: m25p80: convert to device table matching
Message-Id: <20090923125105.baf250e7.akpm@linux-foundation.org>
In-Reply-To: <200909222353.n8MNr1Eg029863@imap1.linux-foundation.org>
References: <200909222353.n8MNr1Eg029863@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 22 Sep 2009 16:53:01 -0700
akpm@linux-foundation.org wrote:

> Convert the m25p80 driver so that now it uses .id_table for device
> matching, making it properly detect devices on OpenFirmware platforms
> (prior to this patch the driver misdetected non-JEDEC chips, seeing all
> chips as "m25p80").
> 
> Also, now jedec_probe() only does jedec probing, nothing else.  If it is
> not able to detect a chip, NULL is returned and the driver fall backs to
> the information specified by the platform (platform_data, or exact ID).

OK, I am now officially fed up with fixing the tremendous reject which
this patch tosses each time someone fiddles with the device table in
drivers/mtd/devices/m25p80.c (which seems to happen at about 38Hz).

I sent it and now I'll drop it.  Sorry.
