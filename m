Received: from tritech.se ([46.59.120.190])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpIAC-00029p-TU
 for linux-mtd@lists.infradead.org; Tue, 27 May 2014 14:15:37 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: [PATCH v2] mtd-utils: integck: add support for volume specific
 power-cut test
Date: Tue, 27 May 2014 14:15:01 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B4091B2@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B401901@post.tritech.se>,
 <1401194249.1304.140.camel@sauron.fi.intel.com>
In-Reply-To: <1401194249.1304.140.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem, =0A=
=0A=
On Tuesday, May 27, 2014 2:37 PM, Artem Bityutskiy wrote:=0A=
> But I think I see the problem with this solution now.=0A=
>=0A=
> The problem is that with this we won't get power cut emulated while you=
=0A=
> mount the file system.=0A=
>=0A=
> Before this change, we could have something like:=0A=
>=0A=
> 1. Working with the FS, power-cut=0A=
> 2. Unmount the FS, start mounting -> power-cut in the middle of mount.=0A=
> =0A=
> So we could test power cuts while we are in the middle of recovery from=
=0A=
> the previous power cuts, in a way "nested" power-cuts.=0A=
> =0A=
> With your change, we never have them.=0A=
=0A=
With the old version we didn't get a power-cut at all, unless power-cuts=0A=
were first globally enable by writing "1" to =0A=
/sys/kernel/debug/ubifs/tst_recovery.=0A=
=0A=
This is still possible!=0A=
=0A=
What wasn't possible before was to test only one filesystem image if=0A=
there are more. The way I see it, my change extends what is possible,=0A=
it doesn't limit it.=0A=
=0A=
You are correct of course, that power-cut during remount isn't tested if=0A=
the test isn't run with global enable, but remounting is not a normal=0A=
use-case (!?) for someone using ubifs as the rootfs.=0A=
=0A=
BR // Mats=0A=
