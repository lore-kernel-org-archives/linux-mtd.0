Received: from smtp-ext.int-evry.fr ([157.159.11.17])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HoeHV-0000cU-2h
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 07:36:32 -0400
From: Florian Fainelli <florian.fainelli@int-evry.fr>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Add support for SST 39VF6402B flash - block & sector
	support ?
Date: Thu, 17 May 2007 13:37:48 +0200
References: <200705161047.57549.florian.fainelli@int-evry.fr>
	<loom.20070517T093705-724@post.gmane.org>
In-Reply-To: <loom.20070517T093705-724@post.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200705171337.49203.florian.fainelli@int-evry.fr>
Cc: MikeW <mw_phil@yahoo.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Mike,

Yes this would be better. I will try to come up with a patch to the MTD=20
subsystem that can handle this properly.

Le jeudi 17 mai 2007, MikeW a =E9crit=A0:
> Florian Fainelli <florian.fainelli <at> int-evry.fr> writes:
> > Note that according to the datasheet this flash has two possible erase
> > sizes : 64kb and 4kb. I prefer using 64Kb erase size since we do not ha=
ve
> > to change the erase command from 0x50 (64Kb) to 0x30 (4Kb).
>
> Or maybe the MTD model now needs to include support
> for both 'block' and 'sector' erase ?
>
> Regards,
> MikeW
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
