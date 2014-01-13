Received: from mail-la0-x229.google.com ([2a00:1450:4010:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2gV1-0005Th-C9
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 12:20:12 +0000
Received: by mail-la0-f41.google.com with SMTP id mc6so1310663lab.0
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2014 04:19:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1388753970.25123.124.camel@sauron.fi.intel.com>
References: <20980858CB6D3A4BAE95CA194937D5E73EA5DBFA@DBDE04.ent.ti.com>
 <1388753970.25123.124.camel@sauron.fi.intel.com>
Date: Mon, 13 Jan 2014 17:49:42 +0530
Message-ID: <CAEhpT-W-aBkackmUb860vex2LxGzkBQ6hu1KGvUzjmTWTeQgxg@mail.gmail.com>
Subject: Re: UBIFS seeing corrupt blank pages when image flashed via u-boot
From: Calvin Johnson <linux.cj@gmail.com>
To: artem.bityutskiy@linux.intel.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Jan 3, 2014 at 6:29 PM, Artem Bityutskiy
<artem.bityutskiy@linux.intel.com> wrote:
>
> Hi Pekon,
>
> On Fri, 2014-01-03 at 11:45 +0000, Gupta, Pekon wrote:
> > *_Case-1_ Flashing UBIFS image from u-boot using 'nand write' utility*
> >
> > For a partially written erased-block..
> > (a) 1st page is written with 'erase-header'
> > (b) 2nd page is written with 'volume-header'
> > (c) '3rd page' is written with 'some data'
> > (d) '4th to last-page of block' should be left blank, but they are written with 0xFF.
> > As a effect of (d), the ECC calculated for (all 0xff data) is written to
> > OOB area of all pages from 4th-page till last-page of the PEB.
>
> Yup.
>

If the 4th to last-page are left blank and not covered with ECC, what
will happen in case of bit flips on the blank pages? There was an
issue reported some time back.
http://lists.infradead.org/pipermail/linux-mtd/2012-January/039256.html

Does UBI/UBIFS take care of this now?

Thanks,
Calvin
