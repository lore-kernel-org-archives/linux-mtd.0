Received: from py-out-1112.google.com ([64.233.166.178])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JIWhl-0006V5-U7
	for linux-mtd@lists.infradead.org; Fri, 25 Jan 2008 22:07:28 +0000
Received: by py-out-1112.google.com with SMTP id p76so1444637pyb.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Jan 2008 14:07:20 -0800 (PST)
Message-ID: <f383264b0801251407w861cdbfv72a8111c1ad8d4ef@mail.gmail.com>
Date: Fri, 25 Jan 2008 14:07:20 -0800
From: "Matt Reimer" <mattjreimer@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: fix s3c2410 error correction
In-Reply-To: <20071203152049.GA15000@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <1192755764-26269-1-git-send-email-mattjreimer@gmail.com>
	<f383264b0711291110k6e61ec29n212be5d4b059833e@mail.gmail.com>
	<20071203152049.GA15000@lazybastard.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Dec 3, 2007 7:20 AM, J=F6rn Engel <joern@logfs.org> wrote:
>
> On Thu, 29 November 2007 11:10:41 -0800, Matt Reimer wrote:
> > On Oct 18, 2007 5:02 PM, Matt Reimer <mattjreimer@gmail.com> wrote:
> > > From: Matt Reimer <mreimer@vpop.net>
> > >
> > > The single-bit error correction was, well, incorrect. For determing w=
hich
> > > bit to correct it was using P1' P2' P4' P8' instead of P1 P2 P4 P8, a=
nd
> > > it was using P16' P32' P64' P128' P256' P512' P1024' P2048' instead o=
f
> > > P16 P32 P64 P128 P256 P512 P1024 P2048.
> >
> > Is there any chance of this getting committed? It has been confirmed
> > to be needed on s3c2440 and s3c2412.
>
> Ok, I'm getting sick of this.  Even though I didn't fully review the
> patch, I'll gladly take the chances of breaking something and
> complaining to Matt afterwards.  Certainly beats ignoring this patch for
> all eternity.

Any takers? Pretty please?

Matt
