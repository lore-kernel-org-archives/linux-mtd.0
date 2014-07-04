Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2vIt-0004iW-TS
 for linux-mtd@lists.infradead.org; Fri, 04 Jul 2014 04:40:56 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>,
 "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: Where is the "scrubbing" threshold set in UBI? Can it be easily
 varied?
Date: Fri, 4 Jul 2014 04:40:26 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAFB2E4@DBDE04.ent.ti.com>
References: <0A40042D85E7C84DB443060EC44B3FD36D986A2F14@dekaexchange07.deka.local>
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD36D986A2F14@dekaexchange07.deka.local>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Andrew Coll <acoll@dekaresearch.com>,
 Cale Surgen <csurgen@dekaresearch.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Atlant Schmidt
>
>Folks:
>
>  Within the UBI layer, where is the threshold set that
>  determines how many bit-flips must occur on a read
>  before the block is "scrubbed" (stored into another
>  location)?
>
>  And is this done on a page-by-page basis or on a
>  whole-LEB/PEB basis? That is, if a single page has
>  more than threshold number of bit flips, will just
>  that page be relocated or will the entire LEB be
>  relocated to another PEB? (I'd assume the later
>  because that's the level at which UBI understands
>  the organization of the storage.)
>
>  Also:
>
>  It's a shame there doesn't seem to be a UBI ioctl()
>  to control this; it would be nice to be able to run
>  routinely with the threshold set high but be able to
>  easily enter "scrubbing" mode where even single bit-
>  flips could be scrubbed away.
>
No, it's not at all shameful, Instead NAND framework gives controllability
to set bitflip threshold via following sysfs entry.
$KERNEL/Documentation/ABI/testing/sysfs-class-mtd
	/sys/class/mtd/mtdX/bitflip_threshold

And there patch for observing the bitflips via sysfs too.
	[PATCH v3 0/3] mtd: Add sysfs entries and account BBT blocks properly
	http://lists.infradead.org/pipermail/linux-mtd/2014-June/054376.html


with regards, pekon
