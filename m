Received: from nf-out-0910.google.com ([64.233.182.189])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KUyPl-0007lf-Md
	for linux-mtd@lists.infradead.org; Mon, 18 Aug 2008 06:40:30 +0000
Received: by nf-out-0910.google.com with SMTP id d21so1786980nfb.22
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Aug 2008 23:40:28 -0700 (PDT)
Message-ID: <ac9c93b10808172340u69e24296le1bf141939cc7491@mail.gmail.com>
Date: Mon, 18 Aug 2008 08:40:28 +0200
From: "Frans Meulenbroeks" <fransmeulenbroeks@gmail.com>
To: "Troy Kisky" <troy.kisky@boundarydevices.com>
Subject: Re: [RESUBMIT] [PATCH] [MTD] NAND nand_ecc.c: rewrite for improved
	performance
In-Reply-To: <48A8B486.5070900@boundarydevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <alpine.DEB.0.99.0807311031390.6774@frans-desktop>
	<ac9c93b10808150141o6627e350pd23895d56426d59c@mail.gmail.com>
	<1218789997.3184.64.camel@pmac.infradead.org>
	<ac9c93b10808150223h6fb6032co61ffa7babba57884@mail.gmail.com>
	<1218793271.3184.77.camel@pmac.infradead.org>
	<ac9c93b10808150304k14f054faw402a7f67e868d2a@mail.gmail.com>
	<1218795140.3184.84.camel@pmac.infradead.org>
	<48A5D154.2000409@boundarydevices.com>
	<alpine.DEB.0.99.0808152300300.9220@frans-desktop>
	<48A8B486.5070900@boundarydevices.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/8/18, Troy Kisky <troy.kisky@boundarydevices.com>:
> > +     if (nr_bits == 11) {    /* correctable error */
>
>
> This is a necessary, but NOT sufficient condition to
>  determine that it is a 1 bit error.

The test for 11 bits is in accordance to the ST datasheet I used
(http://www.st.com/stonline/books/pdf/docs/10123.pdf, see section
3.4).
What other check do you feel should be needed.
>
>
>  Big MAYBE below
>
>  This is probably why you passed the big endian test.
>  It was seeing every read as a single bit error
>  and silently correcting. Adding a debug print
>  when correcting or failing to correct would be
>  useful.

As long as they are debug print, that could indeed be done. No problem
with that.
We could even have a printk to indicate a failure on the console/in the log.
Having a printk when a correction is done is probably not that
desirable (newer generations of nand seem more and more often to
require corrections, which could mean too many msges in the log).

Frans.
