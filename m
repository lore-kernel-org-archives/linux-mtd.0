Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pf7Ms-0002YV-6x
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 08:56:49 +0000
Received: by fxm19 with SMTP id 19so6932431fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Jan 2011 00:56:37 -0800 (PST)
Subject: RE: What if the UBI flasher can't skip all-FF pages?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Povey <Jon.Povey@racelogic.co.uk>
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE093F9302E3@Cloud.RL.local>
References: <70E876B0EA86DD4BAF101844BC814DFE093F9302E3@Cloud.RL.local>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Jan 2011 10:56:34 +0200
Message-ID: <1295340994.2470.80.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: J Barlow <jbarlow@ivl.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-01-14 at 05:45 +0000, Jon Povey wrote:
> > A long initial boot is not really a problem.  I was seriously
> > considering this, but I realized that I could set up a platform
> > specific workaround.  My bootloader can write UBIFS correctly, so
> all
> > I need to do is reprogram every PEB in the UBI volume on the first
> > boot before attempting to
> > load Linux.
> 
> If that is a fresh mkfs.ubifs filesystem not many blocks will have a
> mix of all-FF and not-all-FF pages, you only need to rewrite those
> blocks.
> all-FF blocks I think you can just erase completely and UBI will put
> headers back on later (someone else may like to comment..)

Right.

> Bear in mind what happens if you lose power or get reset while doing
> this process. If you are planning to do it in the factory with a test
> after, shouldn't be a problem.

We have UBI atomic leb change function for this - it should take care of
power cuts. But it has some overhead - it calculates CRC32 of the data.

So basically, my idea was:

1. Add a bit to the EC header which tells: this PEB needs re-freshing.
2. After scanning and initializing, do 'ubi_eba_atomic_leb_change()' for
all LEBs which are mapped to PEBs with that flag.
3. 'ubi_eba_atomic_leb_change()' will atomically move the data to
another PEB and clean the flag.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
