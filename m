From: David Woodhouse <dwmw2@infradead.org>
To: Sean Young <sean@mess.org>
In-Reply-To: <20050616091546.GA68824@atlantis.8hz.com>
References: <20050613123626.GB30868@wohnheim.fh-wedel.de>
	<20050614192809.GA46302@atlantis.8hz.com>
	<20050614221844.GB17547@wohnheim.fh-wedel.de>
	<20050615192754.GA60103@atlantis.8hz.com>
	<20050615210155.GA32750@wohnheim.fh-wedel.de>
	<20050616091546.GA68824@atlantis.8hz.com>
Content-Type: text/plain
Date: Thu, 16 Jun 2005 11:28:37 +0100
Message-Id: <1118917717.5497.46.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Embedded bios FTL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-06-16 at 11:15 +0200, Sean Young wrote:
> Indeed so. Besides, it would be more elegant if the file system driver
> passed this on to the block device, via an ioctl. Would such a thing
> stand up to scrutiny? As far as I can see, only the ftl block devices 
> would benefit.

I believe there's a command which can be given to CompactFlash devices
which does basically the same thing. I'd like to see it added to the
block device interface. Probably not an ioctl -- probably a bio command
like barriers instead.
> 
-- 
dwmw2
