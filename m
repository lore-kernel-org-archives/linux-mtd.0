Received: from [78.46.68.141] (helo=eristoteles.iwoars.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SU0HA-0004Fn-C6
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 18:45:45 +0000
Date: Mon, 14 May 2012 20:45:42 +0200 (CEST)
From: Joel Reardon <joel@clambassador.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBIFS: add crypto lookup field to tree node cache
In-Reply-To: <1337020106.2042.2.camel@koala>
Message-ID: <alpine.DEB.2.00.1205142032210.12448@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205111323010.17715@eristoteles.iwoars.net>
 <1337001716.2528.56.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1205141907290.12448@eristoteles.iwoars.net>
 <1337020106.2042.2.camel@koala>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I use this because I figured it should be abstracted in functions that
have these values, but don't need to know about the internal structure.
>From the view of all UBIFS components (except the new keymap), two values
have no more meaning than one, its all just some value the keymap gives
out and returns the same key on read_key.

cheers,
Joel Reardon

On Mon, 14 May 2012, Artem Bityutskiy wrote:

> On Mon, 2012-05-14 at 19:20 +0200, Joel Reardon wrote:
> > The long long is divided as follows:
> > 32 bits for the (KSA-relative) LEB number, 32 bits for the offset in the
> > leb where the key is found. So its the same as the lnum/offs for the
> > current one. Theres substancial compression though, that is available,
> > since theres likely not more than 2^^32 LEBS for the KSA and the number of
> > bits needed for key offset is LEB_SHIFT - 4.
> >
> > Is 32 bits sufficient to address all keys:
> > one key per datanode means 4096 * 2^32 = 2^44, so only 16 TB available
> > for 32 bit key addresses.
> >
> > Though there is similar waste for lnum/offs as well. Perhaps zbranches can
> > be stored as a u8[] and demarshalled with bit-op macros when needed for
> > computations.
>
> OK, thanks for explanation. Why not to then store 2x32-bit fields
> instead, which is consistent with the current style? Why "long long"?
>
> --
> Best Regards,
> Artem Bityutskiy
>
