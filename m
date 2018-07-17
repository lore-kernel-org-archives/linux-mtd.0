Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffR3X-0006ZE-6r
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 14:34:34 +0000
From: Richard Weinberger <richard@nod.at>
To: Per =?ISO-8859-1?Q?F=F6rlin?= <per.forlin@axis.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: Add volume read and write statistics
Date: Tue, 17 Jul 2018 16:34:03 +0200
Message-ID: <2086360.zJZoXgJm6x@blindfold>
In-Reply-To: <1531829331815.70807@axis.com>
References: <1531823419-8665-1-git-send-email-perfn@axis.com>
 <1986554.RvkB0gC8kI@blindfold> <1531829331815.70807@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Per,

Am Dienstag, 17. Juli 2018, 14:08:51 CEST schrieb Per F=F6rlin:
> > To: Per F=F6rlin
> > Cc: linux-mtd@lists.infradead.org; Artem Bityutskiy; Per F=F6rlin
> > Subject: Re: [PATCH] UBI: Add volume read and write statistics
> >=20
> > Am Dienstag, 17. Juli 2018, 12:30:19 CEST schrieb Per Forlin:
> > > Simple read and write statistics.
> > > * Bytes read
> > > * Bytes written
> > > * Number of reads
> > > * Number of writes
> > >
> > > This is useful to find out how the storage is being utilized.
> > > For block devices this already exists via /proc/diskstats.
> > > The intention of this patch is to add similar stats
> > > for UBI as well.
> >=20
> > Why on UBI level and not MTD?
> In my case I wanted to evaluate the performance per volume. I have one MTD
> device with several UBI volumes. It would be sufficient to have it on
> an MTD level to see the overall storage usage.
> This would still be very helpful for me.
>=20
> Having it on an MTD level is of course more general.
> I wouldn't mind changing the patch to add the stats in mtdcore
> for mtd_read() and mtd_write()
>=20
> In case of MTD block devices the stats will be somewhat redundant with
> /proc/diskstats.
>=20
> Do you think I should update the patch to add MTD stats instead?

While having a cup of coffee I thought more about this.
Actually both, MTD and UBI makes sense.
The most important issue is that you integrate it with the existing disksta=
ts.
So instead of having our own interface feeding MTD/UBI stats into diskstats
would be nice. Did you look into that? I'm not sure how much work this woul=
d be.
That way users can use existing tools such as iostat...

Thanks,
//richard
