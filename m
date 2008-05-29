Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K1csf-0002JZ-6a
	for linux-mtd@lists.infradead.org; Thu, 29 May 2008 07:49:01 +0000
Subject: UBIFS on-media format changed to version 3
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 May 2008 10:50:42 +0300
Message-Id: <1212047442.31023.64.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Nancy <nancydreaming@gmail.com>, Hamish Moffatt <hamish@cloud.net.au>,
	Bruce_Leonard@selinc.com, richard_titmuss@eu.logitech.com
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

we have found a bug in UBIFS and the fix changes the on-media format.
Namely, the direntry hash function changed. We've always assumed it to
be 29 bits wide, but because of incorrect bitmask it has been only 25
bits wide.

Please, update UBIFS and mkfs.ubifs to version 0.7. We have changed
media format version from 2 to 3 as well. We support compatibility with
older JFFS2 format (version 2) for now, but we would like to drop the
support, unless someone really needs this and asks us not to do this. We
are not in mainline so far, so we probably have luxury of changing
on-flash format so far.

I've CCed people who may be using UBIFS and should be aware of the
change.

We have updated 2.6.21--2.6.25 back-ports as well.

Thanks.

P.S. It is anyway good idea to update as we've fixed a number of bugs.
P.P.S. We are hoping to get merged to 2.6.27 and are working on this.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
