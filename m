Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HWrzt-00022r-Aq
	for linux-mtd@lists.infradead.org; Thu, 29 Mar 2007 06:36:50 -0400
Subject: Re: [RFC] [PATCH] UBI: refine wear leveling logic
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200703281547.18851.alexs@linux.vnet.ibm.com>
References: <200703281547.18851.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 29 Mar 2007 13:36:31 +0300
Message-Id: <1175164591.19966.20.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Artem.Bityutskiy@nokia.com,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexander,

On Wed, 2007-03-28 at 15:47 +0200, Alexander Schmidt wrote:
> This patch addresses the handling of blocks that are put by the user
> while they are moved by the wear leveling thread. The schedule_erase
> function is now called by put_peb() itself instead of notifying the wear
> leveling thread.

May I ask you for more explanation why you think your code is correct?

> +
> +	if (in_wl_tree(e, &ubi->used))
> +		used_tree_del(ubi, e);
> +	else if (unlikely(in_wl_tree(e, &ubi->scrub)))
> +		scrub_tree_del(ubi, e);
> +	else if (!in_wl_tree(e, &ubi->free))
> +		prot_tree_del(ubi, e->pnum);
>  	spin_unlock(&ubi->wl_lock);
> =20
>  	err =3D schedule_erase(ubi, e, torture);

Fine, you schedule this eraseblock for erasure. At the same time the the
WL worker moves data in there. The copy_leb() function will notice that
the LEB is unmapped, and won't do copy. Then the WL worker will insert
the eraseblock to a tree. At the same time the erase worker will insert
the same wl_entry to the free tree. One of the trees will be screwed-up.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
