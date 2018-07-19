Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fg61R-0006c1-DO
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 10:18:59 +0000
From: =?iso-8859-1?Q?Per_F=F6rlin?= <per.forlin@axis.com>
To: Richard Weinberger <richard@nod.at>, Steve deRosier <derosier@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Artem
 Bityutskiy" <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: Add volume read and write statistics
Date: Thu, 19 Jul 2018 10:18:43 +0000
Message-ID: <1531995523724.17025@axis.com>
References: <1531823419-8665-1-git-send-email-perfn@axis.com>
 <1531839678791.88043@axis.com>
 <CALLGbRLOwfcHtDjZYDvKnzQ+-RbpgNF0qMjH+O8K=ktd42x6RA@mail.gmail.com>,
 <1886978.5HXsB66B85@blindfold>, <1531945071019.9858@axis.com>
In-Reply-To: <1531945071019.9858@axis.com>
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

> > Am Dienstag, 17. Juli 2018, 17:06:12 CEST schrieb Steve deRosier:=0A=
> > > > > While having a cup of coffee I thought more about this.=0A=
> > > > > Actually both, MTD and UBI makes sense.=0A=
> > > > > The most important issue is that you integrate it with the existi=
ng diskstats.=0A=
> > > > > So instead of having our own interface feeding MTD/UBI stats into=
 diskstats=0A=
> > > > > would be nice. Did you look into that? I'm not sure how much work=
 this would be.=0A=
> > > > > That way users can use existing tools such as iostat...=0A=
> > > > I actually started out looking for the information under diskstats,=
=0A=
> > > > then I learned it's only for block devices. I took a quick glance a=
t=0A=
> > > > it before I went for the sys implementation instead. diskstats is=
=0A=
> > > > separated from the MTD and UBI stuff and I don't know if one can ma=
ke a=0A=
> > > > connection to MTD/UBI somehow. I will take a closer look at this.=
=0A=
> > >=0A=
> > > Perhaps it was "only for block devices" because no one ever=0A=
> > > implemented the necessary hooks in MTD or UBI?  I don't know the=0A=
> > > history, nor the information you found, just making a stab in the=0A=
> > > dark.=0A=
> > >=0A=
> > > If UBI and/or MTD can provide the statistics that diskstats needs in =
a=0A=
> > > interpretation that makes sense, why not go that way?=0A=
> >=0A=
> > Yeah, that's what I have in mind. Maybe we can easily teach diskstats=
=0A=
> > about MTD.=0A=
> Now I got the chance to look at this again. It's not as bad as I thought.=
=0A=
> The diskstats simply takes the block class and iterate over all devices.=
=0A=
> For each device statistics are printed out.=0A=
> It should be possible to do the same for the MTD class and the UBI class.=
=0A=
> So far I haven't tested anything just reading code.=0A=
> Then it's a matter of taste. Is MTD and UBI stats welcome in genhd.c?=0A=
> =0A=
> I will try to find time the coming days or so to make a prove of concept=
=0A=
> implementation to get a better idea of how big the change would be.=0A=
I made one observation. The stats in disktats also exists under=0A=
/sys/class/block for every device.=0A=
Actually it's the stat under /sys that is also available in diskstats.=0A=
=0A=
For instance:=0A=
cat /sys/class/block/sda/stat =0A=
220       86    10682      830       14        4      128      110=0A=
0      680      940=0A=
This format is documented in iostats.txt=0A=
=0A=
The first step could be to only add it under /sys/class/ubi=0A=
and /sys/class/mtd.=0A=
I'm not sure how to add all these metrics my patch only adds 4 of them.=0A=
"Unsupported values" could be set to 0 for now.=0A=
I will continue to think about how to integrate with diskstats but=0A=
I'm also in favor of adding this support in incremental steps.=0A=
