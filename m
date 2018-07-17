Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffRTp-0003Vn-D1
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 15:01:36 +0000
From: =?iso-8859-1?Q?Per_F=F6rlin?= <per.forlin@axis.com>
To: Richard Weinberger <richard@nod.at>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Artem
 Bityutskiy" <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: Add volume read and write statistics
Date: Tue, 17 Jul 2018 15:01:18 +0000
Message-ID: <1531839678791.88043@axis.com>
References: <1531823419-8665-1-git-send-email-perfn@axis.com>
 <1986554.RvkB0gC8kI@blindfold>
 <1531829331815.70807@axis.com>,<2086360.zJZoXgJm6x@blindfold>
In-Reply-To: <2086360.zJZoXgJm6x@blindfold>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Richard for your feedback,=0A=
=0A=
> ________________________________________=0A=
> From: Richard Weinberger <richard@nod.at>=0A=
> Sent: Tuesday, July 17, 2018 4:34 PM=0A=
> To: Per F=F6rlin=0A=
> Cc: linux-mtd@lists.infradead.org; Artem Bityutskiy=0A=
> Subject: Re: [PATCH] UBI: Add volume read and write statistics=0A=
> =0A=
> Per,=0A=
> =0A=
> Am Dienstag, 17. Juli 2018, 14:08:51 CEST schrieb Per F=F6rlin:=0A=
> > > To: Per F=F6rlin=0A=
> > > Cc: linux-mtd@lists.infradead.org; Artem Bityutskiy; Per F=F6rlin=0A=
> > > Subject: Re: [PATCH] UBI: Add volume read and write statistics=0A=
> > >=0A=
> > > Am Dienstag, 17. Juli 2018, 12:30:19 CEST schrieb Per Forlin:=0A=
> > > > Simple read and write statistics.=0A=
> > > > * Bytes read=0A=
> > > > * Bytes written=0A=
> > > > * Number of reads=0A=
> > > > * Number of writes=0A=
> > > >=0A=
> > > > This is useful to find out how the storage is being utilized.=0A=
> > > > For block devices this already exists via /proc/diskstats.=0A=
> > > > The intention of this patch is to add similar stats=0A=
> > > > for UBI as well.=0A=
> > >=0A=
> > > Why on UBI level and not MTD?=0A=
> > In my case I wanted to evaluate the performance per volume. I have one =
MTD=0A=
> > device with several UBI volumes. It would be sufficient to have it on=
=0A=
> > an MTD level to see the overall storage usage.=0A=
> > This would still be very helpful for me.=0A=
> >=0A=
> > Having it on an MTD level is of course more general.=0A=
> > I wouldn't mind changing the patch to add the stats in mtdcore=0A=
> > for mtd_read() and mtd_write()=0A=
> >=0A=
> > In case of MTD block devices the stats will be somewhat redundant with=
=0A=
> > /proc/diskstats.=0A=
> >=0A=
> > Do you think I should update the patch to add MTD stats instead?=0A=
> =0A=
> While having a cup of coffee I thought more about this.=0A=
> Actually both, MTD and UBI makes sense.=0A=
> The most important issue is that you integrate it with the existing disks=
tats.=0A=
> So instead of having our own interface feeding MTD/UBI stats into disksta=
ts=0A=
> would be nice. Did you look into that? I'm not sure how much work this wo=
uld be.=0A=
> That way users can use existing tools such as iostat...=0A=
I actually started out looking for the information under diskstats,=0A=
then I learned it's only for block devices. I took a quick glance at=0A=
it before I went for the sys implementation instead. diskstats is=0A=
separated from the MTD and UBI stuff and I don't know if one can make a=0A=
connection to MTD/UBI somehow. I will take a closer look at this.=0A=
