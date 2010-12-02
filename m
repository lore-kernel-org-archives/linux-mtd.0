Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PO9zT-0001HE-2R
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 14:18:31 +0000
Date: Thu, 2 Dec 2010 15:18:37 +0100
From: Anatolij Gustschin <agust@denx.de>
To: dedekind1@gmail.com
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
Message-ID: <20101202151837.2d0c06c9@wker>
In-Reply-To: <1291298276.2526.44.camel@localhost>
References: <20101129195014.19224240@wker> <20101201130534.5b95ce83@wker>
	<20101201164447.2215bc58@wker> <1291264926.14534.32.camel@koala>
	<20101202105729.04c25fc1@wker> <1291292325.2526.23.camel@localhost>
	<20101202142351.197abbde@wker> <1291296951.2526.34.camel@localhost>
	<20101202145027.266b30a6@wker> <1291298276.2526.44.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 02 Dec 2010 15:57:56 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Thu, 2010-12-02 at 14:50 +0100, Anatolij Gustschin wrote:
> > > Can you instead make mtd->writesize to be 64? This is much closer to the
> > > "right thing to do" :-)
> > 
> > Yes. But I also must ensure that the buffer size configured in
> > cfi->cfiq->MaxBufWriteSize is actually used by the driver. This
> > is not the case, it seems. If this is true, then I'll still run
> > into the similar trouble even when using 64 for max_io_size in UBI.
> 
> Err, no, I think if the UBI/UBIFS min_io_size is greater than the real
> write size, it should be fine for UBI/UBIFS. UBIFS should not get upset
> if min_io_size is 64, but real write size is 8 or 16 or 32, or even 1
> byte, I think.

Yes, this is my understanding, too. But I'll try to explain what I
meant in the previous email:
When I drop the 8 byte buffer hack in the CFI and set mtd->writesize
to 64, but the CFI driver is really using a multiple of the value
configured in cfi->cfiq->MaxBufWriteSize, then I'll run into the
similar trouble since the driver will probably use a n * 64 buffer,
where n > 1.

But I understand what you meant: I should just set mtd->writesize to
64 and continue to test with my hack for 8 Byte in the CFI driver.

Thanks,
Anatolij
