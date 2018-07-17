Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffRd9-0000T5-Vj
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 15:11:13 +0000
From: Richard Weinberger <richard@nod.at>
To: Steve deRosier <derosier@gmail.com>
Cc: per.forlin@axis.com, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: Add volume read and write statistics
Date: Tue, 17 Jul 2018 17:10:59 +0200
Message-ID: <1886978.5HXsB66B85@blindfold>
In-Reply-To: <CALLGbRLOwfcHtDjZYDvKnzQ+-RbpgNF0qMjH+O8K=ktd42x6RA@mail.gmail.com>
References: <1531823419-8665-1-git-send-email-perfn@axis.com>
 <1531839678791.88043@axis.com>
 <CALLGbRLOwfcHtDjZYDvKnzQ+-RbpgNF0qMjH+O8K=ktd42x6RA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, 17. Juli 2018, 17:06:12 CEST schrieb Steve deRosier:
> > > While having a cup of coffee I thought more about this.
> > > Actually both, MTD and UBI makes sense.
> > > The most important issue is that you integrate it with the existing diskstats.
> > > So instead of having our own interface feeding MTD/UBI stats into diskstats
> > > would be nice. Did you look into that? I'm not sure how much work this would be.
> > > That way users can use existing tools such as iostat...
> > I actually started out looking for the information under diskstats,
> > then I learned it's only for block devices. I took a quick glance at
> > it before I went for the sys implementation instead. diskstats is
> > separated from the MTD and UBI stuff and I don't know if one can make a
> > connection to MTD/UBI somehow. I will take a closer look at this.
> 
> Perhaps it was "only for block devices" because no one ever
> implemented the necessary hooks in MTD or UBI?  I don't know the
> history, nor the information you found, just making a stab in the
> dark.
> 
> If UBI and/or MTD can provide the statistics that diskstats needs in a
> interpretation that makes sense, why not go that way?

Yeah, that's what I have in mind. Maybe we can easily teach diskstats
about MTD.

Thanks,
//richard
