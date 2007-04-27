Received: from mu-out-0910.google.com ([209.85.134.188])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HhQlh-00017c-56
	for linux-mtd@lists.infradead.org; Fri, 27 Apr 2007 09:46:35 -0400
Received: by mu-out-0910.google.com with SMTP id w1so1005198mue
	for <linux-mtd@lists.infradead.org>;
	Fri, 27 Apr 2007 06:45:47 -0700 (PDT)
Message-ID: <625fc13d0704270645w724d9ebdvbb11be657eb5e0a7@mail.gmail.com>
Date: Fri, 27 Apr 2007 08:45:47 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Matthieu CASTET" <matthieu.castet@parrot.fr>
Subject: Re: FAT file system on NAND flash memory
In-Reply-To: <4631F17B.3080204@parrot.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20070412134137.GA25860@pooky.senux.com>
	<625fc13d0704120655u2f452b12ge9315f47b951aa34@mail.gmail.com>
	<4631F17B.3080204@parrot.fr>
Cc: linux-mtd@lists.infradead.org, Seongsu Lee <senux@senux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/27/07, Matthieu CASTET <matthieu.castet@parrot.fr> wrote:
> Hi,
>
> Josh Boyer a =E9crit :
> > On 4/12/07, Seongsu Lee <senux@senux.com> wrote:
> >> Hi,
> >>
> >> In my knowledge, mtdblock.c must be used to use
> >> FAT filesystem on bare NAND flash memories
> >> because NFTL is made only for a specific hardware,
> >> DiskOnChip.
> >>
> >> (Layer 0) VFS
> >> (Layer 1) FAT (or EXT2, EXT3)
> >> (Layer 2) mtdblock.c (nftl.c can be used only with DiskOnChip)
> >> (Layer 3) NAND flash memory driver (vendor specific)
> >> (Layer 4) Physical NAND flash memory
> >>
> >> Please let me know if it is wrong.
> >
> > That layering is correct, but your results will be bad.  mtdblock
> > doesn't handle bad blocks.  So if you have one in the middle of your
> > filesystem, it will break things.  You need some kind of translation
> > layer if you're going to use NAND.
> >
> But UBI could be used between nand and mtdblock ?

Yep, indeed it can.

josh
