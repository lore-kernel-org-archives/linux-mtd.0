Received: from rv-out-0910.google.com ([209.85.198.190])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IFxoU-0008WG-6P
	for linux-mtd@lists.infradead.org; Tue, 31 Jul 2007 15:55:27 -0400
Received: by rv-out-0910.google.com with SMTP id g11so659492rvb
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 Jul 2007 12:55:23 -0700 (PDT)
Message-ID: <6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
Date: Tue, 31 Jul 2007 12:55:23 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
In-Reply-To: <1185882932.3083.98.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<1185882932.3083.98.camel@pmac.infradead.org>
Cc: dhowells <dhowells@redhat.com>, Carsten Otte <cotte@de.ibm.com>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> The problem with this is that it expects the caller to 'know' that the
> mtd device it's using is in fact a partition.

Oh I hadn't considered that a device could not be a partition and
still have physaddr be relavant.  Can it?

> If we have to do this, I'd
> rather see it done generically.

Okay.  Can you give me a little nudge in the right direction?

> J=F6rn is probably right that it should be
> available from (whatever replaces) the point() method.

Like what? :)  I'm all for the kinds of ideas that J=F6rn and others are
tossing about as replacement for better XIP awareness in the MTD.  I'm
just not catching the vision enough to start coding.

One of the major problems with working on Flash based XIP stuff for
the kernel is that there are no mergeable filesystems to use the any
frameworks we develop.  The VM still doesn't handle this correctly,
point() needs work.  There are a lot of fronts to attack.  What I was
hoping for was to get the minimum requirements for me to get AXFS
supported by the kernel, then to come back and provide more educated
and correct interfaces in the vm and mtd layers.  That way we could
have the example of how it is being done in AXFS to frame the
discussion and give it more urgency.  I'm beginning to think this
isn't the correct approach.

If that won't work then can I propose a face to face meeting with
interested parties like a mini XIP summit or something.  There are
those that are informed and interested enough to want this done right
and have a definate opinion as to what is right and wrong here, but
that don't have time to develop this.  I on the other hand have the
ability to get this coded up but am more in the dark as to the
'correct' way to do this.  If we could sit down and sketch out how to
go about this I think it would be very productive.  Potential
interested parties could include me, Woodhouse, Engel, and Otte.
Anybody else come to mind?
