Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KkuSN-0005dU-9j
	for linux-mtd@lists.infradead.org; Wed, 01 Oct 2008 05:41:03 +0000
Subject: Re: UBIFS sync question
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce_Leonard@selinc.com
In-Reply-To: <OFD58EAD0A.B5E12235-ON882574D4.007AC780-882574D4.007B6DB9@selinc.com>
References: <OFD58EAD0A.B5E12235-ON882574D4.007AC780-882574D4.007B6DB9@selinc.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 01 Oct 2008 08:40:03 +0300
Message-Id: <1222839603.8051.16.camel@sauron>
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


On Tue, 2008-09-30 at 15:28 -0700, Bruce_Leonard@selinc.com wrote:
> Artem,
>=20
> We've run into a side effect that we think is probably a design choice in=
=20
> UBIFS, but we want to make sure before we start trying to troubleshoot a=20
> "bug".  What we do is open an existing  file in a UBIFS formated UBI=20
> volume on a NAND flash, add a few lines to it, close the file, then=20
> WITHOUT un-mounting the file system, reboot the box (simulating a power=20
> outage).  When the box reboots and we look at the file, it's zero length=20
> and has no contents.  I suspect it's because UBIFS does less frequent=20
> syncs than say ext2 for performance reasons, and we're just losing the=20
> contents of the file because there's no sync before the reboot.
>=20
> Is this correct or do we need to start digging for something broken?

Well, you should sync the file, see
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writeback

However, if you open a file, and just add few lines to it, then it
should not become empty after reboot. You should just loose whole or
part of new data.

I think you actually truncate the file, then re-write it, instead of
appending. This often happens in case of shell scripts - shell commands
like truncating files.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
