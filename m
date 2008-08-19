Received: from dino.tdc.no ([62.73.241.55])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KVSpp-00038B-5e
	for linux-mtd@lists.infradead.org; Tue, 19 Aug 2008 15:09:25 +0000
Received: from wpr01.wprmedical.local (unknown [80.239.107.60])
	by dino.tdc.no (Postfix) with ESMTP id A5B361082
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Aug 2008 17:08:57 +0200 (CEST)
Subject: SV: JFFS2 BUG ?
Date: Tue, 19 Aug 2008 17:13:35 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Message-ID: <6B5648EA2E2C2D42AF2FF7691522AD92417CB7@wpr01.wprmedical.local>
In-Reply-To: <3771.128.100.203.197.1219156923.squirrel@128.100.203.197>
Content-class: urn:content-classes:message
References: <3744.128.100.203.197.1219155830.squirrel@128.100.203.197>
	<3771.128.100.203.197.1219156923.squirrel@128.100.203.197>
From: "Eirik Aanonsen" <eaa@wprmedical.com>
To: <jmalone@jsoft.ca>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> >
> > What do you make of this?
> >=20

If you are using SLUB have you set the following config:

CONFIG_SLUB_DEBUG=3Dy
CONFIG_SLUB=3Dy
CONFIG_SLUB_DEBUG_ON=3Dy ( or slub_debug in the command line )

To see if you get some more information?

____________________________________________________
=20
Eirik Aanonsen
SW Developer
E-mail: eaa@wprmedical.com=20
Phone: +47 90 68 11 92
Fax: +47 37 03 56 77
____________________________________________________
