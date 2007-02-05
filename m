Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HDz7s-0006Ta-GI
	for linux-mtd@lists.infradead.org; Mon, 05 Feb 2007 03:23:03 -0500
Subject: Re: Do not understand use of oobfree
From: Artem Bityutskiy <dedekind@infradead.org>
To: Philip Rakity <prakity@yahoo.com>
In-Reply-To: <872380.68552.qm@web58702.mail.re1.yahoo.com>
References: <872380.68552.qm@web58702.mail.re1.yahoo.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 05 Feb 2007 10:22:42 +0200
Message-Id: <1170663762.3628.56.camel@sauron>
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

On Sun, 2007-02-04 at 19:58 -0800, Philip Rakity wrote:
> I am asking because if I have a flash device that does not map per the
> standard includes do I have to touch jffs2 to get things to work.=20

I've just submitted a patch which teaches UBI to use MTD_OOB_AUTO
option. Please, make sure your driver supports it and try the patch.

The idea is that it is not application's business to know details of OOB
- where ECC bytes ate stored, BB marker, etc. This is all legacy stuff,
conceptually wrong. We now (thankfully) have the MTD_OOB_AUTO and it
should be used instead. It represents free OOB bytes as a contiguous
buffer and allows you read to it and write from it.

The patches are not in Mainline, not even in mtd-2.6.git yet. They are
at
git://git.infradead.org/~dedekind/dedekind-mtd-2.6.git.

Or web
http://git.infradead.org/?p=3Dusers/dedekind/dedekind-mtd-2.6.git;a=3Dsumma=
ry

Try this and send us your success story or the complaint.

P.S. I don't know why we don't remove the legacy OOB-related stuff - but
I am all for it.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
