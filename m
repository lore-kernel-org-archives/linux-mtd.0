Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HWB6F-0006nm-VV
	for linux-mtd@lists.infradead.org; Tue, 27 Mar 2007 08:48:33 -0400
Message-ID: <460913B3.3060009@inf.u-szeged.hu>
Date: Tue, 27 Mar 2007 14:53:07 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: joakim.tjernlund@transmode.se
Subject: Re: JFFS2 SUMMARY nodes aren't working
References: <1174569321.26465.308.camel@gentoo-jocke.transmode.se>
In-Reply-To: <1174569321.26465.308.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joakim Tjernlund =EDrta:
> On a fresh JFFS2 root FS image with summary nodes there is no
> difference in mount time when enabling summary support in kernel(2.6.20=
,
> powerpc).
>  =20
If you use NOR flash with relatively small erase block, summary will not=20
really chance to speed up the mount process.

Anyway you should check the summary is really working or not. Use the=20
following way:

Enable the JFFS33 debugging options (min. debug level 1) in your kernel=20
configuration and recompile the kernel. You  see the following messages=20
in your kernel log. When you load the jffs2 kernel module you can see=20
the following message:
"JFFS2 version 2.2. NAND SUMMARY" (in case of summary is enabled, maybe=20
the NAND is skipped if you doesn't have writebuffer compiled in).

If summary is enabled and something went wrong, maybe the image on flash=20
has no summary info:
"no summary found in jeb 0x%08x. Apply original scan." where %08x is=20
replaced by the offset of the jeb.

If you see debug information which begin with "jffs2_sum_" and there is=20
no error in your log it means the summary works.

Ferenc
