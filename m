Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLnPZ-0001IQ-GP
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 15:25:11 -0500
Date: Tue, 21 Mar 2006 21:24:42 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Nicolas Pitre <nico@cam.org>
Message-ID: <20060321202442.GA31992@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>
	<1142967444.13740.9.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0603211434261.3631@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.64.0603211434261.3631@localhost.localdomain>
Cc: Alexander Belyakov <alexander.belyakov@intel.com>,
	linux-mtd@lists.infradead.org, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 21 March 2006 14:37:48 -0500, Nicolas Pitre wrote:
> On Tue, 21 Mar 2006, Artem B. Bityutskiy wrote:
> > On Tue, 2006-03-21 at 21:11 +0300, Alexander Belyakov wrote:
> > > Striped mtd device erasesize is an erasesize of subdevice multiplied by 
> > > number of subdevices (in case of equal erasesize subdevices). As 
> > > erasesize is commonly considered as a power-of-2 number it is not good 
> > > idea to use 3, 5, etc devices.
> > Why? I don't see any thing bad with having 3*128KiB eraseblock size...
> 
> I agree with you ....... as long as someone is willing to audit all MTD 
> client code to certify that no assumption about erase block sizes being 
> a power of 2 is present.

Hasn't that already been done for dataflash?  As long as some people
still use dataflash, we have people (un?)willingly testing this.

Jörn

-- 
The story so far:
In the beginning the Universe was created.  This has made a lot
of people very angry and been widely regarded as a bad move.
-- Douglas Adams
