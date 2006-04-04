Received: from o-hand.com ([70.86.75.186])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FQnun-0003Wi-AK
	for linux-mtd@lists.infradead.org; Tue, 04 Apr 2006 11:58:01 -0400
From: Richard Purdie <richard@openedhand.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060404153354.GD25130@wohnheim.fh-wedel.de>
References: <1144163888.6441.48.camel@localhost.localdomain>
	<20060404153354.GD25130@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Tue, 04 Apr 2006 16:56:51 +0100
Message-Id: <1144166212.6441.57.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC/testing] Upgrade the zlib_inflate library code to a
	recent version
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-04-04 at 17:33 +0200, Jörn Engel wrote:
> On Tue, 4 April 2006 16:18:08 +0100, Richard Purdie wrote: 
> > Upgrade the zlib_inflate implementation in the kernel from a patched
> > version 1.1.3 to a patched 1.2.3. 
> 
> s/1.1.3/1.1.4/
>
> I once pulled all the bugfixes between the versions into the kernel.

That's not what the header says :)

> > +#if 0
> > +int zlib_inflatePrime(z_streamp strm, int bits, int value)
> 
> Was this code dead in 1.2.3 as well?

This code was commented out in the kernel by Adrian Bunk as it has no
users and I just followed that example when updating  I'm sure if
someone needed it, it could be enabled.

> > +#ifndef PKZIP_BUG_WORKAROUND
> 
> For the kernel, we can remove compat code against DOS compilers, etc.
> In this particular case, I believe we can just consider data
> compressed with PKZIP to be illegal and throw an error.

Agreed, there are places it can be tidied up a bit further. I was trying
not to make too many changes so any future updates against zlib are
easier.

Richard
