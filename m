Received: from draco.netpower.no ([212.33.133.34])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19khIZ-0007uM-2v
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 10:43:07 +0100
Received: from lair ([212.33.152.109])
	by draco.netpower.no (8.12.9/8.12.8) with ESMTP id h779iWur018925
	for <linux-mtd@lists.infradead.org>; Thu, 7 Aug 2003 11:44:32 +0200
From: =?iso-8859-1?Q?=D8yvind_Harboe?= <oyvind.harboe@zylin.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 7 Aug 2003 11:42:54 +0200
Message-ID: <000601c35cc8$46de3c50$73dea8c0@lair>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: JFFS2 ram memory usage
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've made some changes to JFFS2 locally to reduce memory usage.

The change I did was to disable compresssion as I have lots
of flash and little ram(Atmel EB40a 2MB flash + 256k ram +
eCos and my app).

My usage of JFFS2 is intermittant and hence I'd like to
reduce peak memory usage(much better with compression
disabled) and idle memory usage(perhaps unmounting JFFS2
when I'm not using it?).

I did post a RFC on the changes I did to the ecos-patches
mailing list, but I'll clean it up to the best of my abilities
if there might be useful to others as well.

Comments?

http://sources.redhat.com/ml/ecos-patches/2003-08/msg00019.html

Sincerely,
=D8yvind
