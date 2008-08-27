Date: Wed, 27 Aug 2008 16:34:16 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2/2][MTD] Add support for > 2GiB MTD devices
Message-ID: <20080827143416.GA1371@logfs.org>
References: <1219817017.18027.149.camel@sauron>
	<000201c9080d$0bce0d20$6b01a8c0@mvista.com>
	<20080827093920.1bdb44c2@lxorguk.ukuu.org.uk>
	<1219827692.7107.170.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1219827692.7107.170.camel@pmac.infradead.org>
Cc: linux-mtd-bounces@lists.infradead.org,
	'Bruce Leonard' <brucle@earthlink.net>, Bruce_Leonard@selinc.com,
	linux-kernel@vger.kernel.org, Tim Anderson <tanderson@mvista.com>,
	linux-mtd@lists.infradead.org, 'Andrew Morton' <akpm@linux-foundation.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 27 August 2008 10:01:32 +0100, David Woodhouse wrote:
> 
> True, and we'll definitely need a new MEMERASE64 ioctl. But for the
> _informational_ parts, those can happily be done through sysfs.

They certainly can, but should they?  There may be some reason to prefer
sysfs that should be self-evident - except that I'm a bit thick and seem
to need it spelled out.  Or maybe I've just become disillusioned with
the practice of replacing crappy interfaces (ioctl here) with other
crappy interfaces (sysfs here) and having to support both for all
eternity.  sysctl, ioctl, proc, sysfs, debugfs, netlink, ... -
individually they all suck in their own peculiar way.  But together they
create a mess I no longer dare to name.

So what was the reason again why mtd needs two userspace interfaces
instead of just one?

Jörn

-- 
It does not require a majority to prevail, but rather an irate,
tireless minority keen to set brush fires in people's minds.
-- Samuel Adams
