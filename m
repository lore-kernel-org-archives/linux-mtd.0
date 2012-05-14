Received: from [78.46.68.141] (helo=eristoteles.iwoars.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1STyx1-0003D9-VX
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 17:20:53 +0000
Date: Mon, 14 May 2012 19:20:49 +0200 (CEST)
From: Joel Reardon <joel@clambassador.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBIFS: add crypto lookup field to tree node cache
In-Reply-To: <1337001716.2528.56.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.00.1205141907290.12448@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205111323010.17715@eristoteles.iwoars.net>
 <1337001716.2528.56.camel@sauron.fi.intel.com>
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

The long long is divided as follows:
32 bits for the (KSA-relative) LEB number, 32 bits for the offset in the
leb where the key is found. So its the same as the lnum/offs for the
current one. Theres substancial compression though, that is available,
since theres likely not more than 2^^32 LEBS for the KSA and the number of
bits needed for key offset is LEB_SHIFT - 4.

Is 32 bits sufficient to address all keys:
one key per datanode means 4096 * 2^32 = 2^44, so only 16 TB available
for 32 bit key addresses.

Though there is similar waste for lnum/offs as well. Perhaps zbranches can
be stored as a u8[] and demarshalled with bit-op macros when needed for
computations.

Joel Reardon




On Mon, 14 May 2012, Artem Bityutskiy wrote:

> On Fri, 2012-05-11 at 13:24 +0200, Joel Reardon wrote:
> >  struct ubifs_zbranch {
> >  	union ubifs_key key;
> > @@ -751,6 +752,7 @@ struct ubifs_zbranch {
> >  	int lnum;
> >  	int offs;
> >  	int len;
> > +	long long crypto_lookup;
> >  };
>
> Why is it "long long" which is 64 bit? What will it contain? Could we
> make it unsigned int - we'd waste less RAM then - remember that we
> allocate a lot of these structures.
>
> --
> Best Regards,
> Artem Bityutskiy
>
