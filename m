Received: from mail.ch.keymile.com ([193.17.201.103])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TXxg6-0007Yd-0P
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 17:20:07 +0000
Message-ID: <50A12FBD.8020801@keymile.com>
Date: Mon, 12 Nov 2012 18:19:57 +0100
From: Gerlando Falauto <gerlando.falauto@keymile.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: state of support for "external ECC hardware"
References: <20121029204227.GA32300@harvey-pc.matrox.com><509B9143.4020506@keymile.com>
 <20121108152125.GR2389@harvey-pc.matrox.com>	
 <509BDE9B.3080909@keymile.com>
 <alpine.DEB.2.00.1211090938500.29771@lnxricardw.se.axis.com>
In-Reply-To: <alpine.DEB.2.00.1211090938500.29771@lnxricardw.se.axis.com>
Content-Type: text/plain;
	charset=ISO-8859-15;
	format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Brunck, Holger" <Holger.Brunck@keymile.com>,
 Christopher Harvey <charvey@matrox.com>, "Bigler,
 Stefan" <Stefan.Bigler@keymile.com>, Ivan Djelic <ivan.djelic@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everyone,

first of all I am very grateful for your feedback. Thanks a lot to all 
of you!!

On 11/09/2012 09:46 AM, Ricard Wanderlof wrote:

> Some manufacturers (Micron for instance I believe) have started to deliver
> 1 Gb chips using a higher density technology where they specify a
> requirement for 4-bit ECC. These naturally exhibit a much higher bitflip
> rate.

Would there be any reason *NOT* to use 4-bit ECC with parts which do not 
require it? Apart from performance, of course.

I mean, we need to be as flexible as possible as far as hardware parts 
are concerned, as long as the basic requirements are met.
So we would like to have a single kernel which can run on different 
flash parts, past, present, and (as far as we can predict) future.
As pointed out within this thread, dynamic detection might be a bit 
tricky, so perhaps finding a common solution might be a good compromise.

> At any rate, the ECC algorithm itself should be able to take care of bit
> flips in the ECC codes. For the 1-bit algorithm in nand_ecc.c it does this
> by comparing the computed ECC with the actual ECC; if there's a difference
> of exactly one bit (rather than a more complex diff which after
> calculations points out the flipped bit in the main area), it is assumed
> that the bitflip is in the ECC area rather than the data. I don't know how
> BCH does this though.

Ivan, I came to understand (but I am not sure), that the implementation 
you provided (and currently mainlined) *DOES* handle this correctly. It 
was instead an old one which did not handle this properly. Is my 
understanding correct?

Thank you again,
Gerlando




>
> /Ricard
