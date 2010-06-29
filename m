Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OTUVd-00065m-L2
	for linux-mtd@lists.infradead.org; Tue, 29 Jun 2010 06:41:31 +0000
Subject: RE: [PATCH 1/2] mtd: OneNAND: Add runtime badblock check feature
From: Artem Bityutskiy <dedekind1@gmail.com>
To: kyungmin.park@samsung.com
In-Reply-To: <012f01cb0b4e$db1a7550$914f5ff0$%park@samsung.com>
References: <1275380256-15315-1-git-send-email-jy0922.shim@samsung.com>
	<1276421200.19028.192.camel@localhost>
	<012f01cb0b4e$db1a7550$914f5ff0$%park@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 29 Jun 2010 09:38:30 +0300
Message-ID: <1277793510.1041.966.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: 'Thomas Gleixner' <tglx@linutronix.de>, linux-mtd@lists.infradead.org,
	'Joonyoung Shim' <jy0922.shim@samsung.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-06-14 at 08:19 +0900, Kyungmin Park wrote:
> Hi,
> 
> > -----Original Message-----
> > From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
> > Sent: Sunday, June 13, 2010 6:27 PM
> > To: Joonyoung Shim
> > Cc: linux-mtd@lists.infradead.org; Kyungmin Park; Thomas Gleixner
> > Subject: Re: [PATCH 1/2] mtd: OneNAND: Add runtime badblock check feature
> > 
> > On Tue, 2010-06-01 at 17:17 +0900, Joonyoung Shim wrote:
> > > From: Kyungmin Park <kyungmin.park@samsung.com>
> > >
> > > This patch is to support runtime badblock checking. This supports only
> > > OneNAND currently. The OneNAND badblock checking when boots occurs boot
> > > time delay. We can reduce boot time because can detect badblock at
> > > runtime.
> > >
> > > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > 
> > Hi, this feature is interesting. But why not to use bad block table
> > instead of adding more complexity to the already very complex and
> > difficult to follow code?
> 
> > 
> > Also, if you really want this, it should be rather lazy checking, where
> > you read OOB on demand, and then save this information to the in-ram
> > BBT, and when you get another ->block_isbad() for a block which was
> > previously checked, you do not read OOB for the second time.
> 
> It's based on BBT already. Now I set the BBT values as 0x2 and then check it at runtime and then mark it 0 for good, 3 for bad block.
> 
> Right, it's same word lazy checking and runtime check.
> 
> The original ideas are from UBI scan it read all blocks again at probe.
> I just scan almost block read once at ubi scan.

I think this this stuff should:

1. refrain from adding any new config option
2. be the default method and fully replace the old method

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
