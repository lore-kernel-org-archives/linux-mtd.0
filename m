Received: from jeeves.momenco.com
	([64.169.228.99] helo=host099.momenco.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Febw-00030f-55
	for <linux-mtd@lists.infradead.org>; Tue, 13 May 2003 19:34:48 +0100
From: "Matthew Dharm" <mdharm@momenco.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Date: Tue, 13 May 2003 11:34:58 -0700
Message-ID: <NEBBLJGMNKKEEMNLHGAICEHLDAAA.mdharm@momenco.com>
MIME-Version: 1.0
In-Reply-To: <1052811622.10222.42.camel@imladris.demon.co.uk>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: DiskOnChip 2000 128Mb problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: Tuesday, May 13, 2003 12:40 AM
> To: Matthew Dharm
> Cc: Edward A. Hildum; linux-mtd@lists.infradead.org
> Subject: RE: DiskOnChip 2000 128Mb problem
>
>
> On Tue, 2003-05-13 at 02:42, Matthew Dharm wrote:
> > Well, I found at least one part of the problem.
> >
> > The Linux driver doc2001.c assumes that addresses (in
> DoC_Address) are
> > 23 bits max.  On some parts, the max is 31, so an extra
> write of the
> > address component is needed.
>
> Interesting. If we make this change, does it still work
> with the older
> units?

Doubtful.  The doc2000 'integrated' code actually has a system for
marking certain parts as needed 3 or 4 bytes of address, depending on
the part ID.  I can't use that code, since it can't ID my parts (and I
haven't figured out why).

Matt
