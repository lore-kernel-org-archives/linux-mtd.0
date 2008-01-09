Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JCdq5-0001Uz-5F
	for linux-mtd@lists.infradead.org; Wed, 09 Jan 2008 16:31:43 +0000
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	m09GVNH2031934
	for <linux-mtd@lists.infradead.org>; Wed, 9 Jan 2008 17:31:23 +0100
Date: Wed, 9 Jan 2008 17:30:49 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: mounting "unformatted" nandflash
Message-ID: <Pine.LNX.4.64.0801091138010.22600@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,

Before I start digging into this myself, perhaps someone here has an=20
answer.

We are running an embedded system with 128 megs of nand flash=20
(large-block). To put it simply, our scenario is that we mount a large=20
portion of empty flash as a jffs2 partition. Since the partition is empty,=
=20
there are no [oob] cleanmarkers, and upon mounting, jffs2 scans the=20
partition, marks all blocks as needing erasure; this is then ultimately=20
controlled by the pdflush kernel task.

The strange thing is that pdflush then takes almost 100% cpu for a minute=
=20
or so to complete. Erasing the whole flash (e.g. using flash_eraseall)=20
just takes a few seconds, writing the cleanmarkers should take even less.=
=20
So why is pdflush taking so much time to complete it's task? I've figured=
=20
that it must be the erase/cleanmarker-write process which is the culprit,=
=20
as upon rebooting pdflush exhibits no such behavior when the cleanmarkers=
=20
are in place).

(Yes, in this case we could use flash_eraseall -j (which incidently=20
doesn't seem to work but could be easily fixed) to 'format' the partition=
=20
in question. However, for various reasons this isn't practical for us as=20
the initial flash write is done using a non-linux tool).

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
