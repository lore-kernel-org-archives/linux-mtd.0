Subject: Re: [PATCH 2/2][MTD] Add support for > 2GiB MTD devices
From: David Woodhouse <dwmw2@infradead.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
In-Reply-To: <20080827093920.1bdb44c2@lxorguk.ukuu.org.uk>
References: <1219817017.18027.149.camel@sauron>
	<000201c9080d$0bce0d20$6b01a8c0@mvista.com>
	<20080827093920.1bdb44c2@lxorguk.ukuu.org.uk>
Content-Type: text/plain
Date: Wed, 27 Aug 2008 10:01:32 +0100
Message-Id: <1219827692.7107.170.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd-bounces@lists.infradead.org,
	'Bruce Leonard' <brucle@earthlink.net>, Bruce_Leonard@selinc.com,
	linux-kernel@vger.kernel.org, Tim Anderson <tanderson@mvista.com>,
	linux-mtd@lists.infradead.org, 'Andrew Morton' <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-08-27 at 09:39 +0100, Alan Cox wrote:
> On Tue, 26 Aug 2008 23:20:46 -0700
> "Tim Anderson" <tanderson@mvista.com> wrote:
> 
> > Artem,
> > 
> > I see your point. Ioctls are going away after all.
> 
> I don't know where that stupid story keeps coming from. Ioctl is alive
> and well and there are more not less of them. There are lots of things
> you *cannot* do with sysfs, including synchronization and handling
> many kinds of changes to objects that can appear and disappear. Ditto
> there are problems with getting a consistent snapshot via sysfs because
> you can't atomically read multiple fields.
> 
> So please stop this 'ioctls are going away' stuff, its bunkum.

True, and we'll definitely need a new MEMERASE64 ioctl. But for the
_informational_ parts, those can happily be done through sysfs.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
