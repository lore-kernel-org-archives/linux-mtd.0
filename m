Subject: RE: [PATCH 2/2][MTD] Add support for > 2GiB MTD devices
From: David Woodhouse <dwmw2@infradead.org>
To: Tim Anderson <tanderson@mvista.com>
In-Reply-To: <000201c9080d$0bce0d20$6b01a8c0@mvista.com>
References: <000201c9080d$0bce0d20$6b01a8c0@mvista.com>
Content-Type: text/plain
Date: Wed, 27 Aug 2008 07:35:23 +0100
Message-Id: <1219818923.7107.106.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd-bounces@lists.infradead.org,
	'Bruce Leonard' <brucle@earthlink.net>, Bruce_Leonard@selinc.com,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	'Andrew Morton' <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-08-26 at 23:20 -0700, Tim Anderson wrote:
> I see your point. Ioctls are going away after all.
> 
> So we should have something like:
> /sys/class/mtd/mtd0/
> 
> Or just under device or platform? 

Tim, please stop top-posting.

I'm not sure I'd say I _vetoed_ new ioctls, but I certainly expressed a
desire to do all the information stuff through sysfs. We would need a
new MEMERASE64 ioctl though.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
