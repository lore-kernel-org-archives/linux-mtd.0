Received: from topsns2.toshiba-tops.co.jp ([202.230.225.126])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8nGS-0001VX-0q
	for linux-mtd@lists.infradead.org; Wed, 18 Jun 2008 02:19:12 +0000
Date: Wed, 18 Jun 2008 11:19:07 +0900 (JST)
Message-Id: <20080618.111907.60384971.nemoto@toshiba-tops.co.jp>
To: joern@logfs.org
Subject: Re: [PATCH 1/2] mtdpart: Avoid divide-by-zero on out-of-reach path
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20080617164629.GG28448@logfs.org>
References: <20080617152932.GD28448@logfs.org>
	<20080618.005735.51867626.anemo@mba.ocn.ne.jp>
	<20080617164629.GG28448@logfs.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 17 Jun 2008 18:46:29 +0200, J=F6rn Engel <joern@logfs.org> wrot=
e:
> > No, the second loop go forwards.  It searches maximum erasesize of =
the
> > partition.
> =

> Indeed, it does.  And if I change the order in the conditions, those
> make sense even to me.  Hm.
> =

> But what purpose does the 'i--' serve?  Why would we want to check an=

> eraseregion _before_ the start of the partition?

The decrement is there because when the first loop stoped 'i' points
the second region in the partition.

> Next, you could simply add code like this below the second loop:
> 	/* In case no eraseregion matched. */
> 	if (slave->mtd.erasesize =3D=3D 0)
> 		slave->mtd.erasesize =3D master->erasesize;

Yes, it should work.

> But under which conditions would we ever run into this?  It appears a=
s
> if those conditions would be better served with either 'BUG();' or
> 'return -EINVAL;'.
> =

> I am still rather confused by all this.

The keyword is 'out-of-reach path'.  I found this when I expected 8MB
flash and try to split into two 4MB chip, but 2MB chip was actually
mounted on the board socket.

The mtdpart detect this condition and disable the partition by setting
zero to mtd.size.  And fall through to code we are talking about.

	if (slave->offset >=3D master->size) {
			/* let's register it anyway to preserve ordering */
		slave->offset =3D 0;
		slave->mtd.size =3D 0;
		printk ("mtd: partition \"%s\" is out of reach -- disabled\n",
			parts[i].name);
	}

Then, the body of the second loop we are talking about will never
executed.  And finally 'slave->offset % slave->mtd.erasesize' will
cause division-by-zero.

Putting 'goto somewhere' or 'slave->mtd.erasesize =3D master->erasesize=
'
in the above 'if' block can be an alternative fix.

---
Atsushi Nemoto
