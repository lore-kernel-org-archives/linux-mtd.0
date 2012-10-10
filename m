Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLtcB-0007wj-U2
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 10:34:12 +0000
Subject: Re: mkfs.ubifs problem when output file really isn't in the UBIFS
 root directory
From: Marcus Prebble <marcus.prebble@axis.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
In-Reply-To: <1349861452.20594.12.camel@sauron.fi.intel.com>
References: <1348242118.2552.1460.camel@lnxprebble2.se.axis.com>
 <1349367416.20373.75.camel@sauron.fi.intel.com>
 <1349708696.2552.1821.camel@lnxprebble2.se.axis.com>
 <1349851661.20594.6.camel@sauron.fi.intel.com>
 <1349859856.2552.1962.camel@lnxprebble2.se.axis.com>
 <1349861452.20594.12.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 10 Oct 2012 12:34:09 +0200
Message-ID: <1349865249.2552.1965.camel@lnxprebble2.se.axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2012-10-10 at 11:30 +0200, Artem Bityutskiy wrote:
> On Wed, 2012-10-10 at 11:04 +0200, Marcus Prebble wrote:
> > Apologies for the long-winded explanation - but the output file really
> > isn't in the the root directory, even though apparently the inodes are
> > the same. 
> 
> Well, ok, this is a bug. But I think the solution for this should _not_
> be a separate "--band-aid" type of option.

Agree entirely. --band-aid was just used as a proof-of-concept.

>  We should kill 'in_path()'
> and implement a 'is_contained(file, dir)' function, which would return
> true if 'dir' contains 'file' and false otherwise.

I will implement and come back with a patch when I have time.

Thanks again for your input,

/Marcus


> 
