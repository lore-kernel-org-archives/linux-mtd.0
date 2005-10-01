Received: from wproxy.gmail.com ([64.233.184.205])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ELVOW-0001vi-0T
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 20:38:36 -0400
Received: by wproxy.gmail.com with SMTP id i20so18456wra
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 Sep 2005 17:38:26 -0700 (PDT)
Message-ID: <9b7ca6570509301738q4a130642x4a87792d6879525a@mail.gmail.com>
Date: Sat, 1 Oct 2005 09:38:26 +0900
From: Daniel Ann <ktdann@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050930092409.GA19495@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <9b7ca6570509300036r47c410a4la8f8598794a17041@mail.gmail.com>
	<20050930092409.GA19495@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problem partitioning discontinuous physical start address
Reply-To: Daniel Ann <ktdann@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey Jorn,

I was thinking concat must be doing something along this line but I
have tried it as I couldnt get any doc's on how to use it with command
line partition table parsing.
Or even setting it up with using make menuconfig.

Any hints on this please ?

Thanks.

On 9/30/05, J=F6rn Engel <joern@wohnheim.fh-wedel.de> wrote:
> On Fri, 30 September 2005 16:36:06 +0900, Daniel Ann wrote:
> >
> > Im trying to partion my flash using partioning support (ie. parse
> > partition from the kernel argument) but for board with 2x intel flash
> > linearly connected, I can partition it no problem.
> >
> > Problem exist with board with 2x intel flash (16MB each) non-linearly c=
onnected.
> > One is located at 0x7C00_0000 and another at 0xFF00_0000. If I give
> > 0x7C00_0000 as a physical start address with length as 0x84000000 (ie.
> > (0xFFFF_FFFF - 7C00_0000) + 1)and select support for non-linear
> > mappings of flash chips, I get an error saying that its too large.
> >
> > What options do I have without having to write my own physmap.c. I've
> > had one before when I was using 2.4 kernel, but having moved to 2.6,
> > I'm trying not to make any custom changes and trying to stick with the
> > main stream.
> >
> > Any advice would be welcome. thanks.
>
> You could try concat.  iirc, it was created for this purpose.
>
> J=F6rn
>
> --
> "Error protection by error detection and correction."
> -- from a university class
>


--
Daniel
