Received: from cam-admin0.cambridge.arm.com ([193.131.176.58])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJTL4-0000ZT-JG
	for linux-mtd@lists.infradead.org; Wed, 24 Jun 2009 14:20:45 +0000
Subject: Re: BUS_ID_SIZE is going away
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1245852555.25547.5745.camel@macbook.infradead.org>
References: <1245527124.30962.14.camel@yio.site>
	<1245675383.25547.50.camel@macbook.infradead.org>
	<1245832038.2483.3.camel@yio.site>
	<1245842095.25547.5380.camel@macbook.infradead.org>
	<1245848356.32629.14.camel@pc1117.cambridge.arm.com>
	<1245852555.25547.5745.camel@macbook.infradead.org>
Content-Type: text/plain
Date: Wed, 24 Jun 2009 15:20:13 +0100
Message-Id: <1245853213.32629.45.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Russell King <rmk+lkml@arm.linux.org.uk>, Takashi Iwai <tiwai@suse.de>,
	Greg KH <greg@kroah.com>, Kay Sievers <kay.sievers@vrfy.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-mtd@lists.infradead.org, "David S. Miller" <davem@davemloft.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-06-24 at 15:09 +0100, David Woodhouse wrote:
> On Wed, 2009-06-24 at 13:59 +0100, Catalin Marinas wrote:
> > I gave physmap a quick try on RealView boards and it seems to work fine
> > with the patch below. The only difference is the AFS partition parsing
> > probes string, though this is no longer used on ARM Ltd platforms (some
> > old ones still use it).
> 
> Perhaps we should add the list of partition types to the
> physmap_flash_data?

I think this would make sense.

-- 
Catalin
