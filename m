Received: from pony1.arc.nasa.gov ([128.102.31.31] helo=mail.arc.nasa.gov)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19EEMm-0005Fo-Uv
	for <linux-mtd@lists.infradead.org>; Fri, 09 May 2003 21:21:17 +0100
Message-Id: <5.1.1.5.2.20030509131915.015142c0@mail.arc.nasa.gov>
Date: Fri, 09 May 2003 13:23:53 -0700
To: "Matthew Dharm" <mdharm@momenco.com>
From: "Edward A. Hildum" <ehildum@mail.arc.nasa.gov>
In-Reply-To: <NEBBLJGMNKKEEMNLHGAIEEGEDAAA.mdharm@momenco.com>
References: <1052498905.9960.8.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
cc: linux-mtd@lists.infradead.org
Subject: RE: DiskOnChip 2000 128Mb problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I had a similar experience using a DOC 2000 TSOP 256M part.  Its chip ID is 
0x30, which is right for a Millenium part, even though it has a DOC 2000 
part number.  The part also has an IPL which can be updated like Millenium 
parts.

Ted Hildum

At 09:58 AM 5/9/2003 -0700, you wrote:
> > -----Original Message-----
> > From: David Woodhouse [mailto:dwmw2@infradead.org]
> > Sent: Friday, May 09, 2003 9:48 AM
> > To: Matthew Dharm
> > Cc: linux-mtd@lists.infradead.org
> > Subject: RE: DiskOnChip 2000 128Mb problem
> >
> >
> > On Fri, 2003-05-09 at 17:40, Matthew Dharm wrote:
> > > Is it normal for a DoC 2000 to be detected as a Millenium?
> >
> > No, but it's not normal for its contents to be read back as
> > 0x01 0x02
> > 0x03 etc. either: )
>
>Okay, so we're all on the same page.
>
> > > I've already checked the bus width and timing.
> >
> > And it's definitely not set to 16-bit? -ECONFUSED.
>
>No kidding.  I'm hoping the docs will have something useful, and I'm
>about to pull out the bus analyizer.
>
>
>Matt
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
