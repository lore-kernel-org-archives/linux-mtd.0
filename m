Received: from mtagate3.uk.ibm.com ([195.212.29.136])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HWtI4-0002jV-MT
	for linux-mtd@lists.infradead.org; Thu, 29 Mar 2007 07:59:42 -0400
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate3.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l2TBxa6K031922
	for <linux-mtd@lists.infradead.org>; Thu, 29 Mar 2007 11:59:36 GMT
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com
	[9.149.37.212])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.3) with
	ESMTP id l2TBxakZ2621462
	for <linux-mtd@lists.infradead.org>; Thu, 29 Mar 2007 12:59:36 +0100
Received: from d06av01.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l2TBxahT020203
	for <linux-mtd@lists.infradead.org>; Thu, 29 Mar 2007 12:59:36 +0100
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: dedekind@infradead.org
Subject: Re: [RFC] [PATCH] UBI: refine wear leveling logic
Date: Thu, 29 Mar 2007 13:59:25 +0200
References: <200703281547.18851.alexs@linux.vnet.ibm.com>
	<1175164591.19966.20.camel@sauron>
In-Reply-To: <1175164591.19966.20.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200703291359.25593.alexs@linux.vnet.ibm.com>
Cc: Artem.Bityutskiy@nokia.com,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Thursday 29 March 2007, Artem Bityutskiy wrote:
> May I ask you for more explanation why you think your code is correct?

While writing this i assumed that erase and WL procedures are performed
sequentially (either by the background thread or, if the bgt is disabled,
by the produce_free_peb() function). Thank to your comment below I now
realised that erase/wl procedures could happen concurrently if the free
tree is empty and there are pending works (this is the only way that
could lead to your error scenario, right?).

If so then i propose to make get_peb() wait until the bgt produces a free
peb and not mix synchronous/asynchronous operations, as this would make
the code easier, IMO.

Regards,
Alex
>=20
> > +
> > +	if (in_wl_tree(e, &ubi->used))
> > +		used_tree_del(ubi, e);
> > +	else if (unlikely(in_wl_tree(e, &ubi->scrub)))
> > +		scrub_tree_del(ubi, e);
> > +	else if (!in_wl_tree(e, &ubi->free))
> > +		prot_tree_del(ubi, e->pnum);
> >  	spin_unlock(&ubi->wl_lock);
> > =20
> >  	err =3D schedule_erase(ubi, e, torture);
>=20
> Fine, you schedule this eraseblock for erasure. At the same time the the
> WL worker moves data in there. The copy_leb() function will notice that
> the LEB is unmapped, and won't do copy. Then the WL worker will insert
> the eraseblock to a tree. At the same time the erase worker will insert
> the same wl_entry to the free tree. One of the trees will be screwed-up.
>=20
> --=20
> Best regards,
> Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
>=20
>=20
