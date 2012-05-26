Received: from [78.46.68.141] (helo=eristoteles.iwoars.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SYF41-0007cH-7x
 for linux-mtd@lists.infradead.org; Sat, 26 May 2012 11:21:42 +0000
Date: Sat, 26 May 2012 13:21:38 +0200 (CEST)
From: Joel Reardon <joel@clambassador.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBIFS: compute KSA size and store in superblock
In-Reply-To: <1337952271.30969.37.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.00.1205261303000.9892@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205251509220.2989@eristoteles.iwoars.net>
 <1337952271.30969.37.camel@sauron.fi.intel.com>
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

>
> I do not have to time to review it now, but please, make sure that the
> KSA size is according to 'max_leb_cnt' (see the --max-leb-cnt of the
> mkfs.ubifs tool).

Ahh, I see now I also need to add the min number of lebs to min_leb_cnt if
the feature is enabled.

> Also, think about this use-case in general: you have
> UBI volume of size X, then the volume is resized to Y > X, then mounted
> - UBIFS should work and resize itself to Y, up to the 'max_leb_cnt'. If
> Y > 'max_leb_cnt', we resize only to 'max_leb_cnt'.

For this case, it should be fine if the KSA is sized to maxlebcnt.
However, it will remain that size regardless of the real leb_cnt.

In general, removing KSA blocks is possible, but if datanodes are
encrypted with keys on those blocks, then they must be re-encrypted with a
different key on the smaller set (or somehow write the new last KSA block
containing all the used keys from the removed KSA blocks along with a
relocation table, but this seems like alot of coding if removing LEBs from
the KSA isn't that important.)

Adding LEBs to the KSA is very simple, just add a new entry on the list
and set all the key states to deleted--after purging will be random data;
but KSA LEBs are logically-sequential, so if it comes from used main LEBs
the data nodes need to be relocated. or some complicated code structure
involved in determining where a key for an out-of-range KSA block is
remapped.

Cheers,
Joel Reardon
