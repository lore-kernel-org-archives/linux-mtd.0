Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14FIuQ-0000Se-00
	for mtd-list@infradead.org; Sun, 07 Jan 2001 16:43:06 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14FIuP-0000SY-00
	for mtd@infradead.org; Sun, 07 Jan 2001 16:43:05 +0000
Date: Sun, 7 Jan 2001 16:42:56 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Kenneth Johansson <kenneth.johansson@inn.ericsson.se>
cc: <Russ.Dill@asu.edu>,  <nico@cam.org>,  <mtd@infradead.org>
Subject: Re: Supported flash memory
In-Reply-To: <3A55FCE7.C8406CE0@inn.ericsson.se>
Message-ID: <Pine.LNX.4.30.0101071634290.1722-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 5 Jan 2001, Kenneth Johansson wrote:

> David Woodhouse wrote:
> > What do you mean? It's generally considered quite rude for hardware
> > designers to connect nets to _completely_ random places on the chips,
> > although sometimes it wouldn't really surprise me.
>
> Well with SRAM you can intercange any data pin with another data pin
> and likewise with the adress bus and nothing would notice. Doing this
> with ROM or FLASH makes things quite interesting. This would mean that
> anything trying to program the device has to do translation.
>
> If you get random routing to simplify layout to work it would probably
> qualify for the nobel price.

I just looked at the LART schematics. Ouch.

I fixed up the data line munging in cfi_endian.h. Doing a map driver is
left as an exercise for the reader.

static inline cfi32_to_cpu(__u32 x)
{
	__u32 ret;

	ret =  (x & 0x08009000) >> 11;
	ret |= (x & 0x00002000) >> 10;
	ret |= (x & 0x04004000) >> 8;
	ret |= (x & 0x00000010) >> 4;
	ret |= (x & 0x91000820) >> 3;
	ret |= (x & 0x22080080) >> 2;
	ret |= (x & 0x40000400);
	ret |= (x & 0x00040040) << 1;
	ret |= (x & 0x00110000) << 4;
	ret |= (x & 0x00220100) << 5;
	ret |= (x & 0x00800208) << 6;
	ret |= (x & 0x00400004) << 9;
	ret |= (x & 0x00000001) << 12;
	ret |= (x & 0x00000002) << 13;

	return ret;
}
static inline cpu_to_cfi32(__u32 x)
{
	__u32 ret;

	ret =  (x & 0x00010012) << 11;
	ret |= (x & 0x00000008) << 10;
	ret |= (x & 0x00040040) << 8;
	ret |= (x & 0x00000001) << 4;
	ret |= (x & 0x12200104) << 3;
	ret |= (x & 0x08820020) << 2;
	ret |= (x & 0x40000400);
	ret |= (x & 0x00080080) >> 1;
	ret |= (x & 0x01100000) >> 4;
	ret |= (x & 0x04402000) >> 5;
	ret |= (x & 0x20008200) >> 6;
	ret |= (x & 0x80000800) >> 9;
	ret |= (x & 0x00001000) >> 12;
	ret |= (x & 0x00004000) >> 13;

	return ret;
}

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
