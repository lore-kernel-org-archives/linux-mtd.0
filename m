Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffOmv-0008DY-H9
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 12:09:07 +0000
From: =?iso-8859-1?Q?Per_F=F6rlin?= <per.forlin@axis.com>
To: Richard Weinberger <richard@nod.at>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Artem
 Bityutskiy" <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: Add volume read and write statistics
Date: Tue, 17 Jul 2018 12:08:51 +0000
Message-ID: <1531829331815.70807@axis.com>
References: <1531823419-8665-1-git-send-email-perfn@axis.com>,
 <1986554.RvkB0gC8kI@blindfold>
In-Reply-To: <1986554.RvkB0gC8kI@blindfold>
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

> To: Per F=F6rlin=0A=
> Cc: linux-mtd@lists.infradead.org; Artem Bityutskiy; Per F=F6rlin=0A=
> Subject: Re: [PATCH] UBI: Add volume read and write statistics=0A=
> =0A=
> Am Dienstag, 17. Juli 2018, 12:30:19 CEST schrieb Per Forlin:=0A=
> > Simple read and write statistics.=0A=
> > * Bytes read=0A=
> > * Bytes written=0A=
> > * Number of reads=0A=
> > * Number of writes=0A=
> >=0A=
> > This is useful to find out how the storage is being utilized.=0A=
> > For block devices this already exists via /proc/diskstats.=0A=
> > The intention of this patch is to add similar stats=0A=
> > for UBI as well.=0A=
> =0A=
> Why on UBI level and not MTD?=0A=
In my case I wanted to evaluate the performance per volume. I have one MTD=
=0A=
device with several UBI volumes. It would be sufficient to have it on=0A=
an MTD level to see the overall storage usage.=0A=
This would still be very helpful for me.=0A=
=0A=
Having it on an MTD level is of course more general.=0A=
I wouldn't mind changing the patch to add the stats in mtdcore=0A=
for mtd_read() and mtd_write()=0A=
=0A=
In case of MTD block devices the stats will be somewhat redundant with=0A=
/proc/diskstats.=0A=
=0A=
Do you think I should update the patch to add MTD stats instead?=0A=
