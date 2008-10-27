Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KuQOJ-00058H-45
	for linux-mtd@lists.infradead.org; Mon, 27 Oct 2008 11:36:11 +0000
Date: Mon, 27 Oct 2008 12:36:07 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Heinig Gerald <g.heinig@el-me.de>
Subject: Re: JFFS2 driver under 2.4.31 fails to trigger
	garbage	collection/compression
In-Reply-To: <9503E3D8EC34CC4EA3FBC01F3BFAB8AE6AA502@exchange05.elmedmn.local>
Message-ID: <Pine.LNX.4.64.0810271232560.6120@lnxricardw.se.axis.com>
References: <9503E3D8EC34CC4EA3FBC01F3BFAB8AE6AA502@exchange05.elmedmn.local>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 27 Oct 2008, Heinig Gerald wrote:

> First off, I hope this is the correct mailing list for jffs2 under=20
> kernel 2.4. If it isn't, my apologies and please point me to the correct=
=20
> site. Thanks in advance.

From

http://www.linux-mtd.infradead.org/source.html

" [...]

As of March 2005 we dropped Linux 2.4 support from CVS head. This means we=
=20
no longer care whether the CVS code can be used on Linux 2.4 or not.

[...]

If you are using the ancient 2.4 kernel, that's probably because you're=20
interested in stabliity -- it is old and long-tested code. If that's what=
=20
you want, then you should use the original JFFS2 code which is part of the=
=20
2.4 kernel. It's old and slow and doesn't support NAND flash, but it is=20
stable, and is maintained.

The MTD community is neither able nor interested to provide support for=20
new MTD and JFFS2 code with ancient kernels. Move yourself and update to a=
=20
recent kernel. If you use a vendor supplied kernel, please get support=20
from your kernel vendor. Do not ask on the mailinglist for help with such=
=20
problems. You are either ignored or you get a pointer to this text. Please=
=20
save the bandwidth and our time to sort out such questions."

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
  --- PLEASE NOTE - I have moved - from F407 to F117 - PLEASE NOTE ---
