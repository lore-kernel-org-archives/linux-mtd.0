Received: from krynn.se.axis.com ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19UlMK-0007iz-2I
	for <linux-mtd@lists.infradead.org>; Tue, 24 Jun 2003 11:49:08 +0100
From: "Mikael Starvik" <mikael.starvik@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>,
   "'Alexander Viro'" <aviro@redhat.com>
Date: Tue, 24 Jun 2003 12:48:54 +0200
Message-ID: <3C6BEE8B5E1BAC42905A93F13004E8AB03277992@mailse01.axis.se>
MIME-Version: 1.0
In-Reply-To: <3C6BEE8B5E1BAC42905A93F13004E8AB032ABD2B@mailse01.axis.se>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
cc: 'Allen Curtis' <acurtis@onz.com>
cc: 'Infradead Org' <linux-mtd@lists.infradead.org>
cc: jffs-dev@axis.com
Subject: RE: JFFS patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Even at Axis (the original copyright holder of JFFS1) we are now using=20
JFFS2. I'll check if someone inhouse is interrested in keeping JFFS1=20
maintained 2.6.

PS. I tested JFFS1 in 2.5 a while ago and it seamed to kind of work =
after=20
one small patch. But I guess that there is much more to be done to make
it reliable. DS

/Mikael

-----Original Message-----
From: owner-jffs-dev@axis.com [mailto:owner-jffs-dev@axis.com] On Behalf =
Of
David Woodhouse
Sent: Tuesday, June 24, 2003 12:42 PM
To: Alexander Viro
Cc: Allen Curtis; Infradead Org; jffs-dev@axis.com
Subject: Re: JFFS patch


On Tue, 2003-06-24 at 11:35, Alexander Viro wrote:
> It would be nice.  There are several ugly craps in there and I'd=20
> rather see it gone than try and fix them...

Me too -- I started cleaning up at one point and the result was JFFS2 :)

So unless I hear anguished screams from a huge user base who are using =
it
and not JFFS2 for reasons which they haven't yet reported as JFFS2 bugs, =
and
someone also steps forward to clean it up for 2.6, I'll submit a patch =
to
Linus to remove it in a couple of weeks time.

--=20
dwmw2


To unsubscribe from this list: send the line "unsubscribe jffs-dev" in =
the
body of a message to majordomo@axis.com
