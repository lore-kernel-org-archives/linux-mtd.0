Received: from mail.fst.it ([213.255.39.254] helo=fst.it)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VoHG-0002Ub-2w
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jun 2003 09:08:14 +0100
Message-ID: <006701c33c84$2461ba80$a970a8c0@topo>
From: "Luca Contini" <luca.contini@mediaenabling.com>
To: "linux-mtd-request@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"David Woodhouse" <dwmw2@infradead.org>
References: <006801c334a8$3aa7c750$a970a8c0@topo>
	<1055839872.2233.68.camel@passion.cambridge.redhat.com>
	<027f01c33590$8f177db0$a970a8c0@topo>
	<1055937571.2233.103.camel@passion.cambridge.redhat.com>
	<008e01c33710$1f6c6df0$a970a8c0@topo>
	<1056102151.27851.300.camel@passion.cambridge.redhat.com>
	<011201c33bc1$8678b390$a970a8c0@topo>
	<1056618945.27553.38.camel@passion.cambridge.redhat.com>
Date: Fri, 27 Jun 2003 10:14:33 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: Barone Tonino <tonino.barone@tecneitalia.com>
Subject: Re: Please help, nftl question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
which is difference between nftlcore and nftlmount ?
What kind of functions should SFTL export so that a filesystem can be put
on?

regards

Luca


----- Original Message -----
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Luca Contini" <luca.contini@mediaenabling.com>
Cc: "Barone Tonino" <tonino.barone@tecneitalia.com>
Sent: Thursday, June 26, 2003 11:15 AM
Subject: Re: Please help, nftl question


> On Thu, 2003-06-26 at 10:01, Luca Contini wrote:
> > Hi,
> > can You please check whether my diagram is correct or not?
>
> Your diagram looks correct except that you've drawn arrows on it.
>
> Those arrows represent only _one_ of the many ways in which it can be
> used. If writing the SmartMedia 'SFTL' code, please don't do it while
> thinking about FAT or about any specific hardware driver. It should work
> with _any_ file system or hardware.
>
> > Can you please suggest me some paper to read about fat on smartmedia and
> > linux?
>
> Ignore FAT for the moment; it's not relevant.
>
> See http://www.ssfdc.or.jp/english/common/f_spec_down.htm
>
> Ignore the 'Logical Format Specifications' and look at the 'Physical
> Format Specifications'.
>
> --
> dwmw2
>
>
>
