Received: from nz-out-0506.google.com ([64.233.162.239])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Ijzt7-00061P-5i
	for linux-mtd@lists.infradead.org; Mon, 22 Oct 2007 17:12:23 +0100
Received: by nz-out-0506.google.com with SMTP id z3so429071nzf
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Oct 2007 09:12:10 -0700 (PDT)
Message-ID: <625fc13d0710220912s28ad29e6y775aec6e1e44e503@mail.gmail.com>
Date: Mon, 22 Oct 2007 11:12:09 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: FTLs for NANDSim
In-Reply-To: <20071022160003.GA13023@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <7ee965bc0710200922n2159c5dav4357d1cdce5521e8@mail.gmail.com>
	<1193045588.2672.15.camel@shinybook.infradead.org>
	<20071022160003.GA13023@lazybastard.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Sun Devil <sundevil007@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/22/07, J=F6rn Engel <joern@logfs.org> wrote:
> On Mon, 22 October 2007 10:33:08 +0100, David Woodhouse wrote:
> >
> > > 2. Do you have any implementations of FTL at Kernel level?
> >
> > Yes. We have the simplistic 'mtdblock' which doesn't really do any
> > translation at all, we have 'FTL' which works only on NOR flash, and we
> > have 'NFTL' and 'INFTL' for use on DiskOnChip devices. There is a helpe=
r
> > layer which is designed to make it relatively easy for you to provide
> > your own translation layer, without having to get too deeply involved i=
n
> > how Linux block device drivers work.
>
> There are at least two more:
> ssfdc.c
> rfd_ftl.c
>
> One of them appears to do the smartmedia format, the other something
> very similar.

There is also UBI of course.  Which people will say isn't an FTL, but
it's somewhat similar.

josh
