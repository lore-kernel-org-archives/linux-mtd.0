Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192oZG-0001Mk-Fo
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 09:34:58 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20030407194039.GF8178@wohnheim.fh-wedel.de>
References: 
	 <20030407171037.GB8178@wohnheim.fh-wedel.de.suse.lists.linux.kernel>
	 <p73r88exh3r.fsf@oldwotan.suse.de>
	 <20030407194039.GF8178@wohnheim.fh-wedel.de>
Message-Id: <1049790892.18045.120.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 08 Apr 2003 09:34:52 +0100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: Andi Kleen <ak@suse.de>
cc: linux-kernel@vger.kernel.org
Subject: Re: [ANNOUNCE] New kernel tree for embedded linux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-04-07 at 20:40, Jörn Engel wrote:
> Some more partitioning code that only applies to spinning discs of
> some sort (ide, scsi) or code that emulates spinning discs is always
> included. No config option.

We definitely want CONFIG_BLK_DEV. CONFIG_SWAP is a good start.

> Another one is serial.c. In an ltp test run, plus serial console, some
> 90% were unused. And the code gave me some shivers. Volunteers?

The new serial code is somewhat nicer. Still contains unconditional
support for a lot of bizarre 8250 variations, but I don't think that's
really taking up much space though.

-- 
dwmw2
