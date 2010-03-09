Received: from mail-bw0-f215.google.com ([209.85.218.215])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nov71-0005Kl-LC
	for linux-mtd@lists.infradead.org; Tue, 09 Mar 2010 08:48:28 +0000
Received: by bwz7 with SMTP id 7so5279979bwz.4
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Mar 2010 00:48:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <804f0d21003082348m27adcf0exf1d928a53a84655b@mail.gmail.com>
References: <7FAAF01335A90841B8C1098FB08222A6908DFCB01F@GMVMAIL6.gmv.es>
	<Pine.LNX.4.64.1001291147400.32263@lnxricardw.se.axis.com>
	<804f0d21003080602m4adabf28p62ca7cf5d09c274b@mail.gmail.com>
	<ce9ab5791003080638v604412fcy7761482892c0d787@mail.gmail.com>
	<804f0d21003080823x730204feg70ea4e9a617b6378@mail.gmail.com>
	<ce9ab5791003082059y7268cc03jb09b550b9008bab1@mail.gmail.com>
	<804f0d21003082348m27adcf0exf1d928a53a84655b@mail.gmail.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Tue, 9 Mar 2010 14:18:02 +0530
Message-ID: <ce9ab5791003090048v5b1108b5oc38ee3618fe76d89@mail.gmail.com>
Subject: Re: JFFS2 error messages
To: Arno Steffen <arno.steffen@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Marco Donadio <mdonadio@gmv.com>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> =A0-s, --pagesize=3DSIZE =A0 =A0 Use page size (max data node size) SIZE
> (default: 4KiB)
> =A0-e, --eraseblock=3DSIZE =A0 Use erase block size SIZE (default: 64KiB)
> =A0-c, --cleanmarker=3DSIZE =A0Size of cleanmarker (default 12)
>
> As "-s 4096" gives same result as without "-s" I assume the size is in by=
te ?!
> Just to be sure - I have to use 2048 instead of 2112 ?

Yes that's correct. You need to use 2048.

--=20
Regards,
Vimal Singh
