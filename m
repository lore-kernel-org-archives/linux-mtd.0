Subject: Re: [PATCH 2/2][MTD] Add support for > 2GiB MTD devices
From: Artem Bityutskiy <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20080827143416.GA1371@logfs.org>
References: <1219817017.18027.149.camel@sauron>
	<000201c9080d$0bce0d20$6b01a8c0@mvista.com>
	<20080827093920.1bdb44c2@lxorguk.ukuu.org.uk>
	<1219827692.7107.170.camel@pmac.infradead.org>
	<20080827143416.GA1371@logfs.org>
Content-Type: text/plain; charset=utf-8
Date: Wed, 27 Aug 2008 17:47:43 +0300
Message-Id: <1219848463.18027.166.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd-bounces@lists.infradead.org,
	'Bruce Leonard' <brucle@earthlink.net>, Bruce_Leonard@selinc.com,
	linux-kernel@vger.kernel.org, Tim Anderson <tanderson@mvista.com>,
	linux-mtd@lists.infradead.org, 'Andrew Morton' <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-08-27 at 16:34 +0200, J=C3=B6rn Engel wrote:
> They certainly can, but should they?  There may be some reason to prefer
> sysfs that should be self-evident - except that I'm a bit thick and seem
> to need it spelled out.  Or maybe I've just become disillusioned with
> the practice of replacing crappy interfaces (ioctl here) with other
> crappy interfaces (sysfs here) and having to support both for all
> eternity.  sysctl, ioctl, proc, sysfs, debugfs, netlink, ... -
> individually they all suck in their own peculiar way.  But together they
> create a mess I no longer dare to name.

The plus of sysfs I see is that I can add more files to expose more
information in sysfs, while I can not change MEMGETINFO ioctl. E.g., I
need to expose sub-page size to user-space, and I cannot do this with
MEMGETINFO.

> So what was the reason again why mtd needs two userspace interfaces
> instead of just one?

I would like to make udev creating MTD devices, instead of creating them
by hands. Adding MTD to LDM would anyway introduce corresponding sysfs
files, right? This means we would have one more interface anyway.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
