Received: from mail-qy0-f122.google.com ([209.85.221.122])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lq8Z2-0000TO-TF
	for linux-mtd@lists.infradead.org; Sat, 04 Apr 2009 16:17:55 +0000
Received: by qyk28 with SMTP id 28so2933571qyk.28
	for <linux-mtd@lists.infradead.org>;
	Sat, 04 Apr 2009 09:17:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1238855797.4068.6.camel@macbook.infradead.org>
References: <200903260042.42091.david-b@pacbell.net>
	<a95a62fe0904021641j17a7c26dv5652de4a19bad662@mail.gmail.com>
	<1238742215.20906.99.camel@localhost.localdomain>
	<a95a62fe0904031300i82bdf42h5bc854a002e0091e@mail.gmail.com>
	<1238855797.4068.6.camel@macbook.infradead.org>
Date: Sat, 4 Apr 2009 09:17:46 -0700
Message-ID: <a95a62fe0904040917w6396443bj3278abbae83df46@mail.gmail.com>
Subject: Re: [patch/rfc 2.6.29 1/2] MTD: driver model updates
From: Kevin Cernekee <kpc.mtd@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: David Brownell <david-b@pacbell.net>,
	Linux MTD <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/4/09, David Woodhouse <dwmw2@infradead.org> wrote:
> I really do think I want this to avoid the need for 64-bit ioctls
> (except maybe MEMERASE64).

So, after adding the sysfs patches, we have two remaining sets of MTD
operations that are limited to 32-bit offsets:

The first set is required to support >4GiB NAND devices: MEMERASE,
MEMREADOOB, and MEMWRITEOOB.

The second set might not make sense at all for most NAND devices:
MEMLOCK, MEMUNLOCK, and MEMGETREGIONINFO.  Maybe it would be nice to
extend them for consistency's sake, but it is possible that they will
never be needed on any >4GiB flash chip.

How would you like to handle these?  Any thoughts on what the
interfaces (sysfs or otherwise) might look like?

Thanks.
