Received: from [78.46.68.141] (helo=eristoteles.iwoars.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SDb1X-0002qw-Hw
 for linux-mtd@lists.infradead.org; Fri, 30 Mar 2012 12:33:48 +0000
Date: Fri, 30 Mar 2012 14:33:46 +0200 (CEST)
From: Joel Reardon <joel@clambassador.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: allow atomic updates to sychronously erase old
 PEB
In-Reply-To: <1333110503.5440.24.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.00.1203301433270.10066@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1203291653210.912@eristoteles.iwoars.net>
 <4F748CD6.4080704@parrot.com>
 <alpine.DEB.2.00.1203301413080.10066@eristoteles.iwoars.net>
 <1333110503.5440.24.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Just for 'blocking', or also all the 'erase's.

cheers,
Joel Reardon

On Fri, 30 Mar 2012, Artem Bityutskiy wrote:

> On Fri, 2012-03-30 at 14:20 +0200, Joel Reardon wrote:
> > Hey,
> >
> > If there's a power cut after the new version is written and the old one is
> > erased, then it is my understanding that while remounting UBI will detect
> > that the old version is not needed and put it on the erase queue.
>
> Yes.
>
> > The
> > higher layer that issued the call to update the block will have to do a
> > blocking clear of the ubi erase queue when remounting after unsafely
> > unmounting.
>
> Yes. You can do this if the security is enabled, I think, using
> 'ubi_sync()'.
>
> I did not have time to look at your patches, but one quick comment is
> that we usually call the argument which controls whether the function
> has to wait for the operation to complete or not 'sync', could you
> please follow this unwritten convention as well?
>
> --
> Best Regards,
> Artem Bityutskiy
>
