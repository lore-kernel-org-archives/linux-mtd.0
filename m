Received: from [2002:d4ee:c952::1] (helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D3yMI-0001Pd-6R
	for linux-mtd@lists.infradead.org; Wed, 23 Feb 2005 10:23:27 -0500
Date: Wed, 23 Feb 2005 16:23:24 +0100
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: "Mialkowski, Andrzej" <Andrzej.Mialkowski@intel.com>
Message-ID: <20050223152324.GF9272@xi.wantstofly.org>
References: <A11645C193F77D429D800AED92117422016CBF72@swsmsx404>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A11645C193F77D429D800AED92117422016CBF72@swsmsx404>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH,
	RFC] remove slowport mode setting from ixp2000 map driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 23, 2005 at 11:26:44AM -0000, Mialkowski, Andrzej wrote:

> Lennert,

Hi,


> 	I'm OK with this change I just not caught that you are moving
> this setting to other place in ixp2000 global code.

Ok, great.  Can you commit it, or can someone else do that?


> Little surprise for
> me is that you are saying that you have(seen?) problem with access to
> devices when FRM=0, I never noticed that. This may of course happen in
> some hardware implementations but this means that there is no access to
> devices when executing from flash :(.

There is, but it's somewhat tricky -- you have to keep byteswapping
in mind, and the slowport might do more reads than you expect it to.

I have a byte-addressable device on my slowport region #0 which has
byte-sized registers.  The first four registers of the device are
normally '31 13 19 00'.  When the xscale runs in big-endian, I get
this:

		word read	halfword reads		byte reads
SP_FRM=0	00191331	0019 1331		00 19 13 31
SP_FRM=1	31313131	3113 1900		31 13 19 00

In SP_FRM=0, the output still looks 'fixable'.

But note that when SP_FRM=0 and you're doing a byte or halfword read,
what actually happens is that the slowport does four byte reads, combines
that to a word using little-endian ordering (00191331), presents that
word to the xscale, and the xscale then picks one of the {byte,halfword}s
from that word.

So, even if you do only a single byte read, it can still be doing four
byte reads on the slowport.  This can obviously confuse attached devices.


cheers,
Lennert
