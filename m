Received: from tiger.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17twkh-0001mw-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 21:57:51 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: "Nick Bane" <nick@cecomputing.co.uk>,
	"Marc Singer" <elf@buici.com>
Subject: Re: Interest in DOC and YAFFS?
Date: Wed, 25 Sep 2002 08:53:57 +1200
Cc: <linux-mtd@lists.infradead.org>, <yaffs@toby-churchill.org>
References: <200209231220.12682.ayalon@tadlys.com> <20020924165521.GB2533@buici.com> <012801c263f7$784e6230$0100a8c0@p450>
In-Reply-To: <012801c263f7$784e6230$0100a8c0@p450>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020924205746.837BF43CF@tiger.actrix.co.nz>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> > > How this works with DOC I am unclear as I had noticed a while back that
> > > there was hardware assisted ECC. This might get in the way of YAFFS ECC
>
> but
>
> > > maybe this can be circumvented.
> >
> > As far as I can tell, the hardware ECC just makes the DOC faster.
>
> Umm. It may use some of the oob data area for its own ECC in a YAFFS
> incompatible way. I am not sure of my ground here, only that you need to
> check it out.
>
> > Also, I think that Microsys has released information about how to use
> > the hardware ECC.
>
> Ok.

Determining, then straightening out, OOB conflicts is essetially what DOC 
support boils down to.

As far as I am aware, the ECC does not actually impact on the NAND and works 
something like as follows.
* As you write bytes to the NAND buffer, an ECC is calculated on the side in 
the ASIC.
* You can then read ASIC registers to determine the ECC.

Essentially you can just ignore the ECC and see raw NAND chips, ie the ECC is 
non-intrusive.

Thus, the current YAFFS page programming would change from something like:

* Calculate ecc. + tags and format up OOB (spare)
* Write data + oob
* Program page

to:

* Write data
* Read ECC from ASIC
* Format up and write oob.
* Program page

Essentially, the hw ecc saves the ecc calcs - that's all.

Christian Gan has implemented a hw ecc scheme which I think is like above in 
YAFFS, so I suspect DOC support might almost be done :-).

-- Charles
