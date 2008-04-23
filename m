Date: Wed, 23 Apr 2008 18:28:00 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Abel Bernabeu <abelbg@m2grp.com>, nico@cam.org
Subject: Re: PATCH: solving a hang while waiting in FL_STATUS
In-Reply-To: <15577be70804230935q252b90a5td60b9a7de1d2da46@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0804231752580.5221@pentafluge.infradead.org>
References: <15577be70804230157g35941393m599fd5fc2ad895c3@mail.gmail.com>
	<1208946790.9212.782.camel@pmac.infradead.org>
	<Pine.LNX.4.64.0804231408140.28908@pentafluge.infradead.org>
	<15577be70804230935q252b90a5td60b9a7de1d2da46@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, abel.bernabeu@gmail.com,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Abel,

> >  > > I am experimenting an infinite loop problem happening at
> >  > > cfi_cmdset_0001.c:chip_ready.
> >  > >
> >  > > Some kind of timeout while waiting  in FL_STATUS should be included.
> >  > > Indeed, this timeout feature is not new at all.
> >  > >
> >  > > The feature was present in 2.6.23.17 but disappeared in 2.6.24 (after
> >  > > some refactoring work easily perceptible).
> >  >
> >  > Hm. This was removed in commit 5a37cf19:
> >  >       Fix deadlock in Intel chip driver caused by get_chip recursion
> >  >
> >  > Alexey, can you explain why you removed it? Abel's patch simply adds
> >  > this back where it was. That looks reasonable to me, so I'd like to know
> >  > if I've missed some reason why it shouldn't be there...
> >  >
> >  >
> >
> > Yes. I can explain. I removed it because just simple adding timeout
> >  won't work. Please look at the code after patch applying (solving a hang while waiting in FL_STATUS). Time_after will never occur:
> 
> 
> Alexey, you are rigth... the patch did nothing, but the attached one
> does the correct thing (discard the previous one).
> 
> Believe me, it is not a good idea to return -EAGAIN and let get_chip
> to iterate forever (was my case).
> 
> I have added a timeout parameter to get_chip. It is a dirty solution
> but I cannot redesign that piece of code since I did not wrote it and
> I could introduce serious bugs.
> 
Exactly. Don't use this patch. Timeo is added but conditions when it is
neccesary to drop timeo are not defined. Get_chip may work for very long time if
suspend operations are enabled. As result you may easily face return -EIO by timeo
when it should not be!
> Image you have a broken sector which will never respond... that could
> hang the process while unlocking the sectors of a partition. In my
> case the problem prevents our board to complete the kernel start-up.
>
In fact this situation occurs in really bad case. Why you have broken
sector on NOR?!  
 
I may try to find a way to introduce watchdog timer here. Your
suggestions to fix it are also quite welcome!

Thanks,
Alexey
