Received: from maat.imms.de ([194.95.250.50])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KxMw8-00055Q-1H
	for linux-mtd@lists.infradead.org; Tue, 04 Nov 2008 14:31:16 +0000
Message-ID: <49105CAB.3000706@imms.de>
Date: Tue, 04 Nov 2008 15:31:07 +0100
From: Andre Puschman <andre.puschmann@imms.de>
MIME-Version: 1.0
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: flash read performance
References: <ge6old$oo3$1@ger.gmane.org>
	<20081029114256.GA2239@yoda.jdub.homelinux.org>
	<gea0sh$j97$1@ger.gmane.org> <49097176.5010506@thomson.net>
	<gec051$efd$1@ger.gmane.org> <49098716.1010404@thomson.net>
	<490F096D.5060208@imms.de> <20081104114229.GA1673@shareable.org>
In-Reply-To: <20081104114229.GA1673@shareable.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Arnaud Mouiche <arnaud.mouiche@thomson.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jamie Lokier schrieb:
> I don't know much about this area, but will _writing_ to the flash
> work reliably if ioremap_cached() is used?
>
> -- Jamie
>   

Good point. I only was into reading and so I totally forgot writing ;-)
I gave it a try, although it was terribly slow (only a few kb/s), it worked.
I just did a cp uImage /dev/mtd3. On the other hand, I never tried writing
with the old driver. So I don't know if this is faster.

I also did some more testing with my improved flash-timing parameters,
which yields to read speeds of up to 18-19MB/s, which is really fast 
compared
to 1,3MB/s at the beginning :-)

So for now, this is my result:
- cache and well chosen flash-timings have great impact on (at least) 
read performance

But I think transfer rates > 20MB are possible ..

Anyway, with these results, booting the complete system in nearly (or 
even less than) 2s should be possible.

Regards,
Andre
