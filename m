Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FM9CS-0001TG-6w
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 14:41:07 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IWJ00CDQO037810@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 14:40:51 -0500 (EST)
Date: Wed, 22 Mar 2006 14:40:51 -0500 (EST)
From: Nicolas Pitre <npitre@mvista.com>
In-reply-to: <4421A4BF.9060406@ru.mvista.com>
To: Vitaly Wool <vwool@ru.mvista.com>
Message-id: <Pine.LNX.4.64.0603221428480.3631@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>
	<1142967444.13740.9.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0603211434261.3631@localhost.localdomain>
	<442111B5.6090308@yandex.ru> <442161C3.80604@intel.com>
	<1143038877.29683.10.camel@sauron.oktetlabs.ru>
	<442168D3.70302@intel.com>
	<1143040557.29683.14.camel@sauron.oktetlabs.ru>
	<44216F99.9040304@intel.com>
	<44217124.20607@ru.mvista.com> <442179EB.9050605@intel.com>
	<4421A4BF.9060406@ru.mvista.com>
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

On Wed, 22 Mar 2006, Vitaly Wool wrote:

> Alexander,
> 
> Let's look at it at the following angle. Striping is a nice concept, as well
> as many other nice concepts that exist in the world. Are they all worth being
> impemented in Linux MTD subsystem? :)

Why not, if you can configure it out.

> OTOH, what is the rationale? Make devices operate faster. Okay, why can't this
> be implemented as mtdconcat optimization?

mtdconcat provides linear access to subdevices.

The stripe module provides _interleaved_ access to subdevices.

That is the fundamental difference.

> What I'd also like to say is that having a lot of threads doesn't look
> attractive to me.

What is the problem with threads?  The kernel already uses them heavily 
for many purposes because it makes things cleaner.

> I'd rather go in for changing the whole MTD subsystem to
> make the API asynchoronus, and then you won't need many threads. But this is a
> rather dramatic change...

But do you realize that any asynchronous implementation will _still_ 
require kernel threads of its own to do the work anyway?  That's the 
reason why there is so many kernel threads running in your kernel 
already.

One thread per subdevice minus 1 is sufficient (note I don't know if it 
is implemented that way though as I didn't look at the code).


Nicolas
