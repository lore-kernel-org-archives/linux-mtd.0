Received: from ug-out-1314.google.com ([66.249.92.170])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FqFNK-0001P0-Fj
	for linux-mtd@lists.infradead.org; Tue, 13 Jun 2006 16:20:43 -0400
Received: by ug-out-1314.google.com with SMTP id q2so3283799uge
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Jun 2006 13:20:32 -0700 (PDT)
From: Husam <husamsenussi@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: DiskOn Chip Millennium Plus 32MB + INFTL
Date: Tue, 13 Jun 2006 21:20:50 +0100
References: <4488665D.5010908@kalikstein.com>
	<200606132042.44659.husamsenussi@gmail.com>
	<1150228587.11159.103.camel@shinybook.infradead.org>
In-Reply-To: <1150228587.11159.103.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606132120.51121.husamsenussi@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 13 June 2006 20:56, David Woodhouse wrote:
> On Tue, 2006-06-13 at 20:42 +0100, Husam wrote:
> > Yes it's not single 16-bit, could we add anther flag to NAND say
> > "NAND_INTERLEAVE" .. or maybe pass number  of chips from device layer to
> > NAND layer.
> >
> > All we need to do I guess is to pass the right information so the NAND
> > layer can calculate the right size for page and to block.
>
> Can we do this by providing our own command function?
I guess we can ... but I thought the scan function is not replaceable 
