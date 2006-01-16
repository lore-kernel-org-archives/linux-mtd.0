Received: from wproxy.gmail.com ([64.233.184.205])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EyVUb-0002Kf-9k
	for linux-mtd@lists.infradead.org; Mon, 16 Jan 2006 09:38:03 -0500
Received: by wproxy.gmail.com with SMTP id i2so1084049wra
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Jan 2006 06:37:53 -0800 (PST)
Message-ID: <e02f82380601160637q568bebecx5ba0cf22ed92be26@mail.gmail.com>
Date: Mon, 16 Jan 2006 09:37:53 -0500
From: Ron Kundla <rkundla@gmail.com>
To: alfred hitch <alfred.hitch@gmail.com>
In-Reply-To: <29f916510601151950u54c41a4ay426b12a523b5df11@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <e02f82380601130813y57900b8do909d942d48ad4da5@mail.gmail.com>
	<29f916510601151950u54c41a4ay426b12a523b5df11@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Any reported mtd issues with Intel Strataflash TE28F128 J3D75?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alfred,

I've looked at the data sheet for the J3D part and it is identical or
faster than the J3C part. Intel also states that the J3D part is
functionally equivalent to the J3C.

We are trying to determine through our vendor if the parts we have
received were engineering samples. There has been some talk that some
of the sample parts were dysfunctional.

Ron

On 1/15/06, alfred hitch <alfred.hitch@gmail.com> wrote:
> Hi Ron,
>
> Even we are observing random  write errors (say when we use netflash
> to put imgaes / upgrade) ..
> not been able to identify any pattern yet ..
> We get something like SR.4 bit set <blah blah>
>
> Infact, I was about to check timings etc in mtd code vis a vis errata
> intel published and the datasheet addendum ..
> Have you already done that exercise (will save time for us / we can
> split work ) ..  ?
>
> We have also observed a consistent MTD read only file system crib, at
> a certian block sector, its not locked or anything .. any such
> observation by you ?
>
> We just finished our exercise to lock flash etc because of some random
> flash corruptions we were observing and am trying to convince hardware
> chap for early shift to j3 ver d .. somehow looks more stable to me
> (not just that it's  just the only choice anways in future)
>
> Regards,
> Alfred
>
> On 1/13/06, Ron Kundla <rkundla@gmail.com> wrote:
> > Hello!
> >
> > A board I work on is moving from the TE28F128 J3C150 to the TE28F128
> > J3D75 because the J3C parts are going obsolete. According to the Intel
> > migration guide, the J3D part is a drop in replacement for the J3C
> > with a couple of exceptions, such as a change when reading the block
> > locking configuration identifier codes (J3D uses 0x0000/0x0001 versus
> > J3C using 0xFFFC/0xFFFF) and some minor detail about the Enhanced
> > Configuration Register (ECR).
> >
> > I am using the mtd driver from the 2.4.20 build of Linux (hisses from
> > the crowd using old kernel) and the problems I am seeing with the new
> > flash is I get *sporadic* errors on the write cycle. Reading and
> > erasing seem to work okay.
> >
> > I've checked my chip select timings and they are in spec for the J3C
> > part which is okay also for the J3D part.
> >
> > I appreciate any insight you all might have.
> >
> > Regards,
> > Ron Kundla
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
>
