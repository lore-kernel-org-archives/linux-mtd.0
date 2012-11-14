Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TYjTx-0008Gx-Fq
 for linux-mtd@lists.infradead.org; Wed, 14 Nov 2012 20:22:46 +0000
Date: Wed, 14 Nov 2012 21:22:39 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Angus CLARK <angus.clark@st.com>
Subject: Re: state of support for "external ECC hardware"
Message-ID: <20121114202239.GA26851@parrot.com>
References: <509B9143.4020506@keymile.com>
 <20121108152125.GR2389@harvey-pc.matrox.com>
 <509BDE9B.3080909@keymile.com>
 <alpine.DEB.2.00.1211090938500.29771@lnxricardw.se.axis.com>
 <50A12FBD.8020801@keymile.com> <20121112173515.GA3041@parrot.com>
 <50A13461.7070304@keymile.com> <20121112185231.GA6843@parrot.com>
 <50A36E92.7070204@keymile.com> <50A39B9B.7020808@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <50A39B9B.7020808@st.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>, "Brunck,
 Holger" <Holger.Brunck@keymile.com>,
 Gerlando Falauto <gerlando.falauto@keymile.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Bigler,
 Stefan" <Stefan.Bigler@keymile.com>, Christopher Harvey <charvey@matrox.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 14, 2012 at 01:24:43PM +0000, Angus CLARK wrote:
> Hi Gerlando,
> 
> On 11/14/2012 10:12 AM, Gerlando Falauto wrote:
> > Hi Ivan,
> > 
> > thanks once more.
> > Speaking of compatibility, I was wondering: doesn't a NAND flash have
> > *any* spare storage space at all, where software could store some
> > information about the current OOB layout and/or ECC mechanism?
> > Partition tables on hard drives for instance have a "partition type"
> > byte which provides some hints about what to expect from the data within
> > a partition.
> > 
> > This would be especially useful for *future* compatibility (i.e. old
> > software reading a NAND "formatted" with unknown mechanism could simply
> > stop working, or force read-only mode disabling ECC altogether).
> > 
> > Feasibility aside, would that make any sense?
> > 
> 
> In general I am in favour of anything that facilitates the automatic probing of
> devices.  However, I can see a number of complications in trying to implement
> what you suggest.  Storing static information in a fixed location is never a
> good idea on NAND.  A further issue relates to the very information you are
> trying to store.  The data itself would need to be protected by ECC, but for it
> to be useful, you need to be able to retrieve it without knowing what ECC/layout
> was used when storing it.  Perhaps, for this ECC/layout data, one could use a
> special dedicated S/W ECC scheme, strong enough for any device.  Yet another
> layout of complexity though.

FWIW, I have once implemented a kind of primitive "formatting" similar to what you are describing (i.e. storage of NAND parameters inside the device itself).
For that, I used a dedicated SW BCH ECC, that adds 3 redundant bytes to each useful byte (effectively multiplying by 4 the required storage).
The resulting data can sustain up to 4 bitflips in each 32-bit word; it is also stored redundantly in multiple blocks.

BR,
--
Ivan
