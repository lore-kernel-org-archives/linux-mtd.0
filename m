Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQHBF-0003uR-BV
 for linux-mtd@lists.infradead.org; Fri, 04 May 2012 12:00:14 +0000
Received: by wibhj13 with SMTP id hj13so1023633wib.0
 for <linux-mtd@lists.infradead.org>; Fri, 04 May 2012 05:00:11 -0700 (PDT)
Date: Fri, 4 May 2012 15:00:01 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com, Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Question about mkfs.jffs2 "-s" option
Message-ID: <20120504150001.4268beea@halley>
In-Reply-To: <1336115737.30168.20.camel@sauron.fi.intel.com>
References: <jnrm65$im4$1@dough.gmane.org>
 <Pine.LNX.4.64.1205030930540.8107@lnxricardw.se.axis.com>
 <20120503211334.17c91b31@halley>
 <1336115737.30168.20.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Grant Edwards <grant.b.edwards@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem, Ricard,

On Fri, 04 May 2012 10:15:37 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2012-05-03 at 21:13 +0300, Shmulik Ladkani wrote:
> > On Thu, 3 May 2012 09:35:14 +0200 (CEST) Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
> > > 
> > > The smallest writable unit in a NAND flash is called a 'page', but AFAIK 
> > > this is not what the -s option in mkfs.jffs2 is for. Instead, it is 
> > > related for the kernel memory managament page size, which is 4k for most 
> > > architectures.
> > 
> > According to MKFS.JFFS2(1),
> > 
> > 	-s, --pagesize=SIZE
> > 		Use page size SIZE.  The default is 4 KiB.  This size is
> > 		the maximum size of a data node.
> > 
> > And according to http://linux-mtd.infradead.org/~dwmw2/jffs2.pdf
> > 
> > 	In order to facilitate rapid decompression of
> > 	data upon readpage() requests, nodes contain
> > 	no more than a single page of data, according to
> > 	the hardware page size on the target platform.
> > 
> > Wow.
> > I always assumed I had to set it according to NAND's page size, not
> > according to target system's mm page size.
> 
> Shmulik, I can give some info about this. First of all because of
> compression and very different node sizes (UBIFS and JFFS2) and because
> JFFS2 was designed for NOR flash originally - NAND page size is not
> something which affects the design of file-systems, or their on-flash
> layout. We use write-buffers on I/O level to make it appear like the
> eraseblock is byte-writable.
> 
> The RAM page size comes from the general linux design - the VFS writes
> in RAM page size units, and it is much simpler to make max node size =
> PAGE_CACHE_SIZE rather than trying to split it when the PAGE_CACHE_SIZE
> is something like 16KiB. This is where this -s stuff comes from. I think
> it was a mistake to introduce this parameter because it is very unlikely
> JFFS2 is/was used on systems with a different PAGE_CACHE_SIZE.

Thanks for the explanations.
I pretty much realized this after reading [1]...

BTW, googling [mkfs.jffs2 and "-s 0x200"] or [mkfs.jffs2 and "-s 0x800"]
yielded few howtos, faqs, and alike....
Guess I wasn't the only one fooled by the argument's name :-))

[1] http://linux-mtd.infradead.org/~dwmw2/jffs2.pdf

Regards
Shmulik
