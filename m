Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jf8Ch-0004El-N2
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 06:36:44 +0000
Subject: Re: choosing a file system to use on NAND/UBI
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080328010403.GB23610@cloud.net.au>
References: <20080328010403.GB23610@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Fri, 28 Mar 2008 08:33:44 +0200
Message-Id: <1206686024.3856.57.camel@sauron>
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

On Fri, 2008-03-28 at 12:04 +1100, Hamish Moffatt wrote:
> I'm developing an embedded product which will have its root file system
> on NAND. The root will be pre-prepared and installed using
> flashcp/nandwrite/ubiupdatevol, and usually mounted read-only.
> Occasionally we might want to mount it read/write for debug purposes.
Please, tell the size of your flash and whether it SLC or MLC.

> JFFS2 on UBI does not seem very fast, in particular mount time and
> initial access (until cache is populated).
I believe this will not depend much on whether there is UBI or not. You
tried static volume which has to check CRC checksum of the whole flash -
that might have introduced noticeable overhead.

Yes, JFFS2 is slow just after mount because it has to check whole
file-system partition. Mount time also depends on the contents of the
file-system - you might be interested to look at this section for more
information:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_scalability

>  I tried disabling compression
> but that seemed to make it worse (mount time was doubled).
>=20
> Will ubifs on UBI be better? Is it mature enough to use yet?
UBIFS mounts very quickly. It is very stable. We find minor issues from
time to time, but they are fixed quickly.

> For static volumes you have UBI protecting you, so you should not need
> file-system CRC checking as JFFS2 does, correct? Are there any file
> systems which take advantage of this property?=20

Not sure. But this static volume CRC protection is not very useful if
you have something like JFFS2 on top.

> Would I be better choosing LogFS or YAFFS1/2, perhaps without UBI?

Never used YAFFSx, but it might be worth trying and evaluating. Vs.
LogFS - last time we tried it - it was too slow. It also did not
implement wear-levelling and bad block handling.

If you try to evaluate them - I would be interested to know about your
experience.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
