Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLmfv-0000VM-U2
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 14:37:56 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IWH00A22T70H170@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 14:37:48 -0500 (EST)
Date: Tue, 21 Mar 2006 14:37:48 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <1142967444.13740.9.camel@sauron.oktetlabs.ru>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-id: <Pine.LNX.4.64.0603211434261.3631@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>
	<1142967444.13740.9.camel@sauron.oktetlabs.ru>
Cc: Alexander Belyakov <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>,
	linux-mtd@lists.infradead.org, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 21 Mar 2006, Artem B. Bityutskiy wrote:

> On Tue, 2006-03-21 at 21:11 +0300, Alexander Belyakov wrote:
> > Striped mtd device erasesize is an erasesize of subdevice multiplied by 
> > number of subdevices (in case of equal erasesize subdevices). As 
> > erasesize is commonly considered as a power-of-2 number it is not good 
> > idea to use 3, 5, etc devices.
> Why? I don't see any thing bad with having 3*128KiB eraseblock size...

I agree with you ....... as long as someone is willing to audit all MTD 
client code to certify that no assumption about erase block sizes being 
a power of 2 is present.


Nicolas
