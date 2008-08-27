From: "Tim Anderson" <tanderson@mvista.com>
To: <dedekind@infradead.org>
Subject: RE: [PATCH 2/2][MTD] Add support for > 2GiB MTD devices
Date: Tue, 26 Aug 2008 23:20:46 -0700
Message-ID: <000201c9080d$0bce0d20$6b01a8c0@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1219817017.18027.149.camel@sauron>
Cc: linux-mtd-bounces@lists.infradead.org,
	'Bruce Leonard' <brucle@earthlink.net>, Bruce_Leonard@selinc.com,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	'Andrew Morton' <akpm@linux-foundation.org>,
	'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

I see your point. Ioctls are going away after all.

So we should have something like:
/sys/class/mtd/mtd0/

Or just under device or platform? 

> -----Original Message-----
> From: Artem Bityutskiy [mailto:dedekind@infradead.org] 
> Sent: Tuesday, August 26, 2008 11:04 PM
> To: Tim Anderson
> Cc: Bruce_Leonard@selinc.com; 'Andrew Morton'; 
> linux-mtd-bounces@lists.infradead.org; 'David Woodhouse'; 
> linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; 
> 'Bruce Leonard'
> Subject: RE: [PATCH 2/2][MTD] Add support for > 2GiB MTD devices
> 
> On Tue, 2008-08-26 at 23:01 -0700, Tim Anderson wrote:
> > I have been experimenting with this. I think there is at 
> least 3 maybe 4
> > IOCTLS that are going to need to have a LARGE mode. The 2 
> most obvious are
> > MEMGETINFO and MEMERASE.
> 
> dwmw2 vetoed any MEMGETINFO ioctl changes, or new similar 
> ioctls, and it
> kind of make sense, because we should use sysfs instead. But this, in
> turn, means implementing sysfs support for MTD, because MTD is not
> LinuxDeviceModel-enabled at the moment.
> 
> -- 
> Best regards,
> Artem Bityutskiy (???????? ?????)
> 
