Subject: RE: [PATCH 2/2][MTD] Add support for > 2GiB MTD devices
From: Artem Bityutskiy <dedekind@infradead.org>
To: Tim Anderson <tanderson@mvista.com>
In-Reply-To: <000101c9080a$4ec3a6b0$6b01a8c0@mvista.com>
References: <000101c9080a$4ec3a6b0$6b01a8c0@mvista.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 27 Aug 2008 09:03:37 +0300
Message-Id: <1219817017.18027.149.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd-bounces@lists.infradead.org,
	'Bruce Leonard' <brucle@earthlink.net>, Bruce_Leonard@selinc.com,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	'Andrew Morton' <akpm@linux-foundation.org>,
	'David Woodhouse' <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-08-26 at 23:01 -0700, Tim Anderson wrote:
> I have been experimenting with this. I think there is at least 3 maybe 4
> IOCTLS that are going to need to have a LARGE mode. The 2 most obvious ar=
e
> MEMGETINFO and MEMERASE.

dwmw2 vetoed any MEMGETINFO ioctl changes, or new similar ioctls, and it
kind of make sense, because we should use sysfs instead. But this, in
turn, means implementing sysfs support for MTD, because MTD is not
LinuxDeviceModel-enabled at the moment.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
