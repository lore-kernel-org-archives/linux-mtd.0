Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jillt-0004ao-T0
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 07:28:06 +0000
Subject: Re: Question about ubimkvol vs. mkfs.ubifs
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce_Leonard@selinc.com
In-Reply-To: <OF56D7FBB0.A3722ECD-ON88257423.008249AB-88257423.00833E0B@selinc.com>
References: <OF56D7FBB0.A3722ECD-ON88257423.008249AB-88257423.00833E0B@selinc.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 07 Apr 2008 10:27:22 +0300
Message-Id: <1207553242.8040.48.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sun, 2008-04-06 at 16:53 -0700, Bruce_Leonard@selinc.com wrote:
> This is probably a basic question but I'll admit to being lost.  I'm=20
> relatively new to kernel coding and up till now I've been focused on the=20
> very low level stuff, i.e., making hardware work and LEDs go=20
> blinkey-blinkey.  Currently I'm working on a NAND flash driver that I nee=
d=20
> to tie into UBI/UBIFS.  I've got the driver working, I can=20
> read/write/erase my flash parts, so the low level stuff that I understand=
=20
> is good.=20

Is it a secret what is your flash and what is its size? If it is NAND
I'd recommend you to test it with Adrian's NAND tests:
git://infradead.org/~ahunter/nand-tests.git

> insmod my_flash_driver
> insmod ubi mtd=3D1
> insmod ubifs
> ubimkvol /dev/ubi0 -m -N ubifs
> mount -t ubifs ubi0:ubifs /mnt/nand

> Once I do all that I can read/write/copy/delete/etc files just fine on th=
e=20
> NAND flash.  So, like I said it appears to be working just fine.  But=20
> everything I see on the mailing list seems to be saying I should be using=
=20
> mkfs.ubifs.  But if everything works and I'm mounting the device as a=20
> UBIFS filesystem, what (if anything) is mkfs.ubifs going to do for me tha=
t=20
> I don't already have done?

As Hamish explained, you do not have to use mkfs.ubifs if you do not
need it. UBIFS can mount empty volumes just fine.=20

In addition to what he said, mkfs.ubifs allows you to tune the
file-system. When you mount an empty volume, UBIFS formats it with
default settings: default journal size, default B-tree fanout, default
compression, etc. With mkfs.ubifs you may define different parameters,
e.g., use zlib instead of lzo, make larger journal, etc.

> Oh, another question.  I've seen reference to an 'fs-test' that's suppose=
d=20
> to be part of mtd-utils, but I can't seem to find it anywhere.  Can=20
> someone please point me to the sources?  Is it a good test to run?

These are old tests Adrian wrote for JFFS2 and they sit at
mtd-utils.git/tests/fs-tests/. Some of the stress test scripts are
JFFS2-specific - you will notice. But they are easy to fix - just make
them not to run the "gcd_hupper" program. This is the only
JFFS2-specific thing.

Yes, I think this is a good idea to run them. Specifically, we are
extensively using the integrity test for UBIFS.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
