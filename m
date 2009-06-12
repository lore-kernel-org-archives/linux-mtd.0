Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MEzMY-0002eU-NK
	for linux-mtd@lists.infradead.org; Fri, 12 Jun 2009 05:31:45 +0000
Subject: Re: [PATCH 1/3 v2] [MTD-UTILS] Unified reading from standard input
	and from file
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jehan Bing <jehan@orb.com>
In-Reply-To: <4A31424D.802@orb.com>
References: <h0k3il$ij6$1@ger.gmane.org>
	<1244551983.5847.388.camel@localhost.localdomain>	<4A2E98BD.30704@orb.com>
	<h0mppp$7v2$1@ger.gmane.org>
	<1244705541.5847.412.camel@localhost.localdomain>
	<4A31424D.802@orb.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 12 Jun 2009 08:30:48 +0300
Message-Id: <1244784648.5847.444.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-06-11 at 10:43 -0700, Jehan Bing wrote:
> > The patches look OK to me, but I do not have time to review them very
> > really well. So would it please be possible to describe how you tested
> > them to convince me they are ok? Then I'd push them to mtd-utils.git
> > tree. Did you test writing with/without oob, from file/stdin, etc?
> >
> > Thanks
> 
> For the tests, I used the nandsim driver and 
> "eraseall-nandwrite-nanddump-md5sum". I did  a first one with the 
> official nandwrite from Ubuntu as a reference, then tried different 
> options with my changes.
> 
> And here the same patch with a couple of blank lines removed and a 
> comment moved. I forgot the regenerate it with the others after cleaning 
> up the code. The third patch won't apply without it.

Sorry, I still feel a little bit unsure. Could you please test it
like this:

1. Compile nandwrite1 which excludes these 4 changes;
2. Compile nandwrite2 which includes these 4 changes;
3. Make sure things which work with nandwrite1 also work with
   nandwrite2. Namely:
   a. writing an image
   b. writing an image from stdin
   c. writing an image with oob
   d. writing an image with oob with stdin
4. Then test how nandwrite2 reacts on badblocks - use the 'weakblocks'
   parameter of nandsim for this (see modinfo nandsim).
5. Test now nandwrite2 reacts on write failures - use 'weakpages'
   nandsim argument

Could this please be done to make sure nandwrite does not have
regressions but only has improvement? Sorry for being PITA.

Thanks!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
