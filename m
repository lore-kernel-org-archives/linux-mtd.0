Received: from wproxy.gmail.com ([64.233.184.194])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Dudkl-0005lb-He
	for linux-mtd@lists.infradead.org; Mon, 18 Jul 2005 18:06:29 -0400
Received: by wproxy.gmail.com with SMTP id i27so1081274wra
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Jul 2005 15:06:21 -0700 (PDT)
Message-ID: <2db32b7205071815055e5b05ef@mail.gmail.com>
Date: Mon, 18 Jul 2005 15:05:15 -0700
From: rolf liu <rolfliu@gmail.com>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1121722834.20907.0.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <2db32b72050718135560ae235c@mail.gmail.com>
	<1121722834.20907.0.camel@weaponx.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: boot error using /dev/mtdblock0
Reply-To: rolf liu <rolfliu@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

thanks
It works now


On 7/18/05, Josh Boyer <jdub@us.ibm.com> wrote:
> On Mon, 2005-07-18 at 13:55 -0700, rolf liu wrote:
> > I am using /dev/mtdblock0 as the root, and put a jffs2 image on it.
> > but when the kernel boots up, it panic:
> >
> > Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-blo=
ck(31,0)
> >
> > Any suggestion?
>=20
> Put this on your kernel command line:
>=20
> rootfstype=3Djffs2
>=20
> We really need to update the FAQ with that.  *sigh*
>=20
> josh
>=20
>
