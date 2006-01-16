Received: from wproxy.gmail.com ([64.233.184.195])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EyLOJ-0003KK-Tt
	for linux-mtd@lists.infradead.org; Sun, 15 Jan 2006 22:50:53 -0500
Received: by wproxy.gmail.com with SMTP id i1so1059374wra
	for <linux-mtd@lists.infradead.org>;
	Sun, 15 Jan 2006 19:50:42 -0800 (PST)
Message-ID: <29f916510601151950u54c41a4ay426b12a523b5df11@mail.gmail.com>
Date: Sun, 15 Jan 2006 22:50:41 -0500
From: alfred hitch <alfred.hitch@gmail.com>
To: Ron Kundla <rkundla@gmail.com>
In-Reply-To: <e02f82380601130813y57900b8do909d942d48ad4da5@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <e02f82380601130813y57900b8do909d942d48ad4da5@mail.gmail.com>
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

Hi Ron,

Even we are observing random  write errors (say when we use netflash
to put imgaes / upgrade) ..
not been able to identify any pattern yet ..
We get something like SR.4 bit set <blah blah>

Infact, I was about to check timings etc in mtd code vis a vis errata
intel published and the datasheet addendum ..
Have you already done that exercise (will save time for us / we can
split work ) ..  ?

We have also observed a consistent MTD read only file system crib, at
a certian block sector, its not locked or anything .. any such
observation by you ?

We just finished our exercise to lock flash etc because of some random
flash corruptions we were observing and am trying to convince hardware
chap for early shift to j3 ver d .. somehow looks more stable to me
(not just that it's  just the only choice anways in future)

Regards,
Alfred

On 1/13/06, Ron Kundla <rkundla@gmail.com> wrote:
> Hello!
>
> A board I work on is moving from the TE28F128 J3C150 to the TE28F128
> J3D75 because the J3C parts are going obsolete. According to the Intel
> migration guide, the J3D part is a drop in replacement for the J3C
> with a couple of exceptions, such as a change when reading the block
> locking configuration identifier codes (J3D uses 0x0000/0x0001 versus
> J3C using 0xFFFC/0xFFFF) and some minor detail about the Enhanced
> Configuration Register (ECR).
>
> I am using the mtd driver from the 2.4.20 build of Linux (hisses from
> the crowd using old kernel) and the problems I am seeing with the new
> flash is I get *sporadic* errors on the write cycle. Reading and
> erasing seem to work okay.
>
> I've checked my chip select timings and they are in spec for the J3C
> part which is okay also for the J3D part.
>
> I appreciate any insight you all might have.
>
> Regards,
> Ron Kundla
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
