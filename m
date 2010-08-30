Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq0Uh-0002xz-1q
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 09:17:35 +0000
Received: by gwb10 with SMTP id 10so2357282gwb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 02:17:34 -0700 (PDT)
Subject: RE: Is repartitioning possible while one of the partitions is mounted?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
In-Reply-To: <000001cb4821$3d913c00$b8b3b400$%hs@samsung.com>
References: <1280755953.2174.24.camel@pc816>
	<1282637086.24044.133.camel@localhost>
	<000001cb4821$3d913c00$b8b3b400$%hs@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 12:17:27 +0300
Message-ID: <1283159847.12995.28.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: v.dalal@samsung.com, 'Tim Cussins' <timcussins@eml.cc>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-30 at 14:26 +0530, Rohit Hassan Sathyanarayan wrote:
> Hi Artem
> 
> > -----Original Message-----
> > From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf
> > Of Artem Bityutskiy
> > Sent: Tuesday, August 24, 2010 1:35 PM
> > To: Tim Cussins
> > Cc: linux-mtd@lists.infradead.org
> > Subject: Re: Is repartitioning possible while one of the partitions is mounted?
> > 
> > On Mon, 2010-08-02 at 14:32 +0100, Tim Cussins wrote:
> > > Hi all,
> > >
> > > I just spotted post regarding upcoming Runtime Partitioning Support
> > > (http://lists.infradead.org/pipermail/linux-mtd/2010-July/031200.html)
> > >
> > > After taking a cursory glance at the patch it's not immediately obvious
> > > ( uh, to me anyway :D ) whether you can create/delete partitions while
> > > a filesystem (e.g. rootfs) is mounted from another partition on the same
> > > mtd device.
> > >
> > > Under what conditions can you create/delete partitions?
> > 
> > I guess it is good idea to put the authors of that patch in CC, no?
> > 
> > I think this case should be handled. If it is not, the solution is not
> > very good. But this is just IMHO.
> > 
> Its possible to partition/delete/resize the other partitions of the device even
> if rootfs is mounted on one partition.
> The utility even gives freedom to change the permissions of the partitions and 
> merging adjacent partitions apart from above features.

Why the merge operation is needed? Why is it better than delete + delete
+ create? I also sent you another e-mail with questions + some review.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
