Received: from ns5a.townisp.com ([216.195.0.139] helo=ns5.townisp.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BAvcT-0004MF-J1
	for linux-mtd@lists.infradead.org; Tue, 06 Apr 2004 19:48:21 +0100
Date: Tue, 6 Apr 2004 14:48:16 -0400 (EDT)
From: Jamie Guinan <guinan@bluebutton.com>
To: Thayne Harbaugh <tharbaugh@lnxi.com>
In-Reply-To: <1081193953.4799.185.camel@tubarao>
Message-ID: <Pine.LNX.4.44.0404061438150.7366-100000@gemini.home.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: SST 39VF1601
Reply-To: Jamie Guinan <guinan@bluebutton.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5 Apr 2004, Thayne Harbaugh wrote:

> > > >                   [2] = MTD_UADDR_UNNECESSARY,
> > > >                 },
> > > >                 .DevSize        = SIZE_128KiB,
> > > >                 .CmdSet         = P_ID_AMD_STD,
> > > >                 .NumEraseRegions= 1,
> > > >                 .regions        = {
> > > >                         ERASEINFO(0x01000,64),
> > > 
> > > Shouldn't this be ERASEINFO(0x00800, 64)?
> > 
> > The chip supports 2k sector or 32k block erase, so I think either of
> > ERASEINFO(0x00800,1024) ERASEINFO(0x08000,64) or should work.
> 
> I might be particularly dense today (it's happened before 8^).  I just
> re-read and the size is 2k words which is ERASEINFO(0x01000,512):
> 
> 0x01000 Bytes = 2**12 Bytes = 4 KiB
> 4 KiB * 512 = 2 MiB = 16 Mib
> -or-
> 512 = 2**9
> 2**12 Bytes * 2**9 = 2**21 = 2 MiB = 16 Mib
>
> Shouldn't .DevSize be SIZE_2MiB?  Isn't the part 16 Mib = 2 MiB?

Right on both counts there.  I was thinking the first arg of ERASEINFO was
words not bytes, and I hadn't thought about .DevSize yet.

So, I put in these changes, used "mkfs.jffs2 -e 8192 ..." to create a
JFFS2 file system (4KiB x 2 = 8KiB), flashed that via JTAG, and I am now
up and running just fine,

  Probing "LPD7A400-10 Flash" at physical address 0x00000000
  Search for id:(6a 8d) interleave(2) type(2)
  Search for id:(bf 234b) interleave(2) type(2)
  Found: SST 39VF1601
  LPD7A400-10 Flash: Found 2 x16 devices at 0x0 in 32-bit mode
  number of JEDEC chips: 1

Btw, this is still jedec_probe.c v1.29.  I will try 1.45 later, and post a
patch for this SST part against that version if I get it working.

Thanks again for your help!
-Jamie
