Received: from moutng.kundenserver.de ([212.227.126.186])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OBkWb-0005A8-5O
	for linux-mtd@lists.infradead.org; Tue, 11 May 2010 08:09:09 +0000
From: Thorsten =?iso-8859-1?q?M=FChlfelder?= <muehlfelder@enertex.de>
To: linux-mtd@lists.infradead.org
Subject: Re: Some questions on bit-flips and JFFS2
Date: Tue, 11 May 2010 10:09:06 +0200
References: <201005031505.18604.muehlfelder@enertex.de>
	<201005041659.26262.muehlfelder@enertex.de>
	<4BE12D86.2070605@aimvalley.nl>
In-Reply-To: <4BE12D86.2070605@aimvalley.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201005111009.06724.muehlfelder@enertex.de>
Cc: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Wednesday 05 May 2010 10:34:14 schrieb Norbert van Bolhuis:
> It much more easier to let UBI/UBIFS deal with this suff. It's designed for
> this.
> u-boot support UBIFS (read-only). This means you can put a kernel image
> on UBIFS and make u-boot read/boot it.

How would I do this? The only thing I've found about it is this discussion of 
April 2008:
http://lists.infradead.org/pipermail/linux-mtd/2008-April/021268.html

Thanks for any tip
Thorsten
