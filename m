Received: from jeeves.momenco.com
	([64.169.228.99] helo=host099.momenco.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19EBC1-0004l7-DX
	for <linux-mtd@lists.infradead.org>; Fri, 09 May 2003 17:57:58 +0100
From: "Matthew Dharm" <mdharm@momenco.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Date: Fri, 9 May 2003 09:58:10 -0700
Message-ID: <NEBBLJGMNKKEEMNLHGAIEEGEDAAA.mdharm@momenco.com>
MIME-Version: 1.0
In-Reply-To: <1052498905.9960.8.camel@passion.cambridge.redhat.com>
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
> Sent: Friday, May 09, 2003 9:48 AM
> To: Matthew Dharm
> Cc: linux-mtd@lists.infradead.org
> Subject: RE: DiskOnChip 2000 128Mb problem
>
>
> On Fri, 2003-05-09 at 17:40, Matthew Dharm wrote:
> > Is it normal for a DoC 2000 to be detected as a Millenium?
>
> No, but it's not normal for its contents to be read back as
> 0x01 0x02
> 0x03 etc. either: )

Okay, so we're all on the same page.

> > I've already checked the bus width and timing.
>
> And it's definitely not set to 16-bit? -ECONFUSED.

No kidding.  I'm hoping the docs will have something useful, and I'm
about to pull out the bus analyizer.


Matt
