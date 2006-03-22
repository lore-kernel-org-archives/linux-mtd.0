Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FM8yG-000188-CZ
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 14:26:20 -0500
Message-ID: <4421A4BF.9060406@ru.mvista.com>
Date: Wed, 22 Mar 2006 22:25:51 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Alexander Belyakov <alexander.belyakov@intel.com>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>		<1142953764.13740.0.camel@sauron.oktetlabs.ru>	<442041BE.9070407@intel.com>		<1142967444.13740.9.camel@sauron.oktetlabs.ru>		<Pine.LNX.4.64.0603211434261.3631@localhost.localdomain>		<442111B5.6090308@yandex.ru>
	<442161C3.80604@intel.com>		<1143038877.29683.10.camel@sauron.oktetlabs.ru>	<442168D3.70302@intel.com>	<1143040557.29683.14.camel@sauron.oktetlabs.ru>
	<44216F99.9040304@intel.com> <44217124.20607@ru.mvista.com>
	<442179EB.9050605@intel.com>
In-Reply-To: <442179EB.9050605@intel.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, Nicolas Pitre <nico@cam.org>,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexander,

Alexander Belyakov wrote:

> as I have already said concatenation is like JBOD in the world of hard 
> drives. JBOD means "just a bunch of disks". Meanwhile striping is like 
> RAID level 0. As you may know JBOD and RAID0 are completely different. 
> Concatenation and striping have only one common thing - each of them 
> makes larger devices. That's all. All the rest are different including 
> new device parameters, writing, reading, erasing routines. Note, that 
> concatenation layer writes/erases/etc from the caller thread, 
> meanwhile striping layer do this from several separate threads, 
> splitting operations by special algorithm.
>
> Moreover the idea is different. Concatenation only purpose is to make 
> larger device from several smaller devices. Striping purpose is to 
> make devices operate faster.

Let's look at it at the following angle. Striping is a nice concept, as 
well as many other nice concepts that exist in the world. Are they all 
worth being impemented in Linux MTD subsystem? :)
OTOH, what is the rationale? Make devices operate faster. Okay, why 
can't this be implemented as mtdconcat optimization?

What I'd also like to say is that having a lot of threads doesn't look 
attractive to me. I'd rather go in for changing the whole MTD subsystem 
to make the API asynchoronus, and then you won't need many threads. But 
this is a rather dramatic change...

Vitaly
