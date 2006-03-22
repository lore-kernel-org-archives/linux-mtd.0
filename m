Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FM6xh-0006qh-U4
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 12:17:45 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MO-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IWJ00NSBHD03N80@VL-MO-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 12:17:25 -0500 (EST)
Date: Wed, 22 Mar 2006 12:17:24 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <1143044379.29683.28.camel@sauron.oktetlabs.ru>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-id: <Pine.LNX.4.64.0603221159300.3631@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>
	<1142967444.13740.9.camel@sauron.oktetlabs.ru>
	<44211B5F.2030200@intel.com>
	<44211E6E.7070406@yandex.ru> <4421263A.7010900@intel.com>
	<1143024670.13740.40.camel@sauron.oktetlabs.ru>
	<442152A5.9020300@intel.com>
	<1143044379.29683.28.camel@sauron.oktetlabs.ru>
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

On Wed, 22 Mar 2006, Artem B. Bityutskiy wrote:

[...]
> I still don't understand your stuff with threads, will ask questions
> later. I'm not alone who does not understand it. So I conclude the
> explanation is crippled, not me.

Please stop being so difficult with Alexander.

The explanations provided so far might not be stellar English, but I 
consider them still quite understandable.  A disk stripe is a common 
concept in computer science so simply saying that the same technique can 
be applied to flash storage should be enough for you to grasp the whole 
idea.  If you are not familiar with the concept it is not Alexander's 
fault and I don't think he should lecture you on the topic.

And regarding my opinion about a MTD stripe layer, well I think this is 
a damn good idea and I wish I had thought about it before myself. It is 
indeed a concept entirely separate from the MTD concat layer.  And it 
doesn't obsolete the concat layer in any ways either.  Both have serious 
advantages and inconvenients to consider before selecting either of 
those.

Now regarding the source I cannot comment as I didn't look at it yet.  
But from the provided description of needed changes to flash drivers I 
suspect I might have one or two suggestions for doing things 
differently.  But that won't happen just yet.


Nicolas
