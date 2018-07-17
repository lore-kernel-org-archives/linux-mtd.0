Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffRZ7-00066Y-0O
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 15:07:04 +0000
Received: by mail-it0-x242.google.com with SMTP id 198-v6so2343790ite.4
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2018 08:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <1531823419-8665-1-git-send-email-perfn@axis.com>
 <1986554.RvkB0gC8kI@blindfold> <1531829331815.70807@axis.com>
 <2086360.zJZoXgJm6x@blindfold> <1531839678791.88043@axis.com>
In-Reply-To: <1531839678791.88043@axis.com>
From: Steve deRosier <derosier@gmail.com>
Date: Tue, 17 Jul 2018 08:06:12 -0700
Message-ID: <CALLGbRLOwfcHtDjZYDvKnzQ+-RbpgNF0qMjH+O8K=ktd42x6RA@mail.gmail.com>
Subject: Re: [PATCH] UBI: Add volume read and write statistics
To: per.forlin@axis.com
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 17, 2018 at 8:01 AM Per F=C3=B6rlin <per.forlin@axis.com> wrote=
:
>
> Thanks Richard for your feedback,
>
> > ________________________________________
> > From: Richard Weinberger <richard@nod.at>
> > Sent: Tuesday, July 17, 2018 4:34 PM
> > To: Per F=C3=B6rlin
> > Cc: linux-mtd@lists.infradead.org; Artem Bityutskiy
> > Subject: Re: [PATCH] UBI: Add volume read and write statistics
> >
> > Per,
> >
> > Am Dienstag, 17. Juli 2018, 14:08:51 CEST schrieb Per F=C3=B6rlin:
> > > > To: Per F=C3=B6rlin
> > > > Cc: linux-mtd@lists.infradead.org; Artem Bityutskiy; Per F=C3=B6rli=
n
> > > > Subject: Re: [PATCH] UBI: Add volume read and write statistics
> > > >
> > > > Am Dienstag, 17. Juli 2018, 12:30:19 CEST schrieb Per Forlin:
> > > > > Simple read and write statistics.
> > > > > * Bytes read
> > > > > * Bytes written
> > > > > * Number of reads
> > > > > * Number of writes
> > > > >
> > > > > This is useful to find out how the storage is being utilized.
> > > > > For block devices this already exists via /proc/diskstats.
> > > > > The intention of this patch is to add similar stats
> > > > > for UBI as well.
> > > >
> > > > Why on UBI level and not MTD?
> > > In my case I wanted to evaluate the performance per volume. I have on=
e MTD
> > > device with several UBI volumes. It would be sufficient to have it on
> > > an MTD level to see the overall storage usage.
> > > This would still be very helpful for me.
> > >
> > > Having it on an MTD level is of course more general.
> > > I wouldn't mind changing the patch to add the stats in mtdcore
> > > for mtd_read() and mtd_write()
> > >
> > > In case of MTD block devices the stats will be somewhat redundant wit=
h
> > > /proc/diskstats.
> > >
> > > Do you think I should update the patch to add MTD stats instead?
> >
> > While having a cup of coffee I thought more about this.
> > Actually both, MTD and UBI makes sense.
> > The most important issue is that you integrate it with the existing dis=
kstats.
> > So instead of having our own interface feeding MTD/UBI stats into disks=
tats
> > would be nice. Did you look into that? I'm not sure how much work this =
would be.
> > That way users can use existing tools such as iostat...
> I actually started out looking for the information under diskstats,
> then I learned it's only for block devices. I took a quick glance at
> it before I went for the sys implementation instead. diskstats is
> separated from the MTD and UBI stuff and I don't know if one can make a
> connection to MTD/UBI somehow. I will take a closer look at this.

Perhaps it was "only for block devices" because no one ever
implemented the necessary hooks in MTD or UBI?  I don't know the
history, nor the information you found, just making a stab in the
dark.

If UBI and/or MTD can provide the statistics that diskstats needs in a
interpretation that makes sense, why not go that way?

- Steve
