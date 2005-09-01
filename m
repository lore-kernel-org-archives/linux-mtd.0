Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EAogk-0004SI-JZ
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 09:01:21 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e3.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j81D14x3023682
	for <linux-mtd@lists.infradead.org>; Thu, 1 Sep 2005 09:01:04 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j81D14Nb104494
	for <linux-mtd@lists.infradead.org>; Thu, 1 Sep 2005 09:01:04 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j81D148Y024846
	for <linux-mtd@lists.infradead.org>; Thu, 1 Sep 2005 09:01:04 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050901125707.GA1623@wohnheim.fh-wedel.de>
References: <20050901120030.GB694@wohnheim.fh-wedel.de>
	<1125578756.4884.10.camel@localhost.localdomain>
	<20050901125707.GA1623@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Sep 2005 08:00:48 -0500
Message-Id: <1125579648.27733.2.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>,
	linux-mtd@lists.infradead.org
Subject: Re: PATCH: allow JFFS2 to write to really small disks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-09-01 at 14:57 +0200, Jörn Engel wrote:
> On Thu, 1 September 2005 14:45:56 +0200, Øyvind Harboe wrote:
> > On Thu, 2005-09-01 at 14:00 +0200, Jörn Engel wrote:
> > 
> > > > But who mounts a *tiny* JFFS2 volume except those that will be using it
> > > > as a WORM drive?
> > > 
> > > People making mistakes.  It is a very important usability issue to
> > > mark mistakes as such.  Making it appear as if everything is ok and
> > > having it fail later, possibly days or weeks later, is bad usability.
> > > 
> > > I would agree with you if the user-perceived behaviour was
> > > *immediatly* and *noticably* different.  But unless people write
> > > enough data to fill their fs, the difference may go unnoticed.
> > 
> > Sounds good.
> > 
> > If I get some indication that there is a consensus from
> > maintainers/committers to add this mount option, I'll go ahead and write
> > it up.
> 
> You're asking for too much. :)
> 
> Most of the time, most people just don't care.  If they actually do
> care and are opposed to your patch, they will speak up.  But you won't
> ever find out before actively trying to merge the patch.

I agree with Jörn on this point.  It should be a mount option.

Not that my opinion amounts to much... :)

josh
