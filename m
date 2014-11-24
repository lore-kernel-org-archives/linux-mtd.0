Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xt1BN-0001XR-Rh
 for linux-mtd@lists.infradead.org; Mon, 24 Nov 2014 21:28:30 +0000
Received: by mail-pa0-f42.google.com with SMTP id et14so10291960pad.15
 for <linux-mtd@lists.infradead.org>; Mon, 24 Nov 2014 13:28:08 -0800 (PST)
Date: Mon, 24 Nov 2014 13:28:04 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: Read-only file systems using NAND/MTD
Message-ID: <20141124212804.GJ24364@ld-irv-0074>
References: <006d01d00826$fa33c2a0$ee9b47e0$@TelosAlliance.com>
 <CAFLxGvyV0VYtQSWdnKJDs2choDMYGbR3azajXjd1ut4Emw1KdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvyV0VYtQSWdnKJDs2choDMYGbR3azajXjd1ut4Emw1KdQ@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Rod Campbell <rod.campbell@telosalliance.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 24, 2014 at 10:21:16PM +0100, Richard Weinberger wrote:
> On Mon, Nov 24, 2014 at 9:41 PM, Rod Campbell <rod.campbell@telosalliance.com> wrote:
> > Hello,
> >
> > Is there an update about implementing a read-only file system on NAND?  The
> > most recent discussion I could find was from May 2012:
> >
> > http://lists.infradead.org/pipermail/linux-mtd/2012-May/041200.html
> >
> > The conclusion seemed to be to use ubi underneath something like squashfs to
> > provide bad-block awareness.  Is this still the recommended solution?
> 
> Yes. Using the new UBI block driver this is trivial.

To expand on that:

http://www.linux-mtd.infradead.org/doc/ubi.html#L_ubiblock

Brian
