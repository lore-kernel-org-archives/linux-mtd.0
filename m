Received: from smtp1.uu.se ([2001:6b0:b:242:130:238:7:54])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TRMic-000837-Mv
 for linux-mtd@lists.infradead.org; Thu, 25 Oct 2012 12:39:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <20617.12809.803356.83369@pilspetsen.it.uu.se>
Date: Thu, 25 Oct 2012 14:35:21 +0200
From: Mikael Pettersson <mikpe@it.uu.se>
To: Will Deacon <will.deacon@arm.com>
Subject: Re: Possible regression in arm/io.h
In-Reply-To: <20121025111705.GD11267@mudshark.cambridge.arm.com>
References: <CABYn4syj0GZAsDYVQfXg_qKAFkbrxPLoZWpKRzwf3gfRkMGZkQ@mail.gmail.com>
 <20121024105223.GC23775@mudshark.cambridge.arm.com>
 <1351148122.2507.63.camel@sauron.fi.intel.com>
 <20121025111705.GD11267@mudshark.cambridge.arm.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Bastian Hecht <hechtb@googlemail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Will Deacon writes:
 > On Thu, Oct 25, 2012 at 07:55:22AM +0100, Artem Bityutskiy wrote:
 > > On Wed, 2012-10-24 at 11:52 +0100, Will Deacon wrote:
 > > > 	(a) Understand what has changed in GCC to cause this error to start
 > > > 	    cropping up.
 > > 
 > > This is about already quite old gcc 4.6.3, which I use for about 4 last
 > > kernel releases already. So it is only the kernel that changed.
 > 
 > Looks like it's broken with gcc 4.7 too, so it might be that it's never
 > worked. The problem seems to be that offsettable addresses are assumed by
 > GCC to have a 12-bit immediate range, which isn't true for half- and double-
 > work accessors, so GAS barfs when presented with the final (invalid) code.
...
 > Unfortunately, GCC doesn't give us another constraint
 > that we can use for this, so I think we just have to grin and bear it.

Please file a GCC bugzilla entry with an enhancement request to support
ARM constraint letters for other immediate sizes than 12 (and list which
sizes are missing).
