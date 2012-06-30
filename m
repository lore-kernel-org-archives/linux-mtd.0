Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sl4Va-0003H9-Oy
 for linux-mtd@lists.infradead.org; Sat, 30 Jun 2012 20:43:11 +0000
Received: by wibhm11 with SMTP id hm11so1593476wib.0
 for <linux-mtd@lists.infradead.org>; Sat, 30 Jun 2012 13:43:08 -0700 (PDT)
Date: Sat, 30 Jun 2012 23:43:03 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH] UBI: add minimal amount of reserved erase blocks in
 Kconfig
Message-ID: <20120630234303.148c612b@halley>
In-Reply-To: <1340974064.3070.177.camel@sauron.fi.intel.com>
References: <1340636918-7505-1-git-send-email-richard.genoud@gmail.com>
 <20120628205303.676fa2ea@halley>
 <1340974064.3070.177.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, 29 Jun 2012 15:47:44 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > I'd expect a fixed number of 'beb_rsvd_level' PEBs for a given mtd
> > partition, or more correctly, as Richard suggests, the *sum* of bad PEBs
> > plus the beb reserved PEBs should be constant for a partition - as I
> > do not expect more than a known constant of blocks to go bad during
> > device's (and thus, partition's) lifetime.
> 
> Those days we did not have this "vendor-guaranteed max. bad blocks
> count" thing and I thought that UBI would try to always maintain a pool
> of reserved PEBs.
> 
> Would you send a patch?

Ok. I'll try to fiddle with UBI beb reserved arithmetics.

I thought to make it a gradual change.

First, change the semantics of CONFIG_MTD_UBI_BEB_RESERVE to be the
percent of total number of eraseblocks (instead of total number of
_good_ eraseblocks). And 'reserve' counts for both existing bad PEBs
and those reserved for future bad PEB handling.
Note this would still be % of the blocks in the mtd partition (and as
such, it is very loosely related to the MBB of the device, if at all).

Then, Richard may introduce the MBB parameter to ubiattach, and later
may kill CONFIG_MTD_UBI_BEB_RESERVE (if no longer needed). The
calculations will be according to the new parameter.

What do you say?

On a side note, the new ubiattach parameter should not be called MBB,
but rather a generic "reserved" (or "% reserved").

This is since the MBB is a property of the mtd nand device.
But the ubi user may issue, for the partition attached, a value other
than the device's MBB, according to his storage needs and
risks/securities he is willing to take.

Regards,
Shmulik
