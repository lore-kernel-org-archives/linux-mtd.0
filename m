Received: from qnaomail1.qinetiq-na.com ([96.45.212.10])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTc7I-0008Re-J3
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 15:53:25 +0000
Received: from qnamail2.qinetiq-na.com ([172.16.64.17]) by
	qnaomail1.QinetiQ-NA.com with ESMTP id jnoxuTGMeDWO2nEC for
	<linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 11:53:22 -0400 (EDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: ubi image only mounts once
Date: Mon, 6 Jun 2011 11:53:19 -0400
Message-ID: <29EDD457F13D0846B91A4845A68C3836E4657A@BOSQNAOMAIL1.qnao.net>
In-Reply-To: <BANLkTi=ymbNh93riTAjJ5RVFXogYt9HPYg@mail.gmail.com>
References: <29EDD457F13D0846B91A4845A68C3836DF7DEF@BOSQNAOMAIL1.qnao.net>
	<BANLkTi=ymbNh93riTAjJ5RVFXogYt9HPYg@mail.gmail.com>
From: "Douglass, Woody" <Woodrow.Douglass@QinetiQ-NA.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Matt,=20

Thanks for the quick reply. I have tried both ubiformat (passing -f with
my image) and nandwrite, both seem to behave the same way. The
filesystem mounts once, but when I reboot, it doesn't ever mount again.

I cannot upgrade my kernel as my development schedule is too aggressive;
I don't have time. I'm using 2.6.32 for now; if I fail at getting UBI to
work, I can fall back on jffs2, which works, but I prefer UBIFS.

Note that I did successfully load a ubi image with this kernel In the
past with a filesystem image generated from OpenEmbedded. Could my
mkfs.ubifs/ubinize be the issue?

Thanks,
Woody


Woodrow Douglass
Software Design Engineer
QinetiQ North America
Technology Solutions Group
137 Delta Drive
Pittsburgh, PA 15238
(412) 449 1492
woodrow.douglass@qinetiq-na.com

**********************************************************************
THIS MESSAGE IS INTENDED ONLY FOR THE USE OF THE INDIVIDUAL OR ENTITY TO
WHICH IT IS ADDRESSED AND MAY CONTAIN INFORMATION THAT IS PRIVILEGED,
CONFIDENTIAL, AND EXEMPT FROM DISCLOSURE UNDER APPLICABLE LAW. If the
reader of this message is not the intended recipient, or the employee or
agent responsible for delivering the message to the intended recipient,
you are hereby notified that any dissemination, distribution,
forwarding, or copying of this communication is strictly prohibited.
Whilst this message has been swept by anti-virus software, you are
solely responsible for ensuring that any mail or attachments you receive
are virus free. We disclaim liability for any damage you suffer as a
consequence of receiving any virus; further communication will signify
your consent to this. If you have received this communication in error,
please notify info@automatika.com by e-mail or telephone, and delete the
original message. Thank you.
**********************************************************************

> -----Original Message-----
> From: Matthew L. Creech [mailto:mlcreech@gmail.com]
> Sent: Thursday, June 02, 2011 12:04 AM 0
> To: Douglass, Woody
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: ubi image only mounts once
>=20
> On Wed, Jun 1, 2011 at 1:52 PM, Douglass, Woody
> <Woodrow.Douglass@qinetiq-na.com> wrote:
> >
> > I am trying to build a linux image to run on a custom omap3530
board.
> I
> > have reached a point where my build system builds a UBI image that
> can
> > be mounted exactly once; subsequent mounts fail. Here is the related
> > dmesg output:
> >
> <snip>
>=20
> Hi,
>=20
> How are you flashing the image on to NAND - using "ubiformat", or a
> direct flashing utility like "nandwrite"?  I ask because it sounds
> like the problem described here:
>=20
> http://linux-mtd.infradead.org/faq/ubifs.html#L_why_ubiformat
>=20
> Using "ubiformat" or generating the UBIFS image with the
> free-space-fixup (-F) flag will fix the problem, if that's what it is.
> If you use the mkfs.ubifs fixup flag, you'll need a very recent kernel
> (3.0-rc1), and possibly also Ben Gardiner's patches from a couple days
> ago:
>=20
> http://lists.infradead.org/pipermail/linux-mtd/2011-May/035737.html
>=20
> --
> Matthew L. Creech
