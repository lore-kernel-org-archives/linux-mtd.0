Received: from wf-out-1314.google.com ([209.85.200.169])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JoUXb-0007xm-DF
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 02:16:59 +0000
Received: by wf-out-1314.google.com with SMTP id 29so1860383wff.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Apr 2008 19:16:58 -0700 (PDT)
Message-ID: <9c9fda240804221916s6b14416fnc0396484a8101ea1@mail.gmail.com>
Date: Wed, 23 Apr 2008 11:16:58 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH] [MTD][OneNAND] Multi Level Chip (MLC) OneNAND support
In-Reply-To: <1208914410.9212.714.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080103000350.GA12237@party>
	<1208876816.9212.609.camel@pmac.infradead.org>
	<9c9fda240804221749u4c235a3fv54926f8acfd2e605@mail.gmail.com>
	<1208914410.9212.714.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 23, 2008 at 10:33 AM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Wed, 2008-04-23 at 09:49 +0900, Kyungmin Park wrote:
>  > On Wed, Apr 23, 2008 at 12:06 AM, David Woodhouse <dwmw2@infradead.org> wrote:
>  > > On Thu, 2008-01-03 at 09:03 +0900, Kyungmin Park wrote:
>  > >  > This patch enables the MLC OneNAND support
>  > >  > Now it's basic support. We need to work more.
>  > >  >
>  > >  > In MLC, we use the 4KiB BufferRam instead of 2KiB.
>  > >  > With this reason it is changed to read/write data from/to BufferRAM 0 and
>  > >  > we can't use read-while-load.
>  > >  >
>  > >  > It passed the nand-tests module and it diffed against the OneNAND MTD tree instead of MTD one.
>  > >
>  > >  Did you intend this to be merged?
>  > >
>  >
>  > Yes, Before merge this one
>  > Another patch should be merged first.
>  >
>  > "[JFFS2] JFFS2 doesn't use OOB at MLC NAND/OneNAND"
>  > http://patchwork.ozlabs.org/linux-mtd/patch?id=16536
>
>  Hm, yeah... that was the other thing I wanted to ask you about.
>
>  I'm really not wonderfully happy with it. Have we done any powerfail
>  testing with MLC chips?

Now OneNAND try to solve the MLC Power Off Recovery (POR) handling at
hardware level exactly chip level.
I'm sorry since the Spec. is not open, I can't tell you more detailed
information. However, the Spec. is open, you can find it. When? I'm
not sure...

>
>  Maybe it would be better to just refuse to mount, until/unless we have a
>  proper solution?
>
Reasonable. how about to change into read-only mode? powerfail is only
occurs at write operation so read-only mode doesn't affect this
problem.

Okay, wait until we have a proper solution.

Thank you,
Kyungmin Park
