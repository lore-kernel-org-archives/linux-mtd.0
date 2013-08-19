Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBQO1-0007Yv-RF
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 14:24:50 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: [RFC] mtd-utils: integck: add support for volume specific
 power-cut test
Date: Mon, 19 Aug 2013 14:24:19 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FCDC6D3@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FCDC571@post.tritech.se>,
 <1376919409.2089.463.camel@sauron.fi.intel.com>
In-Reply-To: <1376919409.2089.463.camel@sauron.fi.intel.com>
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

Hi Artem,=0A=
=0A=
Well, as far as I understand, and the tests I made support this, you can=0A=
either enable the tests for all UBIFS mounts using:=0A=
=0A=
# echo "1" > /sys/kernel/debug/ubifs/tst_recovery=0A=
=0A=
or you can enable it for one specific mount using something like:=0A=
=0A=
# echo "1" > /sys/kernel/debug/ubifs/ubi1_0/tst_recovery=0A=
=0A=
However, in the latter case, the flag is reset when the file system is remo=
unted=0A=
so the test continues without tst_recovery enabled.=0A=
=0A=
Or am I missing something here?=0A=
=0A=
BR // Mats=0A=
=0A=
________________________________________=0A=
From: Artem Bityutskiy [dedekind1@gmail.com]=0A=
Sent: Monday, August 19, 2013 3:36 PM=0A=
To: Mats K=E4rrman=0A=
Cc: linux-mtd@lists.infradead.org=0A=
Subject: Re: [RFC] mtd-utils: integck: add support for volume specific powe=
r-cut test=0A=
=0A=
On Mon, 2013-08-19 at 08:50 +0000, Mats K=E4rrman wrote:=0A=
> Problem:=0A=
> The current power-cut test requires power-cut emulation to be enabled glo=
bally=0A=
> (e.g. for all UBIFS volumes) but this may lead to some practical problems=
 when=0A=
> the root fs of the tested machine is also of the same type.=0A=
=0A=
Hi, sorry, I do not understand the problem. First of all, I never ran=0A=
this on a device which uses an UBIFS file-system as rootfs. I only ran=0A=
it on a PC where UBIFS has only been on top of a nandsim.=0A=
=0A=
So, AFAICS, power cut emulation is per-mountpoint. So you should enable=0A=
it only for the the file-system under test. Power-cut should switch only=0A=
the file-system under test to R/O mode, not the rootfs.=0A=
=0A=
What are the practical problems you mention?=0A=
=0A=
--=0A=
Best Regards,=0A=
Artem Bityutskiy=0A=
=0A=
