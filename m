Received: from mail.fst.it ([213.255.39.254] helo=fst.it)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Wvvx-0003xT-Qb
	for <linux-mtd@lists.infradead.org>; Mon, 30 Jun 2003 11:30:53 +0100
Message-ID: <00ef01c33ef3$8c4987b0$a970a8c0@topo>
From: "Luca Contini" <luca.contini@mediaenabling.com>
To: "David Woodhouse" <dwmw2@infradead.org>
References: <006801c334a8$3aa7c750$a970a8c0@topo>
	<1055839872.2233.68.camel@passion.cambridge.redhat.com>
	<027f01c33590$8f177db0$a970a8c0@topo>
	<1055937571.2233.103.camel@passion.cambridge.redhat.com>
	<008e01c33710$1f6c6df0$a970a8c0@topo>
	<1056102151.27851.300.camel@passion.cambridge.redhat.com>
	<011201c33bc1$8678b390$a970a8c0@topo>
	<1056618945.27553.38.camel@passion.cambridge.redhat.com>
	<006701c33c84$2461ba80$a970a8c0@topo>
	<1056701767.28202.38.camel@imladris.demon.co.uk>
Date: Mon, 30 Jun 2003 12:37:04 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: Barone Tonino <tonino.barone@tecneitalia.com>
cc: "linux-mtd-request@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Please help, nftl question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,
thank you very much for your help.
Things are definitely much clear now.
I'v been looking for 'struct mtd_blktrans_ops' but with no result.
Also for "include/mtd/blktrans.h" that I suppose is
"include/linux/mtd/blktrans.h", but I can't find any "blktrans.h".
Right now I'm trying to understand the code for mtdblock.

Regards

Luca

----- Original Message -----
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Luca Contini" <luca.contini@mediaenabling.com>
Cc: "linux-mtd-request@lists.infradead.org" <linux-mtd@lists.infradead.org>;
"Barone Tonino" <tonino.barone@tecneitalia.com>
Sent: Friday, June 27, 2003 10:16 AM
Subject: Re: Please help, nftl question


> On Fri, 2003-06-27 at 09:14, Luca Contini wrote:
> > Hi,
> > which is difference between nftlcore and nftlmount ?
>
> nftlmount is the code which does and examines a flash device, looking
> for signs of the NFTL format on it, and then builds up all the relevant
> data structures for the NFTL code.
>
> nftlcore is the code which actually handles read/write access to the
> translation layer.
>
> You don't really need to worry about this -- it just seemed slightly
> nicer to split it NFTL two files. FTL and mtdblock are not split.
>
> > What kind of functions should SFTL export so that a filesystem can be
put
> > on?
>
> You need to provide a 'struct mtd_blktrans_ops', as defined in
> include/mtd/blktrans.h and implemented in mtdblock.c
>
> Don't look at NFTL, it'll just confuse you. Look at mtdblock.c instead.
>
> Take a copy of it, make the read and write functions just return errors.
> Add code to your 'add_mtd' routine to go and check for a valid
> SmartMedia TL on any device which is added. Then make the read function
> work properly -- finding the appropriate part of the flash containing
> whichever 'logical' block number is requested, and reading it.
>
> Then move on to writing...
>
> --
> dwmw2
>
>
>
>
